if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "lukechilds/zsh-better-npm-completion", defer:2
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light lukechilds/zsh-better-npm-completion
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi
