# Add an empty line before each prompt.
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Connect left prompt lines with these symbols. You'll probably want to use the same color
# as POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND below.
# typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%238F╭─'
# typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%238F├─'
# typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%238F╰─'
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%38F╭─'
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%38F├─'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%38F╰─>%87F>%145F>'

# P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{38}╭─%f"
# P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{38}╰─>%F{87}>%F{145}>%F{200} %f"

# Connect right prompt lines with these symbols.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

# Filler between left and right prompt on the first prompt line. You can set it to ' ', '·' or
# '─'. The last two make it easier to see the alignment between left and right prompt and to
# separate prompt from command output. You might want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
# for more compact prompt if using using this option.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
  # The color of the filler. You'll probably want to match the color of POWERLEVEL9K_MULTILINE
  # ornaments defined above.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=238
  # Start filler from the edge of the screen if there are no left segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
  # End filler on the edge of the screen if there are no right segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
fi

# Default background color.
# typeset -g POWERLEVEL9K_BACKGROUND=234
typeset -g POWERLEVEL9K_BACKGROUND=

# Separator between same-color segments on the left.
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%242F\uE0B1'
# Separator between same-color segments on the right.
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%242F\uE0B3'
# Separator between different-color segments on the left.
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
# Separator between different-color segments on the right.
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
# The right end of left prompt.
# typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
# The left end of right prompt.
# typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
#  nf-fae-bigger

########################
# CUSTOM
# The left end of left prompt.
typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
# The right end of right prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

# Don't show context unless running with privileges or in SSH.
# Tip: Remove the next line to always show context.
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

########################

# Left prompt terminator for lines without any segments.
typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

# Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
# when accepting a command line. Supported values:
#
#   - off:      Don't change prompt when accepting a command line.
#   - always:   Trim down prompt when accepting a command line.
#   - same-dir: Trim down prompt when accepting a command line unless this is the first command
#               typed after changing current working directory.
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir

# Instant prompt mode.
#
#   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
#              it incompatible with your zsh configuration files.
#   - quiet:   Enable instant prompt and don't print warnings when detecting console output
#              during zsh initialization. Choose this if you've read and understood
#              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
#   - verbose: Enable instant prompt and print a warning when detecting console output during
#              zsh initialization. Choose this if you've never tried instant prompt, haven't
#              seen the warning, or if you are unsure what this all means.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
# For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
# can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
# really need it.
typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
