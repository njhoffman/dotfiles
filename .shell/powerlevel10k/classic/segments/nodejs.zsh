##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
# Nodenv color.
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70
# Don't show node version if it's the same as global: $(nodenv version-name) == $(nodenv global).
typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
# Nvm color.
typeset -g POWERLEVEL9K_NVM_FOREGROUND=70
# Custom icon.
# typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
# Nodeenv color.
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
# Don't show Node version next to the environment name.
typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
# Separate environment name from Node version only with a space.
typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############################[ node_version: node.js version ]###############################
# Node version color.
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
# Show node version only when in a directory tree containing package.json.
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
# Custom icon.
# typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'
