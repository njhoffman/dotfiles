if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "kazhala/dotbare"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light kazhala/dotbare
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  antigen bundle kazhala/dotbare
fi
