#[ google_app_cred: google application credentials (https://cloud.google.com/docs/authentication/production) ]#
# Google application credentials classes for the purpose of using different colors, icons and
# expansions with different credentials.
#
# POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES is an array with even number of elements. The first
# element in each pair defines a pattern against which the current kubernetes context gets
# matched. More specifically, it's P9K_CONTENT prior to the application of context expansion
# (see below) that gets matched. If you unset all POWERLEVEL9K_GOOGLE_APP_CRED_*CONTENT_EXPANSION
# parameters, you'll see this value in your prompt. The second element of each pair in
# POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES defines the context class. Patterns are tried in order.
# The first match wins.
#
# For example, given these settings:
#
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
#     '*:*prod*:*'  PROD
#     '*:*test*:*'  TEST
#     '*'           DEFAULT)
#
# If your current Google application credentials is "service_account deathray-testing x@y.com",
# its class is TEST because it doesn't match the pattern '* *prod* *' but does match '* *test* *'.
#
# You can define different colors, icons and content expansions for different classes:
#
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_FOREGROUND=28
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_CONTENT_EXPANSION='$P9K_GOOGLE_APP_CRED_PROJECT_ID'
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
    # '*:*prod*:*'  PROD    # These values are examples that are unlikely
    # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
    '*'             DEFAULT)
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=32
# typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Use POWERLEVEL9K_GOOGLE_APP_CRED_CONTENT_EXPANSION to specify the content displayed by
# google_app_cred segment. Parameter expansions are very flexible and fast, too. See reference:
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
#
# You can use the following parameters in the expansion. Each of them corresponds to one of the
# fields in the JSON file pointed to by GOOGLE_APPLICATION_CREDENTIALS.
#
#   Parameter                        | JSON key file field
#   ---------------------------------+---------------
#   P9K_GOOGLE_APP_CRED_TYPE         | type
#   P9K_GOOGLE_APP_CRED_PROJECT_ID   | project_id
#   P9K_GOOGLE_APP_CRED_CLIENT_EMAIL | client_email
#
# Note: ${VARIABLE//\%/%%} expands to ${VARIABLE} with all occurences of '%' replaced by '%%'.
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'


