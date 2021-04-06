#!/usr/bin/zsh

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
DISABLE_MAGIC_FUNCTIONS=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_fallback

# Common ICE modifiers
  z_lucid() {
    zinit ice lucid ver'master' "$@"
  }

  zi0a() {
    z_lucid wait'0a' "$@"
  }

  zi0b() {
    z_lucid wait'0b' "$@"
  }

  zi0c() {
    z_lucid wait'0c' "$@"
  }


###########
# Widgets #
###########

  if [ "${TERM##*-}" = '256color' ] || [ "${terminfo[colors]:?}" -gt 255 ]; then
      z_lucid depth=1
      zinit light romkatv/powerlevel10k
  fi

  zi0a
  zinit light xPMo/zsh-toggle-command-prefix

  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
  # history, match_prev_cmd, completion
  ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=512
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  # improves performance, run _zsh_autosuggest_bind_widgets to manually rebind
  ZSH_AUTOSUGGEST_MANUAL_REBIND=1
  ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(expand-or-complete) # CLEAR, ACCEPT, PARTIAL_ACCEPT, EXECUTE
  zi0a blockf atload'_zsh_autosuggest_start'
  zinit load zsh-users/zsh-autosuggestions

  zi0a pick'autopair.zsh'
  zinit light hlissner/zsh-autopair

  # insult me if i type a command wrong
  zi0a pick'src/bash.command-not-found'
  zinit light hkbakke/bash-insulter

  zinit light desyncr/auto-ls
  colorls="/usr/local/bin/colorls"

  # AUTO_LS_COMMANDS=(custom_function)
  AUTO_LS_COMMANDS=("$colorls -1 --git-status --almost-all --sort-dirs")
  # "colorls -1 --git-status --almost-all --sort-dirs '[[ -d $PWD/.git ]] && /usr/bin/git log|head'" \
  # AUTO_LS_COMMANDS=("$colorls -1 --git-status --sort-dirs")
  # AUTO_LS_NEWLINE=false
  # AUTO_LS_COMMANDS: Use this configuration option to define the functions to run on cwd/enter-key.
  # AUTO_LS_NEWLINE: Configure ls to put a newline (Default: true).
  # AUTO_LS_PATH: Detect command full path to execute (Default: true).
  # AUTO_LS_CHPWD: Enable/disable auto-ls on directory change (Default: true)

  zi0a
  zinit light kazhala/dotbare

  zi0a
  zinit light leonjza/history-here

  zi0a
  zinit light zsh-users/zsh-history-substring-search

  zi0a
  zinit light m42e/zsh-histdb-fzf
    bindkey '^U' histdb-fzf-widget

  zi0a
  zinit light larkery/zsh-histdb

  # Query to pull in the most recent command if anything was found similar
  # in that directory. Otherwise pull in the most recent command used anywhere
  # Give back the command that was used most recently
    _zsh_autosuggest_strategy_histdb_top_fallback() {
      local query="
      select commands.argv from
        history left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where places.dir LIKE
        case when exists(select commands.argv from history
          left join commands on history.command_id = commands.rowid
          left join places on history.place_id = places.rowid
          where places.dir LIKE '$(sql_escape $PWD)%'
          AND commands.argv LIKE '$(sql_escape $1)%')
        then '$(sql_escape $PWD)%'
        else '%'
        end
        and commands.argv LIKE '$(sql_escape $1)%'
        group by commands.argv
        order by places.dir LIKE '$(sql_escape $PWD)%' desc,
        history.start_time desc
        limit 1"
      suggestion=$(_histdb_query "$query")
    }

    MODE_CURSOR_VIINS="#44ccff blinking bar"
    MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff6600"
    MODE_CURSOR_VICMD="#00aa66 blinking block"
    MODE_CURSOR_SEARCH="#ff00ff steady underline"
    MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
    MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #9922ff"

  zinit light softmoth/zsh-vim-mode

    # zsh-autoenv: execute .autoenv.zsh automatically on directory enter
    # autoenv-edit: if [[ $autoenv_event == 'enter' ]]; then autostash AWS_PROFILE="east-2"
  zinit light Tarrasch/zsh-autoenv

  zinit light djui/alias-tips

    # zsh-auto-notify: send notifications when long running tasks completed
    # disable_auto_notify enable_auto_notify
  zinit light MichaelAquilina/zsh-auto-notify

    colorls="/usr/local/bin/colorls"
    AUTO_LS_COMMANDS=("$colorls -1 --git-status --almost-all --sort-dirs")

  zinit light desyncr/auto-ls

  zinit light  michaelxmcbride/zsh-dircycle
    # Press the Control + Shift + Left key combination to cycle backward through the directory stack.
    # Press the Control + Shift + Right key combination to cycle forward through the directory stack.

  # zsh-completions: collection of completion scripts not yet added to zsh
  zinit light zsh-users/zsh-completions
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
    # zstyle ':completion:*:*:*:default' menu yes
    # zstyle ':completion:*:*:kill:*:*' verbose no
    # zstyle ':completion:*:*:*:default' menu select
    # zstyle ':completion:*' fzf-search-display true
    # zstyle ':completion:*:options:*' list-colors '=(#b) #(--[a-z-]#)=34=36=33'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:default' list-colors \
      "di=36" "ln=35" "so=32" "pi=33" "ex=31" "bd=34;46" "cd=34;43" \
      "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"

    # zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
    zstyle ':completion:*:parameters'  list-colors '=*=0;38;2;66;180;255'
    zstyle ':completion:*:options' list-colors '=^(-- *)=34'
    zstyle ':completion:*:commands' list-colors '=*=0;38;2;66;140;140'
    zstyle ':completion:*:builtins' list-colors '=*=1;38;5;27'
    zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
    # zstyle -e ':completion:' list-colors 'thingy=${PREFIX##/} reply=( "=(#b)($thingy)(?)*=00=$color[green]=$color[bg-green]" )'

    # zinit light "marlonrichert/zsh-autocomplete"
    # # zstyle ':autocomplete:list-choices:*' min-input 3
    # # zstyle ':autocomplete:*' max-lines 100%
    # zstyle ':autocomplete:*' max-lines 5
    #
    # zstyle ':autocomplete:space:*' magic none
    # # zstyle ':autocomplete:*' recent-dirs off
    # zstyle ':autocomplete:*' key-binding off
    # # zstyle ':autocomplete:*' config off
    #
    # # fzf, widget-style menu-complete, widget-style menu-select
    # zstyle ':autocomplete:tab:*' insert-unambiguous yes
    # zstyle ':autocomplete:tab:*' widget-style fzf
    # zstyle ':autocomplete:tab:*'fzf yes
    #
    # zstyle ':autocomplete:*:no-matches-yet' message '      %F{#446666}...'
    # zstyle ':autocomplete:*:too-many-matches' message '     %F{#446666}...<tab>'
    # zstyle ':autocomplete:*:no-matches-at-all' message '      %F{#446666}...'

    zinit wait lucid light-mode for \
        OMZ::plugins/aws \
        OMZ::plugins/colorize \
        OMZ::plugins/colored-man-pages \
        OMZ::plugins/command-not-found \
        OMZ::plugins/compleat \
        OMZ::plugins/cp \
        OMZ::plugins/extract \
        OMZ::plugins/git \
        OMZ::plugins/helm \
        OMZ::plugins/kubectl \
        OMZ::plugins/node \
        OMZ::plugins/nvm \
        OMZ::plugins/taskwarrior \
        OMZ::plugins/thefuck \
        OMZ::plugins/vi-mode \
        OMZ::plugins/web-search \
        OMZ::plugins/zsh_reload \
      if"[[ $+commands[go] ]]" OMZ::plugins/golang \
      if"[[ $+commands[npm] ]]" OMZ::plugins/npm \
      if"[[ $+commands[sudo] ]]" OMZ::plugins/sudo \
      if"[[ $+commands[systemd] ]]" OMZ::plugins/systemd

  zi0a light-mode for \
          OMZL::history.zsh \
          OMZP::systemd/systemd.plugin.zsh \
          OMZP::sudo/sudo.plugin.zsh \
      atload'zstyle ":completion:*" special-dirs false' \
          OMZL::completion.zsh \
      as'completion' nocompile mv'*.zsh -> _git' patch"${pchf}/%PLUGIN%.patch" reset \
          felipec/git-completion \
      ver'develop' atload'_zsh_autosuggest_start' \
          zsh-users/zsh-autosuggestions

local script=${(%):-%x}
_file_success $script