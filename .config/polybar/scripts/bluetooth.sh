#!/bin/bash

is_powered=$(bluetoothctl show | grep "Powered: yes" | wc -c)
is_connected=$(echo info | bluetoothctl | grep 'Device' | wc -c)
connected_name=$(echo info | bluetoothctl | grep -oP 'Name: \K[\w\s-]+')

if [ $is_powered -eq 0 ]; then
  echo "%{F#66ffffff}"
else
  if [ $is_connected -eq 0 ]; then
    echo ""
  fi

  echo "%{F#2193ff}%{F-} %{T2}$connected_name%{T-}"
fi

