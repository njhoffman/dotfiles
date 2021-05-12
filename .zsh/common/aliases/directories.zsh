
# directory navigation

alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

if [ -n "$(command -v colorls)" ]; then
  alias ls="LC_COLLATE=C ls --color=auto"
  alias l='LC_COLLATE=C colorls --group-directories-first --almost-all --git-status'
  alias ll='LC_COLLATE=C colorls --group-directories-first --almost-all --long --git-status' # detailed list view
  # alias l='exa --icons -b --git -1'
  # alias ll="exa -a -l -@ -F --icons --color-scale -b -g --extended --git"
  alias lt="LC_COLLATE=C colorls --group-directories-first --almost-all --tree"
  alias tree="LC_COLLATE=C colorls --tree"
  alias grep="grep --color"
fi

