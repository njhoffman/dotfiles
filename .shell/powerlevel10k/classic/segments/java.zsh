###############[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
# Java color.
typeset -g POWERLEVEL9K_JENV_FOREGROUND=32
# Hide java version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
# If set to false, hide java version if it's the same as global:
# $(jenv version-name) == $(jenv global).
typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

