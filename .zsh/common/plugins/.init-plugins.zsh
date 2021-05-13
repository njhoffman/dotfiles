if [[ "$ZSH_LOADER" == "zplug" ]]; then
  if [[ -z "$(command -v zplug)" ]]; then
    # curl -sL --proto-redir -all,https \
    #   https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    export ZPLUG_HOME="$HOME/.zplug"
    [[ ! -d ~/.zplug ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
  fi
  source "$ZPLUG_HOME/init.zsh"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  echo "zinit"
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

