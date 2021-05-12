#!/bin/zsh

dir=$0:A

export TERM="xterm-256color"
# export TERM="xterm-color"
# export TERM="vte-256color"
# curl -LO http://invisible-island.net/datafiles/current/terminfo.src.gz
# gunzip terminfo.src.gz
# tic terminfo.src

TTY=$(tty)

export PROMPT_COMMAND="pwd > /tmp/whereami"
precmd() { eval "$PROMPT_COMMAND" }

export NO_AT_BRIDGE=1 # turn off warning of connection to dbus for a11y features
export TASKRC="$home_dir/.config/taskwarrior/.taskrc"

# export AWS_DEFAULT_PROFILE=$P9K_AWS_DEFAULT_PROFILE
export AWS_PROFILE=$P9K_AWS_DEFAULT_PROFILE

# zsh-autoenv
# if [ -f ~/.oh-my-zsh/custom/plugins/zsh-autoenv/autoenv.zsh ]; then
#   source ~/.oh-my-zsh/custom/plugins/zsh-autoenv/autoenv.zsh
#   export AUTOENV_FILE_ENTER=".autoenv.zsh"
#   export AUTOENV_DISABLED=0
#   export AUTOENV_DEBUG=0 # 1: generic, 2: verbose, 3: everything (set -x while sourcing env files)
# fi

export SSH_KEY_PATH="$home_dir/.ssh/id_rsa"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

local script=${(%):-%x}
_file_success $script

export SELENIUM_SERVER_JAR=/usr/local/bin/selenium-server-standalone-2.43.1.jar
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TZ='America/Chicago'
export NO_AT_BRIDGE=1 # turn off warning of connection to dbus for a11y features
# no=00;38;5;244:rs=0:di=00;38;5;33:
LS_COLORS=$LS_COLORS'ow=1;96:'
export LS_COLORS
export EXA_COLORS="da=1;34"


if [[ -z "$PKG_CONFIG_PATH" && -n "$(command -v pkg-config)" ]]; then
  export PKG_CONFIG_PATH=$(pkg-config --variable pc_path pkg-config)
fi
# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig"

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

# Ruby exports
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH=$PATH:~/.rbenv/bin:~/.rbenv/plugins/ruby-build/bin
# export RB_USER_INSTALL='true'
# export GEM_HOME=$HOME/.rvm/gems
# export GEM_PATH=~/.rvm/gems/2.7.0:/usr/lib/ruby/gems/2.7.0

# export PATH=$HOME/.rvm/gems/default/bin:$PATH
# [[ -z "$GEM_HOME" ]] && \
#   export PATH="$GEM_HOME/bin:$PATH"

# export rvmsudo_secure_path=1

export PATH="/usr/lib/postgresql/10/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/sbin:$PATH"

export GOPATH=$HOME/go
export GOROOT=/home/linuxbrew/.linuxbrew/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH="/usr/local/opt/icu4c/sbin:/usr/local/opt/icu4c/bin:$PATH"


export KREW_ROOT=~/.krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# export XDG_CONFIG_HOME=/usr/local/lib/python2.7/dist-packages/powerline:~/.config/powerline:~/.config
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config
export POWERLINE_CONFIG_PATHS=/home/$USER/.shell/powerline:/home/$USER/.shell/.powerline:/home/$USER/.config/powerline

[[ -n "$(command -v npm)" ]] &&
  export NODE_PATH=$(npm root -g)

export PATH=$PATH:~/.bin:~/bin:~/bin/aws:~/bin/docker:/usr/local/bin:~/.local/bin
export PATH="$PATH:/usr/local/aws-cli/v2/current/bin"

# Find your Python User Base path (where Python --user will install packages/scripts)
[[ -n "$(command -v python3)" ]] &&
  USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
export PATH=$PATH:/home/linuxbrew/.linxbrew/sbin

export CHEAT_USE_FZF=true

# superman (man in vim)
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
# complete -o default -o nospace -F _man vman

export COLUMNS="120"
export PATH="$PATH:/home/nicholas/ACLI"

export KUBECONFIG=$KUBECONFIG:~/.kube/minikube:~/.kube/spadash-dev0-eks:~/.kube/spadash-prod0-eks

# if [[ -S ~/.mpd/socket ]] ; then
#   export MPD_HOST="${HOME}/.mpd/socket"
# else
#   unset MPD_HOST
# fi
#
# if whence -p systemctl &> /dev/null ; then
#   systemctl --user import-environment PATH EDITOR LANG
# fi
#
# export GPG_TTY=$(tty)
# if whence -p gpg-connect-agent &> /dev/null ; then
#   gpg-connect-agent -q updatestartuptty /bye > /dev/null
# fi


# COMBINATIONS USING JUST THE 'GREY' KEYS:
#
# key[F1]        = '^[[[A'
# key[F2]        = '^[[[B'
# key[F3]        = '^[[[C'
# key[F4]        = '^[[[D'
# key[F5]        = '^[[[E'
# key[F6]        = '^[[17~'
# key[F7]        = '^[[18~'
# key[F8]        = '^[[19~'
# key[F9]        = '^[[20~'
# key[F10]       = '^[[21~'
# key[F11]       = '^[[23~'
# key[F12]       = '^[[24~'
#
# key[Shift-F1]  = '^[[25~'
# key[Shift-F2]  = '^[[26~'
# key[Shift-F3]  = '^[[28~'
# key[Shift-F4]  = '^[[29~'
# key[Shift-F5]  = '^[[31~'
# key[Shift-F6]  = '^[[32~'
# key[Shift-F7]  = '^[[33~'
# key[Shift-F8]  = '^[[34~'
#
# key[Insert]    = '^[[2~'
# key[Delete]    = '^[[3~'
# key[Home]      = '^[[1~'
# key[End]       = '^[[4~'
# key[PageUp]    = '^[[5~'
# key[PageDown]  = '^[[6~'
# key[Up]        = '^[[A'
# key[Down]      = '^[[B'
# key[Right]     = '^[[C'
# key[Left]      = '^[[D'
#
# key[Bksp]      = '^?'
# key[Bksp-Alt]  = '^[^?'
# key[Bksp-Ctrl] = '^H'    console only.
#
# key[Esc]       = '^['
# key[Esc-Alt]   = '^[^['
#
# key[Enter]     = '^M'
# key[Enter-Alt] = '^[^M'
#
# key[Tab]       = '^I' or '\t'  unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
#
# COMBINATIONS USING THE WHITE KEYS:
#
# Anomalies:
# 'Ctrl+`' == 'Ctrl+2', and 'Ctrl+1' == '1' in xterm.
# Several 'Ctrl+number' combinations are void at console, but return codes in xterm. OTOH Ctrl+Bksp returns '^H' at console, but is identical to plain 'Bksp' in xterm. There are no doubt more of these little glitches however, in the main:
#
# White key codes are easy to undertand, each of these 'normal' printing keys has six forms:
#
# A            = 'a'    (duhhh)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
#
# A-Ctrl       = '^A'
# A-Alt-Ctrl   = '^[^A'
# A-Alt-Shift  = '^[A'
# A-Ctrl-Shift = '^A'   (Shift has no effect)
#
# Don't forget that:
#
# /-Shift-Ctrl = Bksp      = '^?'
# [-Ctrl       = Esc       = '^['
# M-Ctrl       = Enter     = '^M'
#
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

