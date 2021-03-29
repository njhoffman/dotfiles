#!/bin/zsh

# netstat | xcols netstat
# loop -n 5 "netstat | xcols netstat"
# ssed needs to be installed: sudo apt-get install ssed

source "${0%/*}/xcols/xcolorize.sh"
source "${0%/*}/xcols/xcol.sh"

_XPATTERNSPATH="${0%/*}/xcols/xpatterns.sh"

function xcols() {
  source "$_XPATTERNSPATH"

  if [[ -v "_patterns[$1]" ]]; then
    eval "xcol $_patterns[$1]"
  fi

  if [[ ! -v "_patterns[$1]" ]]; then
    echo "\nPattern '$1' not found"
    echo "Must be one of: "
    for key in "${(k)_patterns[@]}"; do
      echo "  $key"
    done
    echo "\n\n"
  fi
}
