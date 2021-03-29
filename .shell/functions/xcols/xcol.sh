#!/bin/zsh

_XCOLORSPATH="${0%/*}/xcolors.sh"
_XPALLETESPATH="${0%/*}/xpalletes.sh"
_XCOLORS=()

# Colorize your standard output using xcolorize with a grep-like usage
#
# Usage piping from stdin:
#   mount | xcol mnt "sda." "sdb." cgroup tmpfs proc
#
# Usage reading from a file:
#   xcol pae fpu vme mhz sse2 cache cores /proc/cpuinfo
#
# lspci | xcol audio vga pci usb amd ati hdmi ethernet radeon amd intel
# tail -f /var/log/somelog.log | xcol error warning info denied filtered
#

# colorize stdout with different palletes
# modified to allow palletes
function xcol() {

  source "$_XPALLETESPATH"
  eval "local xdef=( ${_palletes[$1]} )"
  shift

  _assign_xcolors $xdef

  [ -t 0 ] && local STDIN=0 || local STDIN=1

  if [[ $STDIN == 0 ]]; then
    local FILE=$argv[$#];                         # last argument is the file name
    argv[$#]=()                                   # remove last argument
  fi

  local IDX=1                                     # rotate colors in a cycle
  for arg in $argv[@]; do
    local ARGS=( ${ARGS[@]} ${_XCOLORS[$IDX]} $arg )
    IDX=$(( IDX + 1 ))
    [[ $IDX == ${#_XCOLORS[@]} ]] && IDX=1
  done
  [[ $STDIN == 1 ]] && {
    xcolorize256 --unbuffered ${ARGS[@]}
    } || {
    cat $FILE | xcolorize256 --unbuffered ${ARGS[@]}
  }
}

# assign color pallete based on template from arg1 string
function _assign_xcolors() {
  source "$_XCOLORSPATH"

  local xdef=( $@ )

  for i in "${xdef[@]}"; do
    local codeclr="\e[38;5;${_colors[$i]}m"
    _XCOLORS+=("$codeclr")
  done
}
