################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
# Todo color.
typeset -g POWERLEVEL9K_TODO_FOREGROUND=110
# Hide todo when the total number of tasks is zero.
typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
# Hide todo when the number of tasks after filtering is zero.
typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

# Todo format. The following parameters are available within the expansion.
#
# - P9K_TODO_TOTAL_TASK_COUNT     The total number of tasks.
# - P9K_TODO_FILTERED_TASK_COUNT  The number of tasks after filtering.
#
# These variables correspond to the last line of the output of `todo.sh -p ls`:
#
#   TODO: 24 of 42 tasks shown
#
# Here 24 is P9K_TODO_FILTERED_TASK_COUNT and 42 is P9K_TODO_TOTAL_TASK_COUNT.
#
# typeset -g POWERLEVEL9K_TODO_CONTENT_EXPANSION='$P9K_TODO_FILTERED_TASK_COUNT'

# Custom icon.
# typeset -g POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_EXPANSION='⭐'

