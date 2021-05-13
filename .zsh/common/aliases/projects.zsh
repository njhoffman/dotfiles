
[[ -d "$HOME/projects/personal/movieman"  && -n "$NODE_PATH" ]] && \
  alias mm="node ~/projects/personal/movieman/lib/index.js"

if [[ -d "$HOME/projects/personal/wikiscan"  && -n "$NODE_PATH" ]]; then
  alias wikiscan="$HOME/projects/personal/wikiscan/bin/wikiscan.sh"
  alias ws="$HOME/projects/personal/wikiscan/bin/wikiscan.sh"
fi

if [[ -d "$HOME/projects/personal/musicman"  && -n "$NODE_PATH" ]]; then
  alias mr="node ~/projects/personal/musicman/cli/lib/cli.js"
  alias mre="node ~/projects/personal/musicman/cli/lib/cli.js edit"
  alias mrp="mpc clear && node ~/projects/personal/musicman/cli/lib/cli.js playlist rating: ./ && mpc load current && mpc play"
  alias mn="mpc n && node ~/projects/personal/musicman/cli/lib/cli.js"
  function mpcf {
    mpc searchadd any "$1" && mpc searchplay "$1"
  }
fi

if [[ -d "$HOME/projects/personal/fakercli"  && -n "$NODE_PATH" ]]; then
  alias fakercli="node $HOME/projects/personal/fakercli/lib/index.js"
fi

if [[ -d "$HOME/bin/fb"  && -n "$NODE_PATH" ]]; then
  alias fbt="fb --test"
fi

alias colortest="$HOME/bin/colors/colortest"
alias bindkeys-list="source ~/bin/bindkeys-list"
alias completions-list="source ~/bin/completions-list"

# spadash
alias sdmigrate="migrate up -path=migrations -database=postgres://spadash:spadash@localhost:5432/"

