# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nicholas/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nicholas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nicholas/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nicholas/.fzf/shell/key-bindings.zsh"
