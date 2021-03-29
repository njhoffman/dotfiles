#!/bin/bash

dryrun=0

[[ $dryrun -ne 1 ]] && pkill -x polybar

if [ -n "$MON_CFG" ]; then
  IFS=':'; set -f
  monitors=($MON_CFG)
  IFS=','; set -f
  for monitor in "${monitors[@]}"; do
    port="${monitor#*port=}"
    port="${port%%;*}"
    pbars="${monitor#*polybar=}"
    pbars=(${pbars%%;*})
    for pbar in "${pbars[@]}"; do
      if [[ "$dryrun" -gt 0 ]]; then
        echo MONITOR="$port" polybar --reload "$pbar" &
      else
        MONITOR="$port" polybar --reload "$pbar" &
      fi
    done
  done
  exit 0
else
  # if polybars not defined start top bar on every monitor
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [[ "$dryrun" -gt 0 ]]; then
      echo MONITOR=$m polybar --reload top &
    else
      MONITOR=$m polybar --reload top &
    fi
  done
fi

