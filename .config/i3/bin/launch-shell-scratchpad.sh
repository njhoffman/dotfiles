#!/bin/bash

export TERMINAL="termite"
WHEREAMI=$(cat /tmp/whereami)

i3-sensible-terminal \
  --directory="$WHEREAMI" \
  --title "__scratchpad__" \
  --config="$HOME/.config/termite/config.09"
  # --exec "$SHELL -ic tmux new -A -s float" \
