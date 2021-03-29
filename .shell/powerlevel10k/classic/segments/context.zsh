##################################[ context: user@hostname ]##################################
# Context color when running with privileges.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=178
# Context color in SSH without privileges.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=180
# Default context color (no privileges, no SSH).
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180

# Context format when running with privileges: bold user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
# Context format when in SSH without privileges: user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
# Default context format (no privileges, no SSH): user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# Don't show context unless running with privileges or in SSH.
# Tip: Remove the next line to always show context.
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

# Custom icon.
# typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
# Custom prefix.
# typeset -g POWERLEVEL9K_CONTEXT_PREFIX='%244Fwith '


