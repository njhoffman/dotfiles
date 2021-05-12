alias scale="scale_func"

alias open_command="xdg-open"
alias googler="googler --colors GKmgxy"
alias g="googler --colors GKmgxy -j --first --lucky"

alias fd="fdfind --hidden -L"
alias rg="rg --line-number --hidden --no-heading --color=always --smart-case"
# rg and fdfind no ignore
alias fdi="fdfind --hidden --no-ignore-vcs --no-ignore -L"
alias rgi="rg --line-number --hidden --no-ignore --no-heading --color=always --smart-case"
alias agi="ag --unrestricted --hidden"

if [ -x "$(command -v broot)" ]; then
  # deep fuzzy cd, home fuzzy cd, root fuzzy cd
  function dcd {
    br --only-folders --cmd "$1;:cd"
  }
fi

if [ -n "$(command -v histdb)" ]; then
  function _histdb_custom_query {
    histdb --detail --limit 50 "$*" | ccze -A
  }
  alias hist="_histdb_custom_query"
  alias histin="_histdb_custom_query --in"
  alias histat="_histdb_custom_query --at"
fi

alias hexyl="hexyl --border none"
alias hexdump="hexyl --border none"

alias flac2mp3='for file in *.flac; do ffmpeg -i $file -q:a 0 ${file:r}.mp3; done'

alias glava="glava --audio=fifo"
alias xclipb="xclip -selection clipboard"
alias xclipboard="xclip -selection clipboard"

alias jqr="jq -R -r '. as \$line | try fromjson catch \$line'"
alias yqr="yq r -P -C -"

alias vim="nvim"
alias vimdiff="nvim -d"
alias vc="nvimpager -c"
alias vcat="nvimpager -c"
alias vimcat="nvimpager -c"

alias tldr="tldr --theme ocean"

# go shortcuts
alias yaegi="rlwrap yaegi"

# calculator
alias bc="bc -l"

# view versions
alias npm-versions="npm view versions"
alias nmr="rm -r node_modules && npm install"
alias geoiplookup="curl -s https://ipvigilante.com/$(curl -s https://ipinfo.io/ip) | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name'"
alias viewsploit="vimcat /opt/metasploit-framework/modules/$1.rb"

alias tmuxmain="export POWERLINE_CONFIG_OVERRIDES='ext.tmux.theme=main' && tmux -L main"
alias tmuxmin="export POWERLINE_CONFIG_OVERRIDES='ext.tmux.theme=min' && tmux -L min"

alias ttyclock="tty-clock -c -C 4 -b -B -f \"%A %B %e, %G\""

# out to stdout and clipboard
alias cb="tee /dev/tty | xsel"

# average num of lines for glob, i.e. lines *.js
alias lineavg="awk 'END{FNUM=ARGC-1; print (NR-FNUM)/FNUM}'"

alias cz="ccze -A"

# asynctasks
alias atask="asynctask -f"

# reset competion system
alias reset_completion="rm ~/.zcompdump && autoload -U compinit && compinit && autoload -U bashcompinit && bashcompinit"

alias weather="curl -s http://wttr.in/"
alias sqlformat="sqlformat --reindent_aligned --keywords upper --identifiers lower"

