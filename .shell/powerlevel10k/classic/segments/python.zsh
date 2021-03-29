################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
# Pyenv color.
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=37
# Hide python version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
# If set to false, hide python version if it's the same as global:
# $(pyenv version-name) == $(pyenv global).
typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
# Custom icon.
# typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'


###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
# Python virtual environment color.
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
# Don't show Python version next to the virtual environment name.
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
# Separate environment name from Python version only with a space.
typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'



