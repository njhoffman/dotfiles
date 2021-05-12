# install zplug if not exists
if [[ -z "$(command -v zplug)" ]]; then
  # curl -sL --proto-redir -all,https \
  #   https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  export ZPLUG_HOME="$HOME/.zplug"
  [[ ! -d ~/.zplug ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

dir=${0:a:h}

source "$ZPLUG_HOME/init.zsh"

zplug zplug/zplug, hook-build:'zplug --self-manage'

source "${dir}/plugins/alias-tips.zsh"
source "${dir}/plugins/anyframe.zsh"
source "${dir}/plugins/asdf.zsh"
source "${dir}/plugins/auto-ls.zsh"
source "${dir}/plugins/enhancd.zsh"
source "${dir}/plugins/zsh-auto-notify.zsh"
source "${dir}/plugins/zsh-autocomplete.zsh"
source "${dir}/plugins/zsh-autoenv.zsh"
source "${dir}/plugins/zsh-better-npm-completion.zsh"
source "${dir}/plugins/zsh-completions.zsh"
source "${dir}/plugins/zsh-autosuggestions.zsh"
# source "${dir}/plugins/zsh-histdb.zsh"
# source "${dir}/plugins/zsh-syntax-highlighting.zsh"
source "${dir}/plugins/zsh-vim-mode.zsh"

# zplug kyanagi/faster-vcs-info, as:command, use:'VCS_INFO_*', lazy:true
# zplug jreese/zsh-titles
# zplug RobSis/zsh-completion-generator
# zplug RobSis/zsh-reentry-hook
#
# if [[ -d ~/devel/virtualz ]] ; then
#   zplug "~/devel/virtualz", from:local
# else
#   zplug 'aperezdc/virtualz'
# fi
# if [[ -d ~/devel/rockz ]] ; then
#   zplug "~/devel/rockz", from:local
# else
#   zplug 'aperezdc/rockz'
# fi
# if [[ -d ~/devel/zsh-notes ]] ; then
#   zplug "~/devel/zsh-notes", from:local
# else
#   zplug 'aperezdc/zsh-notes'
# fi
#
# # if [[ -d ~/devel/zsh-fzy ]] ; then
# # 	zplug "~/devel/zsh-fzy", from:local
# # else
# # 	zplug 'aperezdc/zsh-fzy'
# # fi
#
# zinit light xPMo/zsh-toggle-command-prefix
# zinit light hlissner/zsh-autopair
# zinit light m42e/zsh-histdb-fzf
# zinit light zsh-users/zsh-history-substring-search
# zinit light  michaelxmcbride/zsh-dircycle
# zinit light leonjza/history-here
# zinit light hkbakke/bash-insulter
zplug "kazhala/dotbare"
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
zplug "zdharma/fast-syntax-highlighting", from:github, defer:2

# Oh my zsh plugins
zplug "plugins/aws",               from:oh-my-zsh
zplug "plugins/colorize",          from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/cp",                from:oh-my-zsh
zplug "plugins/copydir"            from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/extract",           from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/helm",              from:oh-my-zsh
zplug "plugins/kubectl",           from:oh-my-zsh
zplug "plugins/node",              from:oh-my-zsh
zplug "plugins/golang",            from:oh-my-zsh, if:"(( $+commands[go] ))"
zplug "plugins/npm",               from:oh-my-zsh, if:"(( $+commands[npm] ))"
zplug "plugins/sudo",              from:oh-my-zsh, if:"(( $+commands[sudo] ))"
zplug "plugins/systemd",           from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
zplug "plugins/pass",              from:oh-my-zsh
zplug "plugins/systemadmin",       from:oh-my-zsh
zplug "plugins/terraform",         from:oh-my-zsh
zplug "plugins/taskwarrior",       from:oh-my-zsh
zplug "plugins/vi-mode",           from:oh-my-zsh
zplug "plugins/urltools",          from:oh-my-zsh
zplug "plugins/web-search",        from:oh-my-zsh
zplug "plugins/zsh_reload",        from:oh-my-zsh

# zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
# zplug "stedolan/jq", from:gh-r,  as:command, rename-to:jq

# Theme file
# zplug 'dracula/zsh', as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "romkatv/powerlevel10k", as:theme, depth:1
# time (repeat 1000 zsh -dfis <<< 'source ~/powerlevel10k/powerlevel10k.zsh-theme')
# zplug "eendroroy/alien-minimal"
# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
