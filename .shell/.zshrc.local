#!/bin/zsh

# TODO: modify based on tput cols
# powerlevel10k/classic/elements.user.zsh

export _CFG_SHELL_VCS_REMOTE=0
export _CFG_SHELL_VCS_STATUS=1
export _CFG_SHELL_VCS_TAG=1

export PATH="$HOME/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH=$PATH:$HOME/bin/wal

export LC_ALL="en_US.UTF-8"
# (wal -i ~/.cache/wal)

# Powerline prompt customization, font mode must be specified before zsh theme
export P9K_MODE="nerdfont-complete" # nerdfont-complete awesome-patched awesome-fontconfig
export P9K_STATUS_VERBOSE="true"

# export P9K_AWS_DEFAULT_PROFILE="spadash-2"
export P9K_AWS_DEFAULT_PROFILE="default"
# export AWS_REGION="us-east-2"

export _CFG_LOAD_NERDFONT_ICON=1

ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_AUTO_TITLE="true"

export KUBECONFIG="$HOME/.kube/minikube"

local script=${(%):-%x}
_file_success $script
