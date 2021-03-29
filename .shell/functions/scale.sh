#!/bin/bash

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
    # exit 0
  else
    echo "Couldn't find any monitor for the current window." >&2
    # exit 1
  fi
}

function scale_func {
  curr_monitor=`get_monitor`
  scale_num="${1}x${1}"
  # TODO: scale position
  xrandr --output "$curr_monitor" --scale "$scale_num"
  pkill -USR1 polybar
}

