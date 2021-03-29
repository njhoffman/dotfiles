#############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
# Kubernetes context classes for the purpose of using different colors, icons and expansions with
# different contexts.
#
# POWERLEVEL9K_KUBECONTEXT_CLASSES is an array with even number of elements. The first element
# in each pair defines a pattern against which the current kubernetes context gets matched.
# More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
# that gets matched. If you unset all POWERLEVEL9K_KUBECONTEXT_*CONTENT_EXPANSION parameters,
# you'll see this value in your prompt. The second element of each pair in
# POWERLEVEL9K_KUBECONTEXT_CLASSES defines the context class. Patterns are tried in order. The
# first match wins.
#
# For example, given these settings:
#
#   typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
#     '*prod*'  PROD
#     '*test*'  TEST
#     '*'       DEFAULT)
#
# If your current kubernetes context is "deathray-testing/default", its class is TEST
# because "deathray-testing/default" doesn't match the pattern '*prod*' but does match '*test*'.
#
# You can define different colors, icons and content expansions for different classes:
#
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=28
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
#   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
    # '*prod*'  PROD    # These values are examples that are unlikely
    # '*test*'  TEST    # to match your needs. Customize them as needed.
    '*'       DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=134
# typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Use POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION to specify the content displayed by kubecontext
# segment. Parameter expansions are very flexible and fast, too. See reference:
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
#
# Within the expansion the following parameters are always available:
#
# - P9K_CONTENT                The content that would've been displayed if there was no content
#                              expansion defined.
# - P9K_KUBECONTEXT_NAME       The current context's name. Corresponds to column NAME in the
#                              output of `kubectl config get-contexts`.
# - P9K_KUBECONTEXT_CLUSTER    The current context's cluster. Corresponds to column CLUSTER in the
#                              output of `kubectl config get-contexts`.
# - P9K_KUBECONTEXT_NAMESPACE  The current context's namespace. Corresponds to column NAMESPACE
#                              in the output of `kubectl config get-contexts`. If there is no
#                              namespace, the parameter is set to "default".
#
# If the context points to Google Kubernetes Engine (GKE) or Elastic Kubernetes Service (EKS),
# the following extra parameters are available:
#
# - P9K_KUBECONTEXT_CLOUD_NAME     Either "gke" or "eks".
# - P9K_KUBECONTEXT_CLOUD_ACCOUNT  Account/project ID.
# - P9K_KUBECONTEXT_CLOUD_ZONE     Availability zone.
# - P9K_KUBECONTEXT_CLOUD_CLUSTER  Cluster.
#
# P9K_KUBECONTEXT_CLOUD_* parameters are derived from P9K_KUBECONTEXT_CLUSTER. For example,
# if P9K_KUBECONTEXT_CLUSTER is "gke_my-account_us-east1-a_my-cluster-01":
#
#   - P9K_KUBECONTEXT_CLOUD_NAME=gke
#   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=my-account
#   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east1-a
#   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
#
# If P9K_KUBECONTEXT_CLUSTER is "arn:aws:eks:us-east-1:123456789012:cluster/my-cluster-01":
#
#   - P9K_KUBECONTEXT_CLOUD_NAME=eks
#   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=123456789012
#   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east-1
#   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
# Show P9K_KUBECONTEXT_CLOUD_CLUSTER if it's not empty and fall back to P9K_KUBECONTEXT_NAME.
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
# Append the current context's namespace if it's not "default".
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

# Custom prefix.
# typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='%244Fat '


