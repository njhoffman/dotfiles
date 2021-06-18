#!/bin/bash

export TERMINAL="alacritty"
WHEREAMI=$(cat /tmp/whereami)

i3-sensible-terminal \
  --working-directory "$WHEREAMI" \
  --title "__scratchpad__" \
  --config-file "$HOME/.config/alacritty/alacritty.yml" \
  --command "$HOME/bin/tmux-float.sh"
# --command "$SHELL -ic /usr/local/bin/tmux new -A -s float"

# export TERMINAL="xterm-termite"
# WHEREAMI=$(cat /tmp/whereami)

# i3-sensible-terminal \
#   --directory="$WHEREAMI" \
#   --title="__scratchpad__" \
#   --config="$HOME/.config/termite/config.09" \
#   --exec="$SHELL -ic tmux new -A -s float"
