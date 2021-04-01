#!/bin/bash
export TERMINAL="alacritty"

WHEREAMI=$(cat /tmp/whereami)

i3-sensible-terminal \
  --working-directory="$WHEREAMI" \
  --directory="$WHEREAMI" \
  --title "__scratchpad__" \
  --config-file="$HOME/.config/alacritty/alacritty.cfg"
