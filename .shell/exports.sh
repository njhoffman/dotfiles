#!/bin/bash

export TERM="xterm-256color"
# export TERM="xterm-color"
# export TERM="vte-256color"
# curl -LO http://invisible-island.net/datafiles/current/terminfo.src.gz
# gunzip terminfo.src.gz
# tic terminfo.src

export SELENIUM_SERVER_JAR=/usr/local/bin/selenium-server-standalone-2.43.1.jar
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TZ='America/Chicago'
export NO_AT_BRIDGE=1 # turn off warning of connection to dbus for a11y features
# no=00;38;5;244:rs=0:di=00;38;5;33:
LS_COLORS=$LS_COLORS'ow=1;96:'
export LS_COLORS
export EXA_COLORS="da=1;34"


if [[ -z "$PKG_CONFIG_PATH" ]]; then
  export PKG_CONFIG_PATH=$(pkg-config --variable pc_path pkg-config)
fi

# fi Normal file
# di Directory
# ex Executable file
# pi Named pipe
# so Socket
# bd Block device
# cd Character device
# ln Symlink
# or Broken symlink
# PERMISSIONS
# ur User +r bit
# uw User +w bit
# ux User +x bit (files)
# ue User +x bit (file types)
# gr Group +r bit
# gw Group +w bit
# gx Group +x bit
# tr Others +r bit
# tw Others +w bit
# tx Others +x bit
# su Higher bits (files)
# sf Higher bits (other types)
# xa Extended attribute marker
# FILE SIZES
# sn Size numbers
# sb Size unit
# df Major device ID
# ds Minor device ID
# OWNERS AND GROUPS
# uu A user that’s you
# un A user that’s not
# gu A group with you in it
# gn A group without you
# HARD LINKS
# lc Number of links
# lm A multi-link file
# GIT
# ga New
# gm Modified
# gd Deleted
# gv Renamed
# gt Type change
# DETAILS AND METADATA
# xx Punctuation
# da Timestamp
# in File inode
# bl Number of blocks
# hd Table header row
# lp Symlink path
# cc Control character
# OVERLAYS
# bO Broken link path

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval `ssh-agent -s`
#     ssh-add
# fi
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'
export VIMPAGER_VIM='/usr/local/bin/nvim -u ~/.vimrc'
# export PAGER=nvimpager
export PAGER="less -EFXRS"
export BAT_THEME=ansi-dark
# export VIMPAGER_RC='~/.vimrc'

export ANSIBLE_CONFIG="$HOME/.config/ansible/ansible.cfg"
export ANSIBLE_LOAD_CALLBACK_PUGINS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export ANDROID_HOME=$HOME/Android/Sdk
export DEFAULT_JVM_OPTS='"-Dcom.android.sdklib.toolsdir=$APP_HOME" -XX:+IgnoreUnrecognizedVMOptions'

# android sdk tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH=$PATH:~/.rbenv/bin:~/.rbenv/plugins/ruby-build/bin

export PATH="/usr/lib/postgresql/10/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/sbin:$PATH"

export GOPATH=$HOME/go
export GOROOT=/home/linuxbrew/.linuxbrew/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export KREW_ROOT=~/.krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# export XDG_CONFIG_HOME=/usr/local/lib/python2.7/dist-packages/powerline:~/.config/powerline:~/.config
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config
export POWERLINE_CONFIG_PATHS=/home/$USER/.shell/powerline:/home/$USER/.shell/.powerline:/home/$USER/.config/powerline
export NODE_PATH=$(npm root -g)

export PATH=$PATH:~/.bin:~/bin:~/bin/aws:~/bin/docker:/usr/local/bin:~/.local/bin
export PATH="$PATH:/usr/local/aws-cli/v2/current/bin"

# Find your Python User Base path (where Python --user will install packages/scripts)
USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
export PATH=$PATH:/home/linuxbrew/.linxbrew/sbin

[ -f ~/.shell/exports.fzf.sh ] && load_file ~/.shell/exports.fzf.sh

export CHEAT_USE_FZF=true

# superman (man in vim)
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
# complete -o default -o nospace -F _man vman

export COLUMNS="120"
export PATH="$PATH:/home/nicholas/ACLI"

export KUBECONFIG=$KUBECONFIG:~/.kube/minikube:~/.kube/spadash-dev0-eks:~/.kube/spadash-prod0-eks

# e.g. I have all my dotfiles stored in folder $HOME/.myworld and symlinks all of them to appropriate location.
# export DOTBARE_DIR="$HOME/.myworld/.git"
# export DOTBARE_TREE="$HOME/.myworld"
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"

# tmux
[[ -z "$_CFG_TMUX_MAIL" ]] && export _CFG_TMUX_MAIL=1
[[ -z "$_CFG_TMUX_CPU" ]] && export _CFG_TMUX_CPU=1
[[ -z "$_CFG_TMUX_INTERNAL_IP" ]] && export _CFG_TMUX_EXTERNAL_IP=1
[[ -z "$_CFG_TMUX_EXTERNAL_IP" ]] && export _CFG_TMUX_INTERNAL_IP=1
[[ -z "$_CFG_TMUX_NETWORK_RATE" ]] && export _CFG_TMUX_NETWORK_RATE=1
[[ -z "$_CFG_TMUX_WEATHER" ]] && export _CFG_TMUX_WEATHER=1
[[ -z "$_CFG_TMUX_DATE" ]] && export _CFG_TMUX_DATE=1
[[ -z "$_CFG_TMUX_TIME" ]] && export _CFG_TMUX_TIME=1

_script="${BASH_SOURCE:-$0}"
_script=$(readlink --canonicalize-existing $_script)
_file_success $_script
