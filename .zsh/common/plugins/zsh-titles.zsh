# set terminal and tmux title to directory/program being run

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "jreese/zsh-titles"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light jreese/zsh-titles
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  antigen bundle jreese/zsh-titles
fi

