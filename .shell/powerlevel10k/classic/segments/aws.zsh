#[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
# AWS profile color.
typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=208
# POWERLEVEL9K_AWS_CLASSES is an array with even number of elements. The first element
# in each pair defines a pattern against which the current AWS profile gets matched.
# More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
# that gets matched. If you unset all POWERLEVEL9K_AWS_*CONTENT_EXPANSION parameters,
# you'll see this value in your prompt. The second element of each pair in
# POWERLEVEL9K_AWS_CLASSES defines the context class. Patterns are tried in order. The
# first match wins.
#
# For example, given these settings:
#
#   typeset -g POWERLEVEL9K_AWS_CLASSES=(
#     '*prod*'  PROD
#     '*test*'  TEST
#     '*'       DEFAULT)
#
# If your current AWS profile is "company_test", its class is TEST
# because "company_test" doesn't match the pattern '*prod*' but does match '*test*'.
#
# You can define different colors, icons and content expansions for different classes:
#
#   typeset -g POWERLEVEL9K_AWS_TEST_FOREGROUND=28
#   typeset -g POWERLEVEL9K_AWS_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
#   typeset -g POWERLEVEL9K_AWS_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
typeset -g POWERLEVEL9K_AWS_CLASSES=(
  # '*prod*'  PROD    # These values are examples that are unlikely
  # '*test*'  TEST    # to match your needs. Customize them as needed.
  '*'       DEFAULT)
# typeset -g POWERLEVEL9K_AWS_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

#[ aws_eb_env: aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/) ]#
# AWS Elastic Beanstalk environment color.
typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=70
# Custom icon.
# typeset -g POWERLEVEL9K_AWS_EB_ENV_VISUAL_IDENTIFIER_EXPANSION='⭐'


