if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "joel-porquet/zsh-dircolors-solarized"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light joel-porquet/zsh-dircolors-solarized
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

