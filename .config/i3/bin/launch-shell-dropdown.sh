#!/bin/bash

export TERMINAL="termite"
export _TMUX_LAUNCH=1
WHEREAMI=$(cat /tmp/whereami)
# termite --directory="$WHEREAMI"

tdrop -ma -w 80% -x 10% -y 1 i3-sensible-terminal

# tdrop dropdown "i3-sensible-terminal \
#   --directory=\"$WHEREAMI\" \
#   --title \"dropdown\" \
#   --config=\"$HOME/.config/termite/config.09\""

# i3dropdown dropdown "i3-sensible-terminal \
#   --directory=\"$WHEREAMI\" \
#   --title \"dropdown\" \
#   --config=\"$HOME/.config/termite/config.09\""
