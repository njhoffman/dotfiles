
if [[ "$ZSH_LOADER" == "zplug" ]]; then
  # zplug 'dracula/zsh', as:theme
  # zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
  zplug "romkatv/powerlevel10k", as:theme, depth:1
  # zplug "eendroroy/alien-minimal"
  # zplug mafredri/zsh-async, from:github
  # zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  echo "zinit"
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi
