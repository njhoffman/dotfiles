###########[ plenv: perl version from plenv (https://github.com/tokuhirom/plenv) ]############
# Perl color.
typeset -g POWERLEVEL9K_PLENV_FOREGROUND=67
# Hide perl version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
# If set to false, hide perl version if it's the same as global:
# $(plenv version-name) == $(plenv global).
typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'


