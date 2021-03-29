#!/bin/zsh

# Simple colorize for bash by means of sed
#
# Usage examples:
#   tail -f somemaillog | xcolorize white '^From: .*' bell
#   tail -f somemaillog | xcolorize white '^From: \/.*' green 'Folder: .*'
#   tail -f somemaillog | xcolorize --unbuffered white '^From: .*'
#
# Notes:
#   Regular expressions need to be suitable for _sed --regexp-extended_
#   Slashes / need no escaping (we use ^A as delimiter).
#   \/ splits the coloring (similar to procmailrc. Matches behind get color.
#   Even "white '(for|to) \/(her|him).*$'" works :) Surprisingly ;)
#   To color the string '\/' use the regular expression '\\()/'.
#   If the 1st argument is -u or --unbuffered, _sed_ will be run so.

# support direct 256 color codes for color argument
function xcolorize256() {
  local normal=$'\e[0m'                           # (works better sometimes)

  local bell=$(tput bel)                          # bell/beep
  local y=0

  # Make output unbuffered? (Pass argument -u|--unbuffered to _sed_.)
  if [ "/$1/" = '/-u/' -o "/$1/" = '/--unbuffered/' ] ; then
    local UNBUFFERED='-u'; shift
  else
    local UNBUFFERED=""
  fi

  # produce separator character ^A (for _sed_)
  local A=$(echo | tr '\012' '\001')

  # compile all rules given at command line to 1 set of rules for SED
  while [ "/$1/" != '//' ] ; do
    local c1=''; local re='';  local beep=''
    c1=$1 ; re="$2" ; shift 2 || break
    # if a beep is requested in the optional 3rd parameter set $beep
    [ "/$1/" != '//' ] && [[ ( "$1" = 'bell' || "$1" = 'beep' ) ]] \
      && beep=$bell && shift
    # if the regular expression includes \/ we split the substitution
    if [ "/${re/*\\\/*/}/" = '//' ] ; then
      # we need to count "("s before the \/ (=$left)
      local left="${re%\\/*}"; local leftlength=${#left}
      # first we count "\("
      local dummy=${left//\\(}; escdgroups=$(( (leftlength-${#dummy})/2 ))
      # now "(" (and we add 2 for the groups used for ($re) in $sedrules)
      local dummy=${left//(}; groupcnt=$((leftlength-${#dummy}-escdgroups+2))
      # replace \/ with )( so below we get (left-re)(right-re)
      re="${re/\\\//)(}"
      local sedrules="$sedrules;s$A($re)$A\1\\$c1\\$groupcnt$beep$normal${A}g"
      sedrules="${sedrules}I"   # add case insensitive
    else
      local sedrules="$sedrules;s$A($re)$A\\$c1\1$beep$normal${A}g"
      sedrules="${sedrules}I"   # add case insensitive
    fi
    # limit parsing of arguments
    (( y++ && y>888 )) && { echo "$0: too many arguments" >&2; return 1; }
  done

  # call sed to do the main job
  # sed $UNBUFFERED --regexp-extended -e "$sedrules"
  out=$(ssed -R $UNBUFFERED -e "$sedrules")
  echo -e "$out"

  return
}

