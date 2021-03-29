#!/bin/bash

export PATH=~/bin:$PATH

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -U $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
# xrdb -m ~/.cache/wal/colors.xresources

# polybar i3wmthemer_bar &
polybar top-wide & polybar top-wide-alt &
