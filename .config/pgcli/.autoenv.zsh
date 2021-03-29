#!/usr/bin/zsh

if [[ $autoenv_event == "enter" ]]; then
  autoenv_source_parent
  [[ -x ./makeconfig.sh ]] && ./makeconfig.sh
fi
