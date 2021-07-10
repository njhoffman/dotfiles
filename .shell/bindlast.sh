#!/bin/bash

vi-append-x-selection() { RBUFFER=$(xsel -o -b </dev/null)$RBUFFER; }
zle -N vi-append-x-selection
bindkey '^P' vi-append-x-selection
# bindkey  '^P'   fzf-completion
# bindkey '^P' expand-or-complete
# bindkey '^[p' fzfp-completion

zle -N .fasd-file
bindkey -M vicmd "^U" kill-whole-line
bindkey "^U" kill-whole-line
bindkey "^[u" histdb-fzf-widget
bindkey '^T' .fasd-file
bindkey '^V' fzfp-vim-widget
bindkey '^[V' fzfp-home-vim-widget
bindkey '^[o' fzf-home-cd-widget
bindkey '^o' fzf-cd-widget

# open menu-completion with ^N
bindkey -r '^N'
bindkey '^N' menu-expand-or-complete

bindkey -s '^Q' "dotbare fedit\n"
bindkey -s '^\' 'll\n'
bindkey -s '^]' 'cd ~\n'
bindkey -s '^_' 'asynctask -f \n'

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

bindkey "^@" autosuggest-accept

bindkey '^N' expand-or-complete
# bindkey -r '^N'
