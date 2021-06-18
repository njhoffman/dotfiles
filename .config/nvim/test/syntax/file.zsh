#!/bin/zsh

function nvm_upgrade() {
	nvm install $1 --reinstall-packages-from=`nvm version`
	nvm use $1
	npm install -g npm
	npm upgrade -g
}
alias nvm-upgrade=nvm_upgrade

function loop() {
  local cmdcolor="\e[38;5;41m"
  local normal=$'\e[0m'
  local timecolor="\e[38;5;241m"

  local delay=2
  local args="$@"
  if [[ "$1" == "-n" ]]; then
    delay="$2"
    args=${args/"-n $delay "/""}
  fi

  # TODO: make formatting commands like head, tail, and xcols a different color
  while [ 1 ]; do
    output=`eval "$args"`
    clear
    # dont wrap lines, expands to full screen on each refresh
    setterm -linewrap off
    printf "Loop $delay.0s $timecolor ($(date +%T)) $normal"
    printf "$cmdcolor"
    printf "  ${args}"
    # printf "${args//\n/\\n}"
    printf "\n$normal\n$output\n"
    setterm -linewrap on
    sleep $delay
  done
}

function list_completions {
	for command completion in ${(kv)_comps:#-*(-|-,*)}
	do
		printf "%-32s %s\n" $command $completion
	done | sort
}

# Like watch, but with color
function refresh {
  tput clear || exit 2; # Clear screen. Almost same as echo -en '\033[2J';
  bash -ic "$@";
}

function cwatch {
  while true; do
    CMD="$@";
    # Cache output to prevent flicker. Assigning to variable
    # also removes trailing newline.
    output=`refresh "$CMD"`;
    # Exit if ^C was pressed while command was executing or there was an error.
    exitcode=$?; [ $exitcode -ne 0 ] && exit $exitcode
    printf '%s' "$output";  # Almost the same as echo $output
    sleep 1;
  done;
}

# watch and run a shell file
function shellwatch {
  local clr_green="\e[38;5;41m"
  local nc=$'\e[0m'
  local clr_gray="\e[38;5;241m"

  shellfile="$PWD/$1"
  touch "$shellfile"
  chmod +x "$shellfile"
  while inotifywait -q -e close_write "$shellfile"; do
    clear
    printf "$clr_gray $shellfile $nc $(date +%T)$nc\n\n"
    sh "$shellfile"
    printf "\n\n"
    shellcheck "$shellfile"
  done
}

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# source "${0%/*}/functions/cd.zsh"
source "${0%/*}/functions/xcols.sh"
source "${0%/*}/functions/aws_profile.sh"
source "${0%/*}/functions/docker_profile.sh"
source "${0%/*}/functions/scale.sh"

local script=${(%):-%x}
_file_success $script
# vim: syn=zsh
