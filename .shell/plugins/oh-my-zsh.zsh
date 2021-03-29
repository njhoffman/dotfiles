# oh-my-zsh plugins: ~/.oh-my-zsh/[custom/]plugins
plugins=(
  aws
  colorize
  colored-man-pages
  command-not-found
  compleat
  cp
  docker
  # dotenv (want to specifically load with autoenv)
  extract
  git
  helm
  # jira
  kubectl
  node
  npm
  nvm
  pass
  sudo
  systemadmin
  taskwarrior
  terraform
  vi-mode
  web-search
  zsh_reload
)
# add additional plugins like this: plugins=(auto-notify $plugins)

# ZSH_DOTENV_PROMPT=false

# if [ -z "$_zsh_custom_scripts_loaded" ]; then
#   _zsh_custom_scripts_loaded=1
#   plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
# fi
#
source $ZSH/oh-my-zsh.sh

# colored-man-pages: adds colors to manpages
# colorize: cat with syntax highlight support
# cp: cp with progress bar
# dircolors-solarized
# extract: 'x' alias: swiss army knife for extraction
# git: git-extras, gitfast, git-flow, gi-flow-avh, git-hubdflow, git-remote-branch
# node: node-docs easy access
# npm:
# nvm:
# sudo:
# systemadmin:
# todo:
# vi-mode:
# web-search: google from CLI
# zsh_reload
#
# *autojump/wd: fs jumping
# *battery: allows see battery status in PS
# *command-not-found: suggests package name with relevant command
# *compleat: generate tab completion for any shell command by specifying its usage in a familiar manpage-like fomat
# *docker:
# *debian: aliases for apt* utils
# *dircycle: plugin for cycling through the directory stack (Ctrl+Sh+Left/Right)
# *emoji-clock: fancy shell clocks
# *gnu-utils: gnu coreutils wrapper to overwrite shell builtins
# *mosh:
# *profiles: different zsh profiles per host
# *redis-cli: redis autocompletion
# *ssh-agent: ssh-agent startup script
# *tmux: enhanced tmux support
