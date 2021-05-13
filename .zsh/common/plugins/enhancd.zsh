# enhancd: fzf cd enhancer => cd <Enter>, cd - <Enter>, cd .. <Enter>
if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "b4b4r07/enhancd", use:init.sh
  if zplug check b4b4r07/enhancd; then
    # export ENHANCD_FILTER="fzf:peco:percol" # fzf-tmux
    export ENHANCD_FILTER="fzf-tmux:fzf"
    # export ENHANCD_HOOK_AFTER_CD='l'
    export ENHANCD_COMMAND='cd'
    export ENHANCD_DOT_ARG='..'
    export ENHANCD_DISABLE_DOT=1
    # ENHANCD_DIR
    # ENHANCD_FILTER
    # ENHANCD_DISABLE_HYPHEN
    # ENHANCD_DISABLE_HOME
    # ENHANCD_HYPHEN_ARG
    # ENHANCD_HYPHEN_NUM
    # ENHANCD_HOME_ARG
    # ENHANCD_USE_FUZZY_MATCH
    # ENHANCD_COMPLETION_KEYBIND
    # ENHANCD_COMPLETION_BEHAVIOR
  fi
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light b4b4r07/enhancd
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

