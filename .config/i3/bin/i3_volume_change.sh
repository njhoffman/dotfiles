#!/bin/bash

# TODO: figure out active channel for volume control

vol=$1
if [ $vol == "mute" ]; then
  pactl set-sink-mute 0 toggle && true
  pactl set-sink-mute 1 toggle && true
  pactl set-sink-mute 2 toggle && true
  pactl set-sink-mute 3 toggle && true
  pactl set-sink-mute 4 toggle && true
  pactl set-sink-mute 5 toggle && true
else
  pactl set-sink-volume 0 "$vol" && true
  pactl set-sink-volume 1 "$vol" && true
  pactl set-sink-volume 2 "$vol" && true
  pactl set-sink-volume 3 "$vol" && true
  pactl set-sink-volume 4 "$vol" && true
  pactl set-sink-volume 5 "$vol" && true
fi


