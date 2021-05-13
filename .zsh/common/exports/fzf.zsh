### fzf
# customized widgets
# source $HOME/bin/fzf/widgets/fzfp-widgets
# source $HOME/bin/fzf/widgets/fzf-widgets
# better zsh completion (where is it from)?
# source $HOME/.shell/fzf-zsh-completion.sh

# export FZF_DEFAULT_COMMAND="command fdfind --hidden --follow --type d --color never ."
# export FZF_CTRL_T_OPTS="--bind 'enter:execute(nvim {1} < /dev/tty);"
# export FZF_ALT_C_COMMAND="command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune     -o -type d -print 2> /dev/null | cut -b3-"
# export FZF_ALT_C_COMMAND="command fdfind --hidden --follow --type d --color never"
# export FZF_DEFAULT_OPTS='--height 40% --reverse --ansi --border --inline-info --color=dark,bg+:235,hl+:10,pointer:5'
# export FZF_DEFAULT_OPTS='--color="bg:#000008,bg+:#002222,spinner:#079e71,hl:#488eb5,fg:#a3a3b6,header:#586e75,info:#cb4b16,pointer:#07ae71,marker:#07ae71,fg+:#839496,prompt:#07ae71,hl+:#07ae71"'
bat_preview="([[ -f {} ]] && (bat --style=plain --color=always --line-range :100 {} || cat {})) || ([[ -d {} ]] && (colorls --tree --color=always {} | less)) || echo {} 2> /dev/null | head -200"

fzf_colors="bg:#000000,bg+:#222222,header:#586e75"
fzf_colors+=",hl:#5f87af,hl+:#5fd7ff,fg:#a3a3b6"
fzf_colors+=",fg+:#a3d3e6,info:#6b6bf6,marker:#07ae71"
fzf_colors+=",prompt:#55FFFF,pointer:#07ae71,spinner:#98BC99"

export FZF_DEFAULT_OPTS="
  --layout=reverse
  --info=inline
  --cycle
  --ansi
  --multi
  --border
  --preview-window=right:50%
  --preview '$bat_preview'
  --color='dark,bg+:235,hl+:5,pointer:5'
  --color='$fzf_colors'
  --prompt='∼ '
  --pointer='▶'
  --marker='✓ '
  --header='C-e: edit, C-y: copy, C-v: execute'
  --bind 'change:top'
  --bind 'Ctrl-/:toggle-preview'
  --bind 'ctrl-p:up'
  --bind 'ctrl-n:down'
  --bind 'tab:down'
  --bind 'shift-tab:up'
  --bind 'ctrl-b:page-up'
  --bind 'ctrl-f:page-down'
  --bind 'alt-g:top'
  --bind 'alt-b:page-up+page-up+page-up'
  --bind 'alt-f:page-down+page-down+page-down'
  --bind 'alt-n:toggle-down'
  --bind 'alt-p:toggle-up'
  --bind 'alt-space:toggle'
  --bind 'ctrl-alt-a:toggle-all'
  --bind 'alt-a:toggle-all'
  --bind 'up:preview-up'
  --bind 'down:preview-down'
  --bind 'pgup:preview-page-up'
  --bind 'pgdn:preview-page-down'
  --bind 'shift-up:preview-page-up'
  --bind 'shift-down:preview-page-down'
  --bind 'ctrl-y:execute-silent(echo {+} | xsel --clipboard)'
  --bind 'ctrl-e:execute(nvim {+} < /dev/tty > /dev/tty 2>&1)'
  --bind 'ctrl-v:execute(code {+})'
"
# --bind '?:toggle-preview'

export FZF_POPUP_OPTS=" --layout=reverse --info=inline --ansi --height=100% --multi --border --preview-window=:hidden --preview '([[ -f {} ]] && (bat --style=plain --color=always --line-range :100 {} || cat {})) || ([[ -d {} ]] && (colorls --tree --color=always {} | less)) || echo {} 2> /dev/null | head -200' --color='dark,bg+:235,hl+:5,pointer:5' --prompt='∼ ' --pointer='▶' --marker='✓ ' --bind 'Ctrl-/:toggle-preview' --bind 'ctrl-p:up' --bind 'ctrl-n:down' --bind 'ctrl-b:page-up' --bind 'ctrl-f:page-down' --bind 'ctrl-alt-a:toggle-all' --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)' --bind 'ctrl-e:execute(nvim {+} < /dev/tty > /dev/tty 2>&1)' --bind 'ctrl-v:execute(code {+})' "
fzf_exclude="\
  --exclude \".git\" \
"

fzf_command="fdfind \
  --hidden \
  --follow \
  --no-ignore-vcs \
"

export FZF_DEFAULT_COMMAND="$fzf_command $fzf_exclude"
export FZF_CTRL_T_COMMAND="$fzf_command --type f $fzf_exclude"
export FZF_ALT_C_COMMAND="$fzf_command --type d $fzf_exclude"
export FZF_CTRL_R_OPTS="--preview 'echo {1..3}; echo {4..} | bat --style=plain --language=zsh' --preview-window down:3:wrap --bind '?:toggle-preview'"

# ALT_C_OPTS, CTRL_R_OPTS, CTRL_T_OPTS
export FZF_TMUX=1
# default -w 50%
export FZF_TMUX_OPTS="-p 80%"

# fzf-direct-completion() {
#   FZF_COMPLETION_TRIGGER= fzf-completion
# }
# zle -N fzf-direct-completion
# export FZF_COMPLETION_TRIGGER=''
# export FZF_COMPLETION_TRIGGER='**'

