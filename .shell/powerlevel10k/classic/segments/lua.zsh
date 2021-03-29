##########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
# Lua color.
typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=32
# Hide lua version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
# If set to false, hide lua version if it's the same as global:
# $(luaenv version-name) == $(luaenv global).
typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'


