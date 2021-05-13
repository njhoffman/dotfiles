if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "mollifier/anyframe"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light mollifier/anyframe
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

#  expressly specify to use peco
# expressly specify to use fzf-tmux
zstyle ":anyframe:selector:" use fzf-tmux
# expressly specify to use fzf
# zstyle ":anyframe:selector:" use fzf

# specify path and options for peco, percol, or fzf
zstyle ":anyframe:selector:peco:" command 'peco --no-ignore-case'
zstyle ":anyframe:selector:percol:" command 'percol --case-sensitive'
zstyle ":anyframe:selector:fzf-tmux:" command 'fzf-tmux --extended'
zstyle ":anyframe:selector:fzf:" command 'fzf --extended'

# vim:ft=zsh
