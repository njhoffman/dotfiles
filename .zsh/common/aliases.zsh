#!/bin/bash

dir=${0:a:h}

# alias fuck='sudo $(history -p \!\!)'
alias _='sudo'
alias reload!='exec "$SHELL" -l'

# alias dots=dotbare
# alias bindkeys-list="source ~/bin/bindkeys-list"
# alias completions-list="source ~/bin/completions-list"
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# alias gh-search="ghs repo --sort=stars"

source "$dir/aliases/backup.zsh"
source "$dir/aliases/directories.zsh"
source "$dir/aliases/fasd.zsh"
source "$dir/aliases/infra.zsh"
source "$dir/aliases/loops.zsh"
source "$dir/aliases/projects.zsh"
source "$dir/aliases/sysadmin.zsh"
source "$dir/aliases/taskwarrior.zsh"
source "$dir/aliases/utils.zsh"


alias adoc-list="grc -es -c conf.dockersearch --colour=auto ansible-doc -l | grep '^\w\+\s'"
alias adoc-list-all="grc -es -c conf.dockersearch --colour=auto ansible-doc -l"
alias adoc="grc -es -c conf.log --colour=auto ansible-doc"
