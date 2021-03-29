#!/bin/bash

# Source global definitions
[[ -f "/etc/bashrc" ]] && source "/etc/bashrc"
[[ -f "/etc/profile" ]] && source "/etc/profile"

_file_success() {
  # local script="${1:s/\/home\/nicholas/~}"
  echo -e "\e[0;32m ✓ \e[0;37m$1"
}

# load bash functions, aliases, exports
[[ -f "$HOME/.shell/.bashrc.colors" ]] && source "$HOME/.shell/.bashrc.colors"
[[ -f "$HOME/.shell/.bashrc.funcs" ]] && source "$HOME/.shell/.bashrc.funcs"
[[ -f "$HOME/.shell/.bashrc.exports" ]] && source "$HOME/.shell/.bashrc.exports"
[[ -f "$HOME/.shell/.bashrc.aliases" ]] && source "$HOME/.shell/.bashrc.aliases"


case "$HOSTNAME" in
  andromeda) HOSTCOLOR=$_CYAN ;;
  calypso) HOSTCOLOR=$_MAGENTA ;;
  minerva) HOSTCOLOR=$_RED ;;
  *) HOSTCOLOR=$_GREEN2 ;;
esac

# echo \033[38;5;78m
# echo \033[38;5;110m

totalsize() {
  totalsize=0
  for filesize in $(ls -al . | grep "^-" | awk '{print $5}')
  do
    let totalsize=$totalsize+$filesize/1024
  done
  echo -n "$totalsize"
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/" | tr -d "\n"
}

parse_git_name() {
	git remote -v 2> /dev/null | head -n 1 | sed -e "s/.*\/\([^ ]*\)/\1/" -e "s/.git (fetch)//" | tr -d "\n"
}

parse_git_tag() {
  _GIT_TAG=$(git name-rev --tags --name-only $(git rev-parse HEAD) | sed -e "s/^v//" | sed -e "s/\^0$//")
  [ "$_GIT_TAG" != 'undefined' ] && echo " $_GIT_TAG"
}

git_line() {
	_GIT_NAME=$(parse_git_name)
  _GIT_BRANCH=$(parse_git_branch)
  _NAME_COLOR=$_GIT_NAME_COLOR
  [ "$_GIT_BRANCH" == "master" ] && _NAME_COLOR=$_GIT_BRANCH_MASTER_COLOR
  [ "$_GIT_BRANCH" == "stage" ] && _NAME_COLOR=$_GIT_BRANCH_STAGE_COLOR
  [ "$_GIT_BRANCH" == "development" ] && _NAME_COLOR=$_GIT_BRANCH_DEVELOPMENT_COLOR
  # [[ ! -z "$_GIT_NAME" ]] && echo -n "($_NAME_COLOR`parse_git_name`$_GIT_ARROW_COLOR > $_GIT_BRANCH_COLOR$_GIT_BRANCH:$_GIT_TAG_COLOR`parse_git_tag`)"
  [[ ! -z "$_GIT_NAME" ]] && echo -n "($_NAME_COLOR`parse_git_name`$_GIT_TAG_COLOR`parse_git_tag`)"
}

git_branch() {
  _GIT_BRANCH=$(parse_git_branch)
  [[ ! -z "$_GIT_BRANCH" ]] && echo -n " ($_WHITE$_GIT_BRANCH$_END)"
}

vi_mode() {
  _VI_MODE=`bind -v | awk '/keymap/ {print $NF}'`
  if [ "$_VI_MODE" = 'vi-insert' ]; then
    echo -n $_GREEN2
  else
    echo -n $_GREEN
    # echo -n $_RED
  fi
}

set_bash_prompt() {
  PS1="$HOSTCOLOR\n\u@\H$_WHITE \d, \@\n$_GREEN2\w $_WHITE(`totalsize`K)`git_branch`\n└─`git_line``vi_mode` $ $_WHITE"
  # output cursor escape sequence every command
  echo -e "\e[1 q"
}

PROMPT_COMMAND=set_bash_prompt

# execute command passed through SSH
if [[ -n "$SSHCMD" ]]; then
    eval $SSHCMD
fi

# change 777 background color
LS_COLORS=$LS_COLORS'ow=1;96:'
export LS_COLORS

#\a : an ASCII bell character (07)
#\d : the date in "weekday month date" format (e.g., "tue may 26")
#\D{format} :	the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. the braces are required
#\e : an ASCII escape character (033)
#\h : the hostname up to the first '.'
#\H : the hostname
#\j : the number of jobs currently managed by the shell
#\l : the basename of the shellâ€™s terminal device name
#\n : newline
#\r : carriage return
#\s : the name of the shell, the basename of $0 (the portion following the final slash)
#\t : the current time in 24-hour HH:MM:SS format
#\T : the current time in 12-hour HH:MM:SS format
#\@ : the current time in 12-hour am/pm format
#\A : the current time in 24-hour HH:MM format
#\u : the username of the current user
#\v : the version of bash (e.g., 2.00)
#\V : the release of bash, version + patch level (e.g., 2.00.0)
#\w : the current working directory, with $HOME abbreviated with a tilde
#\W : the basename of the current working directory, with $HOME abbreviated with a tilde
#\! : the history number of this command
#\# : the command number of this command
#\$ : if the effective UID is 0, a #, otherwise a $
#\nnn : the character corresponding to the octal number nnn
#\\ : a backslash
#\[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
#\] : end a sequence of non-printing characters

# only works in tty $TERM="linux" not pts $TERM=xterm
cursor_style_default=0 # hardware cursor (blinking)
cursor_style_invisible=1 # hardware cursor (blinking)
cursor_style_underscore=2 # hardware cursor (blinking)
cursor_style_lower_third=3 # hardware cursor (blinking)
cursor_style_lower_half=4 # hardware cursor (blinking)
cursor_style_two_thirds=5 # hardware cursor (blinking)
cursor_style_full_block_blinking=6 # hardware cursor (blinking)
cursor_style_full_block=16 # software cursor (non-blinking)

cursor_background_black=0 # same color 0-15 and 128-infinity
cursor_background_blue=16 # same color 16-31
cursor_background_green=32 # same color 32-47
cursor_background_cyan=48 # same color 48-63
cursor_background_red=64 # same color 64-79
cursor_background_magenta=80 # same color 80-95
cursor_background_yellow=96 # same color 96-111
cursor_background_white=112 # same color 112-127

cursor_foreground_default=0 # same color as the other terminal text
cursor_foreground_cyan=1
cursor_foreground_black=2
cursor_foreground_grey=3
cursor_foreground_lightyellow=4
cursor_foreground_white=5
cursor_foreground_lightred=6
cursor_foreground_magenta=7
cursor_foreground_green=8
cursor_foreground_darkgreen=9
cursor_foreground_darkblue=10
cursor_foreground_purple=11
cursor_foreground_yellow=12
cursor_foreground_white=13
cursor_foreground_red=14
cursor_foreground_pink=15

cursor_styles="\e[?${cursor_style_full_block};${cursor_foreground_black};${cursor_background_green};c" # only seems to work in tty

eval "$(rbenv init -)"

# disable flow control
stty -ixon

_script="${BASH_SOURCE:-$0}"
_script=$(readlink --canonicalize-existing $_script)
_file_success $_script
