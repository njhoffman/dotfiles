#!/bin/bash

is_only_window="[[ `xdotool search --all --onlyvisible --desktop \
     "$(xprop -notype -root _NET_CURRENT_DESKTOP |  cut -c 24-)" \
     "" 2>/dev/null | wc -l` -gt 1 ]] &&  true"

case "$1" in
  left)
    if [[ $is_only_window ]]; then tmux select-pane -L
    else i3-msg "focus left"; fi
    ;;
  up)
    if [[ $is_only_window ]]; then tmux select-pane -U
    else i3-msg "focus up"; fi
    ;;
  right)
    if [[ $is_only_window ]]; then tmux select-pane -R
    else i3-msg "focus right"; fi
    ;;
  down)
    if [[ $is_only_window ]]; then tmux select-pane -D
    else i3-msg "focus down"; fi
    ;;
  *)
    exit
    ;;
esac


