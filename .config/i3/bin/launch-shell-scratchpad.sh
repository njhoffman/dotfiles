#!/bin/bash

export TERMINAL="termite"
WHEREAMI=$(cat /tmp/whereami)

i3-sensible-terminal \
  --directory="$WHEREAMI" \
  --title "__scratchpad__" \
  --exec "$SHELL -ic tmux" \
  --config="$HOME/.config/termite/config.09"
