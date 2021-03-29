#!/bin/bash

# overall environment notes, to be made into a provisioning script

# bash login process
# NOTE: default /etc/profile will not execute if ~/.bash_profile or ~/.bash_login exists
/etc/profile
~/.profile
~/.bashrc
~/.bashrc.local

# zsh login process
# $ZDOTDIR can be set different from default $HOME
/etc/zsh/zshenv
$ZDOTDIR/.zshenv
/etc/zsh/profile
# all bash compatible shells execute this to setup things like $PATH
/etc/profile
$ZDOTDIR/.zprofile
/etc/zsh/zshrc
# should just $HOME/.shell/.zshrc and then $HOME/.zshrc.local
$ZDOTDIR/.zshrc
$ZDOTDIR/.shell/.zshrc
$ZDOTDIR/.shell/funcs.[sh,zsh]
$ZDOTDIR/.shell/exports.[sh,zsh]
$ZDOTDIR/.shell/aliases.[sh,zsh]
$ZDOTDIR/.shell/.zshrc.plugins

$ZDOTDIR/.zshrc.local
# /etc/zsh/zlogin: $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout: /etc/zsh/zlogout

# {{{ dotfile definitions

# .xsession: executed when in graphical mode (via display manager), usually set env variables (.profile) and start GUI session (.xinitrc)
# .xsessionrc: debian specific, will be executed if .xinitrc does not exist (startx falls back on same GUI startup scripts as login)
# .xinitrc: executed by xinit (via startx), sets GUI part of session, key bindings (xmodmap), X resources (xrdb), launch window/session manager
# .Xdefaults: old way, file re-read everytime xlib program is started, ignored if .Xresources are present
# .Xdefaults-hostname: always read even if .Xresources (RESOURCE_MANAGER) is present
# .Xresources: X11R2, loads into RESOURCE_MANAGER of X11 root window
# .Xauthority: stores credneitals in cookies used by xauth for authentication X sessions
## .xinitrc.bak
## .xsession-errors
## .xsession-errors.old
## .xsessionrc

# dot folders
# .aws
# .cache
# .cargo
# .config
# .conky
# .cpanm
# .dbus
# .debugger-256
# .filebot
# .fonts
# .fzf
# .gem
# .gnome2
# .gnome2_private
# .gnupg
# .gvfs
# .i3
# .java
# .local
# .mozilla
# .multirust
# .node-gyp
# .npm
# .nv
# .nvm
# .oracle_jre_usage
# .pki
# .projectM
# .rustup
# .serverless
# .shell
# .ssh
# .themes
# .thumbnails
# .thunderbird
# .vim
# .vim-tmp
# .w3m
# .yarn

# dot files
# .ICEauthority
# .agignore
# .babel.json
# .bash_history
# .bash_logout
# .bashrc
# .dmrc
# .easyclip
# .esd_auth
# .eslintrc.overkill
# .fzf.bash
# .fzf.zsh
# .gconf
# .gdbinit
# .gdbinit.local
# .gitconfig
# .gmrun_history
# .gmrunrc
# .gorc
# .gorc.json
# .gtkrc-2.0
# .gtkrc-2.0.bak
# .gtkrc.tmp-0
# .iftoprc
# .lesshst
# .minttyrc
# .nvidia-settings-rc
# .profile
# .serverlessrc
# .sqsh_history
# .sqsh_readline
# .sqsh_session
# .sqshrc
# .sudo_as_admin_successful
# .tmux.conf
# .tmux.conf.old
# .tmux.nested.conf
# .v8flags.6.2.414.75.532ab4d2bbcc461398d494905db10c95.json
# .viminfo
# .vimrc
# .vimrc.deprecated
# .vimrc.functions
# .vimrc.plugins
# .wget-hsts
# .zcompdump
# .zcompdump-deimos-5.7.1-dev-0
# .zsh_history
# .zshrc
# .zshrc.local

# }}}

# .config files
# mimeapps.list
# monitors-v1-backup.xml
# monitors.xml
# monitors.xml.backup
# monitors.xml~
# Trolltech.conf
# compton.conf
# filebot.psm
# gnome-initial-setup-done
# pavucontrol.ini
# user-dirs.dirs
# user-dirs.locale

# .config folders
# Slack
# autostart
# bspwm
# clipit
# colorls
# compiz-1
# configstore
# dconf
# dunst
# enchant
# eog
# evolution
# gedit
# glava
# gnome-session
# goa-1.0
# gtk-2.0
# gtk-3.0
# gtk-4.0
# htop
# i3
# ibus
# jgmenu
# libfm
# mc
# nautilus
# nitrogen
# pcmanfm
# polybar
# powerline
# projectM
# pulse
# qastools
# s-tui
# sxhkd
# termite
# tint2
# torbrowser
# ubuntu-cleaner
# update-notifier
# vis
# wal
# xfce4
# yelp
