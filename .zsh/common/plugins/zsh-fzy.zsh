if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug aperezdc/zsh-fzy
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  echo "zinit"
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

zstyle :fzy:tmux    enabled      no

zstyle :fzy:history show-scores  no
zstyle :fzy:history lines        ''
zstyle :fzy:history prompt       'history >> '
zstyle :fzy:history command      fzy-history-default-command

zstyle :fzy:file    show-scores  no
zstyle :fzy:file    lines        ''
zstyle :fzy:file    prompt       'file >> '
zstyle :fzy:file    command      fzy-file-default-command

zstyle :fzy:cd      show-scores  no
zstyle :fzy:cd      lines        ''
zstyle :fzy:cd      prompt       'cd >> '
zstyle :fzy:cd      command      fzy-cd-default-command

zstyle :fzy:proc    show-scores  no
zstyle :fzy:proc    lines        ''
zstyle :fzy:proc    prompt       'proc >> '
zstyle :fzy:proc    command      fzy-proc-default-command

# ALT-C: cd into the selected directory
# CTRL-T: Place the selected file path in the command line
# CTRL-R: Place the selected command from history in the command line
# CTRL-P: Place the selected process ID in the command line
# bindkey '\ec' fzy-cd-widget
# bindkey '^T'  fzy-file-widget
# bindkey '^R'  fzy-history-widget
# bindkey '^P'  fzy-proc-widget
