##########################[ status: exit code of the last command ]###########################
# Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
# style them independently from the regular OK and ERROR state.
typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
# it will signify success by turning green.
typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when some part of a pipe command fails but the overall exit status is zero. It may look
# like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=70
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
# it will signify error by turning red.
typeset -g POWERLEVEL9K_STATUS_ERROR=true
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

# Status when the last command was terminated by a signal.
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
# Use terse signal names: "INT" instead of "SIGINT(2)".
typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'

# Status when some part of a pipe command fails and the overall exit status is also non-zero.
# It may look like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=160
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'


