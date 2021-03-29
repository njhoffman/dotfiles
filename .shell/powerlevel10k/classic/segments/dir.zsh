##################################[ dir: current directory ]##################################
# Default current directory color.
typeset -g POWERLEVEL9K_DIR_FOREGROUND=31
# If directory is too long, shorten some of its segments to the shortest possible unique
# prefix. The shortened directory can be tab-completed to the original.
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
# Replace removed segment suffixes with this symbol.
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
# Color of the shortened directory segments.
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
# Color of the anchor directory segments. Anchor segments are never shortened. The first
# segment is always an anchor.
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
# Display anchor directory segments in bold.
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
# Don't shorten directories that contain any of these files. They are anchors.
local anchor_files=(
  .bzr
  .citc
  .git
  .hg
  .node-version
  .python-version
  .ruby-version
  .shorten_folder_marker
  .svn
  .terraform
  CVS
  Cargo.toml
  composer.json
  go.mod
  package.json
)
typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
# Don't shorten this many last directory segments. They are anchors.
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# Shorten directory if it's longer than this even if there is space for it. The value can
# be either absolute (e.g., '80') or a percentage of terminal width (e.g, '50%'). If empty,
# directory will be shortened only when prompt doesn't fit or when other parameters demand it
# (see POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS and POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT below).
# If set to `0`, directory will always be shortened to its minimum length.
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
# When `dir` segment is on the last prompt line, try to shorten it enough to leave at least this
# many columns for typing commands.
typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
# When `dir` segment is on the last prompt line, try to shorten it enough to leave at least
# COLUMNS * POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT * 0.01 columns for typing commands.
typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
# If set to true, embed a hyperlink into the directory. Useful for quickly
# opening a directory in the file manager simply by clicking the link.
# Can also be handy when the directory is shortened, as it allows you to see
# the full directory that was used in previous commands.
typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

# Enable special styling for non-writable directories.
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# Show this icon when the current directory is not writable. POWERLEVEL9K_DIR_SHOW_WRITABLE
# above must be set to true for this parameter to have effect.
# typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Custom prefix.
# typeset -g POWERLEVEL9K_DIR_PREFIX='%244Fin '

# POWERLEVEL9K_DIR_CLASSES allows you to specify custom icons for different directories.
# It must be an array with 3 * N elements. Each triplet consists of:
#
#   1. A pattern against which the current directory is matched. Matching is done with
#      extended_glob option enabled.
#   2. Directory class for the purpose of styling.
#   3. Icon.
#
# Triplets are tried in order. The first triplet whose pattern matches $PWD wins. If there
# are no matches, the directory will have no icon.
#
# Example:
#
#   typeset -g POWERLEVEL9K_DIR_CLASSES=(
#       '~/work(|/*)'  WORK     '(╯°□°）╯︵ ┻━┻'
#       '~(|/*)'       HOME     '⌂'
#       '*'            DEFAULT  '')
#
# With these settings, the current directory in the prompt may look like this:
#
#   (╯°□°）╯︵ ┻━┻ ~/work/projects/important/urgent
#
# Or like this:
#
#   ⌂ ~/best/powerlevel10k
#
# You can also set different colors for directories of different classes. Remember to override
# FOREGROUND, SHORTENED_FOREGROUND and ANCHOR_FOREGROUND for every directory class that you wish
# to have its own color.
#
#   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=31
#   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=103
#   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=39
#
# typeset -g POWERLEVEL9K_DIR_CLASSES=()


