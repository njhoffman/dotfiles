#!/bin/zsh

### move to ~/.zshrc, will load files from .shell directory
# zmodload zsh/zprof

START=$(date +%s.%N)

# load password keychain
keychain id_rsa --agents ssh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/.shell/.zshrc.highlights
# ~/bin/shellstart
# echo -ne "\e[5 q"

home_dir=${(%):-%-2N} # only include two leadining path components
[[ -f "$home_dir/.shell/.zshrc" ]] && source "$home_dir/.shell/.zshrc"

END=$(date +%s.%N)
DIFF=$(printf '%.3g' $(echo "$END - $START" | bc))
# print -P "\n %F{247} Loaded zsh shell scripts in %F{255}${DIFF}s%f\n"
print -P "%F{247} Loaded scripts in %F{255}${DIFF}s%f"
# print -P "%F{247}%F{255}    ${DIFF}s%f\n"

# open menu-completion with ^N
bindkey -r '^N'
bindkey '^N' menu-complete

export rvmsudo_secure_path=1
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export _SHELL_INITIALIZED=1
# zprof > ~/.zshprof

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
