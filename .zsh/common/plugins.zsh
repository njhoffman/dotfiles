[[ ! -d ~/.zplug ]] &&
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

CWD="${0:A:h}"

source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "kazhala/dotbare"
zplug "plugins/git",   from:oh-my-zsh
source "${CWD}/plugins/alias-tips.zsh"
source "${CWD}/plugins/auto-ls.zsh"
source "${CWD}/plugins/asdf.zsh"
source "${CWD}/plugins/enhancd.zsh"
source "${CWD}/plugins/anyframe.zsh"
source "${CWD}/plugins/zsh-vim-mode.zsh"
source "${CWD}/plugins/zsh-auto-notify.zsh"
source "${CWD}/plugins/zsh-autoenv.zsh"
source "${CWD}/plugins/zsh-syntax-highlighting.zsh"
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
# zplug "stedolan/jq", from:gh-r,  as:command, rename-to:jq
# aws
# colorize
# colored-man-pages
# command-not-found
# compleat
# cp
# docker
# # dotenv (want to specifically load with autoenv)
# extract
# git
# helm
# # jira
# kubectl
# node
# npm
# nvm
# pass
# sudo
# systemadmin
# taskwarrior
# terraform
# vi-mode
# web-search
# zsh_reload

# Load theme file
# zplug 'dracula/zsh', as:theme
zplug "romkatv/powerlevel10k", as:theme, depth:1
# time (repeat 1000 zsh -dfis <<< 'source ~/powerlevel10k/powerlevel10k.zsh-theme')

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
