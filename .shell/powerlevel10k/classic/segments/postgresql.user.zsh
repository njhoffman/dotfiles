  # Example of a user-defined prompt segment. Function prompt_example will be called on every
  # prompt if `example` prompt segment is added to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS or
  # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS. It displays an icon and orange text greeting the user.
  #
  # Type `p10k help segment` for documentation and a more sophisticated example.
  typeset -g POWERLEVEL9K_POSTGRESQL_CLASSES=(
    '*prod*'      PROD
    '*dev*'       DEV
    '*localhost*' LOCAL
    '*'           OTHER)

  typeset -g POWERLEVEL9K_POSTGRESQL_FOREGROUND=186
  typeset -g POWERLEVEL9K_POSTGRESQL_PROD_FOREGROUND=196
  typeset -g POWERLEVEL9K_POSTGRESQL_DEV_FOREGROUND=105
  typeset -g POWERLEVEL9K_POSTGRESQL_LOCAL_FOREGROUND=80

  # typeset -g POWERLEVEL9K_POSTGRESQL_VISUAL_IDENTIFIER_EXPANSION=' '
  # typeset -g POWERLEVEL9K_POSTGRESQL_DEFAULT_CONTENT_EXPANSION=
  # typeset -g POWERLEVEL9K_POSTGRESQL_CONTENT_EXPANSION='${P9K_CONTENT} '
  # Type `p10k help segment` for documentation and a more sophisticated example.
  function prompt_postgresql() {
    local db="$PGDATABASE"
    local host="$PGHOST"
    local state="OTHER"

    [[ "$PGHOST" == *"prod"* ]] && state="PROD"
    [[ "$PGHOST" == *"dev"* ]] && state="DEV"
    [[ "$PGHOST" == *"local"* ]] && state="LOCAL"
    #  
    # -f/-b '#0000ff'
    # -t '%F{blue}%*%f'
    # -s state
    if [[ -n "$db" ]]; then
      p10k segment -s "$state" -t "$db  "
    fi
  }

