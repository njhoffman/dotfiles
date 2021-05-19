#!/usr/bin/zsh

# zinit - sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
# load all plugins except powerlevel10k after the prompt

CWD="${0:A:h}"

### Added by Zinit's installer
  if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
      print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
      command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
      command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
          print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
          print -P "%F{160}▓▒░ The clone has failed.%f%b"
  fi

  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Globals
# export EDITOR=nvim
# export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export AUTO_NOTIFY_THRESHOLD=60
export AUTO_NOTIFY_EXPIRE_TIME=2000
export AUTO_NOTIFY_IGNORE=("docker node tmux vim nvim fzf fzf-tmux man sleep")
export AUTO_NOTIFY_TITLE="%command has just finished"
export AUTO_NOTIFY_BODY="Completed in %elapsed seconds with exit code %exit_code"

# e.g. I have all my dotfiles stored in folder $HOME/.myworld and symlinks all of them to appropriate location.
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
# export DOTBARE_FZF_DEFAULT_OPTS=" -w80 --preview-window=right:50%"


source "${CWD}/highlights.zsh"
source "${CWD}/plugins.programs.zsh"
source "${CWD}/plugins.widgets.zsh"
source "${CWD}/plugins.completions.zsh"


finish_setup() {
  # aliases
  SHELL_COMMON="$HOME/.shell"
  # shellcheck source=/home/.shell/aliases.sh
  . "$SHELL_COMMON/aliases.sh"
  # shellcheck source=/home/.shell/functions.sh
  . "$SHELL_COMMON/functions.zsh"
  GPG_TTY="$(tty)" && export GPG_TTY

  [[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

  # yadm equivalent of forgit commands
  where forgit::diff | sed -e 's/git /yadm /g' -e 's/forgit::diff/yd/' | source /dev/stdin

  command -v thefuck >/dev/null && . <(thefuck --alias)
  command -v pip >/dev/null && . <(pip completion --zsh)
  command -v poetry >/dev/null && . <(poetry completions zsh) 2>/dev/null

  # fzf ctrl-r widget: show timestamp of command and add syntax highlighting for preview window
  export FZF_CTRL_R_OPTS="--preview 'echo {1..3}; echo {4..} | bat --style=plain --language=zsh' --preview-window down:3:wrap --bind '?:toggle-preview'"
}
zi0c atinit'zpcompinit; zpcdreplay; finish_setup'
zinit light zdharma/fast-syntax-highlighting

local script=${(%):-%x}
_file_success $script
