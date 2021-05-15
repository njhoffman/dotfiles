if [[ "$ZSH_LOADER" == "zplug" ]]; then
  if [[ -z "$(command -v zplug)" ]]; then
    # curl -sL --proto-redir -all,https \
    #   https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    export ZPLUG_HOME="$HOME/.zplug"
    [[ ! -d ~/.zplug ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
  fi
  source "$ZPLUG_HOME/init.zsh"
  # zplug zplug/zplug, hook-build:'zplug --self-manage'
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
      print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
      print -P "%F{160}▓▒░ The clone has failed.%f%b"
  fi
  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

