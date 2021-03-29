  # Example of a user-defined prompt segment. Function prompt_example will be called on every
  # prompt if `example` prompt segment is added to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS or
  # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS. It displays an icon and orange text greeting the user.
  #
  # Type `p10k help segment` for documentation and a more sophisticated example.
  function prompt_tty() {
    local tty=`tty`
    if [[ "$tty" == "not a tty" ]]; then
      tty=""
    fi

    local tty_num=${tty//\/dev\//}
    p10k segment -f 32 -t "$tty_num"
  }

  # User-defined prompt segments can be customized the same way as built-in segments.
  # typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=208
  # typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='⭐'


