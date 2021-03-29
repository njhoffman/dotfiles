#############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
# Rbenv color.
typeset -g POWERLEVEL9K_RBENV_FOREGROUND=168
# Hide ruby version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
# If set to false, hide ruby version if it's the same as global:
# $(rbenv version-name) == $(rbenv global).
typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

#######################[ rvm: ruby version from rvm (https://rvm.io) ]########################
# Rvm color.
typeset -g POWERLEVEL9K_RVM_FOREGROUND=168
# Don't show @gemset at the end.
typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
# Don't show ruby- at the front.
typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
# Custom icon.
# typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'


