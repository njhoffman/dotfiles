if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "zsh-users/zsh-syntax-highlighting", defer:3
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light zsh-users/zsh-syntax-highlighting
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi
