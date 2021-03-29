  # To disable default icons for all segments, set POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=''.
  #
  # To enable default icons for all segments, don't define POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
  # or set it to '${P9K_VISUAL_IDENTIFIER}'.
  #
  # To remove trailing space from all default icons, set POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
  # to '${P9K_VISUAL_IDENTIFIER% }'.
  #
  # To enable default icons for one segment (e.g., dir), set
  # POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'.
  #
  # To assign a specific icon to one segment (e.g., dir), set
  # POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='⭐'.
  #
  # To assign a specific icon to a segment in a given state (e.g., dir in state NOT_WRITABLE),
  # set POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'.
  #
  # Note: You can use $'\u2B50' instead of '⭐'. It's especially convenient when specifying
  # icons that your text editor cannot render. Don't forget to put $ and use single quotes when
  # defining icons via Unicode codepoints.
  #
  # Note: Many default icons cannot be displayed with system fonts. You'll need to install a
  # capable font to use them. See POWERLEVEL9K_MODE below.
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

  # This option makes a difference only when default icons are enabled for all or some prompt
  # segments (see POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION above). LOCK_ICON can be printed as
  # $'\uE0A2', $'\uE138' or $'\uF023' depending on POWERLEVEL9K_MODE. The correct value of this
  # parameter depends on the provider of the font your terminal is using.
  #
  #   Font Provider                    | POWERLEVEL9K_MODE
  #   ---------------------------------+-------------------
  #   Powerline                        | powerline
  #   Font Awesome                     | awesome-fontconfig
  #   Adobe Source Code Pro            | awesome-fontconfig
  #   Source Code Pro                  | awesome-fontconfig
  #   Awesome-Terminal Fonts (regular) | awesome-fontconfig
  #   Awesome-Terminal Fonts (patched) | awesome-patched
  #   Nerd Fonts                       | nerdfont-complete
  #   Other                            | compatible
  #
  # If this looks overwhelming, either stick with a preinstalled system font and set
  # POWERLEVEL9K_MODE=compatible, or install the recommended Powerlevel10k font from
  # https://github.com/romkatv/powerlevel10k/#recommended-meslo-nerd-font-patched-for-powerlevel10k
  # and set POWERLEVEL9K_MODE=nerdfont-complete.
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete

  # When set to true, icons appear before content on both sides of the prompt. When set
  # to false, icons go after content. If empty or not set, icons go before content in the left
  # prompt and after content in the right prompt.
  #
  # You can also override it for a specific segment:
  #
  #   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
  #
  # Or for a specific segment in specific state:
  #
  #   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

