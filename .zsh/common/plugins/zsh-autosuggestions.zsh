if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "zsh-users/zsh-autosuggestions", at:develop
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light zsh-users/zsh-autosuggestions
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# history, match_prev_cmd, completion
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=512
ZSH_AUTOSUGGEST_USE_ASYNC=1
# improves performance, run _zsh_autosuggest_bind_widgets to manually rebind
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(expand-or-complete) # CLEAR, ACCEPT, PARTIAL_ACCEPT, EXECUTE

