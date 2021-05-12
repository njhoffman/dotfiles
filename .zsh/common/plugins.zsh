# install zplug if not exists
[[ ! -d ~/.zplug ]] &&
  curl -sL --proto-redir -all,https \
  https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

CWD="${0:A:h}"

source ~/.zplug/init.zsh

source "${CWD}/plugins/alias-tips.zsh"
source "${CWD}/plugins/anyframe.zsh"
source "${CWD}/plugins/asdf.zsh"
source "${CWD}/plugins/auto-ls.zsh"
source "${CWD}/plugins/enhancd.zsh"
source "${CWD}/plugins/zsh-auto-notify.zsh"
source "${CWD}/plugins/zsh-autocomplete.zsh"
source "${CWD}/plugins/zsh-autoenv.zsh"
source "${CWD}/plugins/zsh-better-npm-completion.zsh"
source "${CWD}/plugins/zsh-histdb.zsh"
source "${CWD}/plugins/zsh-syntax-highlighting.zsh"
source "${CWD}/plugins/zsh-vim-mode.zsh"
zplug "kazhala/dotbare"
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"

# Oh my zsh plugins
zplug "plugins/aws",               from:oh-my-zsh
zplug "plugins/colorize",          from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/cp",                from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/extract",           from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/helm",              from:oh-my-zsh
zplug "plugins/kubectl",           from:oh-my-zsh
zplug "plugins/node",              from:oh-my-zsh
zplug "plugins/npm",               from:oh-my-zsh
zplug "plugins/nvm",               from:oh-my-zsh
zplug "plugins/pass",              from:oh-my-zsh
zplug "plugins/sudo",              from:oh-my-zsh
zplug "plugins/systemadmin",       from:oh-my-zsh
zplug "plugins/terraform",         from:oh-my-zsh
zplug "plugins/taskwarrior",       from:oh-my-zsh
zplug "plugins/vi-mode",           from:oh-my-zsh
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
