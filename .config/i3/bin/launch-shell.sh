#!/bin/bash

export TERMINAL="termite"
export WHEREAMI=$(cat /tmp/whereami)
export _TMUX_LAUNCH=1

function get_monitor {
  OFFSET_RE="\+([-0-9]+)\+([-0-9]+)"

  # Get the window position
  eval "$(xdotool getmouselocation --shell)"

  # Loop through each screen and compare the offset with the window coordinates.
  monitor_index=0
  while read name width height xoff yoff; do
    if [ "${X}" -ge "$xoff" \
      -a "${Y}" -ge "$yoff" \
      -a "${X}" -lt "$(($xoff+$width))" \
      -a "${Y}" -lt "$(($yoff+$height))" ]
      then
        monitor=$name
        break
    fi
    ((monitor_index++))
  done < <(xrandr | grep -w connected |
    sed -r "s/^([^ ]*).*\b([-0-9]+)x([-0-9]+)$OFFSET_RE.*$/\1 \2 \3 \4 \5/" |
    sort -nk4,5)

  if [ ! -z "$monitor" ]; then
    echo $monitor
    exit 0
  else
    echo "Couldn't find any monitor for the current window." >&2
    exit 1
  fi
}

curr_monitor=`get_monitor`
if [[ -n "$MON_CFG" && -n "$curr_monitor" ]]; then
  IFS=':'; set -f
  monitors=($MON_CFG)
  for monitor in "${monitors[@]}"; do
    port="${monitor#*port=}"
    port="${port%%;*}"
    if [ "$curr_monitor" == "$port" ]; then
      termite_config="${monitor#*termite=}"
      termite_config="${termite_config%%;*}"
      typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
      i3-sensible-terminal \
        --directory="$WHEREAMI" \
        --exec "$SHELL -ic tmux" \
        --config="$HOME/.config/termite/$termite_config"
    fi
  done
  exit 0
else
  echo "DOING IT !!"
  i3-sensible-terminal --directory="$WHEREAMI" # --exec="$cmd"
fi

# termite --directory="$WHEREAMI"
