# TODO: figure out where this needs to be placed to override certain keys
# showkey -a, zle -al

# treat ":w" like line enter
bindkey -M vicmd -s ':w^M' '^M'

# TODO: make these config and consistent across shell, vim, and rofi
# # Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# define function that retrieves and runs last command
function kill-line-ins {
  zle kill-whole-line
  zle vi-insert
}
zle -N kill-line-ins

# Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search
#
# # Easier, more vim-like editor opening
# bindkey -M vicmd v edit-command-line

# yank line when visually selected
bindkey -M vicmd 'y' vi-yank

yanktoclipboard(){
    echo $BUFFER | xsel -i -b
}
pastefromclipboard(){
    RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
}
zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard

# # `v` is already mapped to visual mode, so we need to use a different key to open Vim
# bindkey -M vicmd "^V" edit-command-line

function asynctask-auto {
  task="$ASYNC_TASK"
  if [ -z "$task" ]; then
    task=$(zenity --entry --title "AsyncTask" --text "Enter AsyncTask for auto-triggering:")
  fi
  asynctask "$task"
  if [ $? -ne 0 ]; then
    unset ASYNC_TASK
  else
    export ASYNC_TASK="$task"
  fi
}

function .fasd-file () {
  local selected
  if selected=$(find . -type f | grep -v .git | grep -v node_modules | fzf-tmux -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}

# option-g to find files and put the result in command
zle -N .fasd-file
bindkey '^T' .fasd-file

bindkey "^[u" histdb-fzf-widget
# bindkey "^[u" fzfp-history-widget
bindkey "^U" kill-whole-line
bindkey -M vicmd "^U" kill-whole-line
bindkey '^P' fzf-completion
bindkey '^o' fzf-cd-widget
bindkey '^[o' fzf-home-cd-widget
# bindkey '^[R' fzfp-root-cd-widget
bindkey -s '^_' 'asynctask -f \n'
# bindkey -s '^[T' 'asynctask-auto \n'
# bindkey -s '^[r' 'asynctask-reset \n'
# bindkey '^E' fzfp-home-file-widget
bindkey '^V' fzfp-vim-widget
bindkey '^[V' fzfp-home-vim-widget

# bindkey -M vicmd '^M' accept-line

# bindkey '^ ' autosuggest-accept

#  menuselect go backwards
# bindkey -M menuselect '^P' reverse-menu-complete
bindkey -s '^\' 'll\n'
bindkey -s '^]' 'cd ~\n'
bindkey '\CI' expand-or-complete-prefix
# bindkey '\CI' expand-or-complete
# bindkey '^@' fzf-completion
bindkey '^ ' fzf-completion
# bindkey '^ ' fzf_completion
# bindkey '^I'  expand-or-complete-prefix
bindkey '^I'   expand-or-complete # tab          | complete
# bindkey '^I'   complete-word       # tab          | complete
# bindkey '\t' autosuggest-accept
# bindkey '^ [[Z' autosuggest-accept  # shift + tab  | autosuggest
# bindkey -r '^[[A'

# open menu-completion with ^N
# bindkey -r '^N'
# bindkey '^N' expand-or-complete

#  edit dotfiles
bindkey -s '^Q' "dotbare fedit\n"

# swap caps lock for esscape, caps:escape, caps:super
setxkbmap -option caps:escape
# gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
# xmodmap -e "remove Lock = Caps_Lock"
# xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
# xmodmap -e "keycode 66 = Escape NoSymbol Escape"
# xmodmap -pke > ~/.xmodmap

# xmodmap -e "remove Lock = Caps_Lock"
# with:
# xmodmap -e "clear Lock"0


# ###########################
# REFERENCE
#
# COMBINATIONS USING JUST THE 'GREY' KEYS:
#
# key[F1]        = '^[[[A'
# key[F2]        = '^[[[B'
# key[F3]        = '^[[[C'
# key[F4]        = '^[[[D'
# key[F5]        = '^[[[E'
# key[F6]        = '^[[17~'
# key[F7]        = '^[[18~'
# key[F8]        = '^[[19~'
# key[F9]        = '^[[20~'
# key[F10]       = '^[[21~'
# key[F11]       = '^[[23~'
# key[F12]       = '^[[24~'
#
# key[Shift-F1]  = '^[[25~'
# key[Shift-F2]  = '^[[26~'
# key[Shift-F3]  = '^[[28~'
# key[Shift-F4]  = '^[[29~'
# key[Shift-F5]  = '^[[31~'
# key[Shift-F6]  = '^[[32~'
# key[Shift-F7]  = '^[[33~'
# key[Shift-F8]  = '^[[34~'
#
# key[Insert]    = '^[[2~'
# key[Delete]    = '^[[3~'
# key[Home]      = '^[[1~'
# key[End]       = '^[[4~'
# key[PageUp]    = '^[[5~'
# key[PageDown]  = '^[[6~'
# key[Up]        = '^[[A'
# key[Down]      = '^[[B'
# key[Right]     = '^[[C'
# key[Left]      = '^[[D'
#
# key[Bksp]      = '^?'
# key[Bksp-Alt]  = '^[^?'
# key[Bksp-Ctrl] = '^H'    console only.
#
# key[Esc]       = '^['
# key[Esc-Alt]   = '^[^['
#
# key[Enter]     = '^M'
# key[Enter-Alt] = '^[^M'
#
# key[Tab] = '^I' or '\t' unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
#
#
# COMBINATIONS USING THE WHITE KEYS:
#
# Anomalies:
# 'Ctrl+`' == 'Ctrl+2', and 'Ctrl+1' == '1' in xterm.
# Several 'Ctrl+number' combinations are void at console, but return codes in xterm. OTOH Ctrl+Bksp returns '^H' at console, but is identical to plain 'Bksp' in xterm. There are no doubt more of these little glitches however, in the main:
#
# White key codes are easy to understand, each of these 'normal' printing keys has six forms:
#
# A            = 'a'    (duhhh)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
# A-Ctrl       = '^A'
# A-Alt-Ctrl   = '^[^A'
# A-Alt-Shift  = '^[A'
# A-Ctrl-Shift = '^A'   (Shift has no effect)
#
# Don't forget that:
#
# /-Shift-Ctrl = Bksp      = '^?'
# [-Ctrl       = Esc       = '^['
# M-Ctrl       = Enter     = '^M'
# I-Ctrl       = Tab       = '^I' or '\t'
#
# And, we can 'stack' keybindings:
#
#   bindkey -s '^Xm' "My mistress\' eyes are nothing like the sun."
#
# ... Bind 'Ctrl-X' followed by 'm' to a nice line of poetry.
#
# And we can flirt with madness:
#
#   bindkey -s '^Pletmenot' 'Let me not, to the marriage of true minds'
#
# ... but you hafta start something like that with a 'modifier' character. Try it, if you like keyboard shortcuts, you can really go to town.


