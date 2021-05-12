#!/bin/zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export POWERLEVEL9K_INSTANT_PROMPT=quiet
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# p10k-lean, pure, rainbow, classic, robbyrussel
p10k_theme="$ZPLUG_REPOS/romkatv/powerlevel10k/config/p10k-pure.zsh"
[[ -e "$p10k_theme" ]] && source "$p10k_theme"
