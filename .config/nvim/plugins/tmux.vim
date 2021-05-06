
" vim-tmux: syntax highlighting and helpers for tmux conf
Plug 'tmux-plugins/vim-tmux'

" :make => invoke tmux source and report any errors
" K     => jump to man page defining word under cursor
" g!    => esxecute visual lines as tmux command
" g!!   => execute just the current line as tmux command

" fix FocusGained and FocusLost problems with tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" hack to turn on paste mode automatically
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" send keys to others panes/sessions from vim
" VimuxRunLastCommand, vimuxRunCommand
Plug 'benmills/vimux'

" seamlessly move between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 0
" Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> <M-;> :TmuxNavigatePrevious<cr>
inoremap <silent> h <Esc>:TmuxNavigateLeft<cr>
inoremap <silent> j <Esc>:TmuxNavigateDown<cr>
inoremap <silent> k <Esc>:TmuxNavigateUp<cr>
inoremap <silent> l <Esc>:TmuxNavigateRight<cr>
inoremap <silent> <M-;> <Esc>:TmuxNavigatePrevious<cr>

" tmux settings ...
" # Smart pane switching with awareness of Vim splits.
" # See: https://github.com/christoomey/vim-tmux-navigator
" is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
"     | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
" bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
" bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
" bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
" bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
" tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
" if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
"     "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
" if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
"     "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
"
" bind-key -T copy-mode-vi 'C-h' select-pane -L
" bind-key -T copy-mode-vi 'C-j' select-pane -D
" bind-key -T copy-mode-vi 'C-k' select-pane -U
" bind-key -T copy-mode-vi 'C-l' select-pane -R
" bind-key -T copy-mode-vi 'C-\' select-pane -l

" send text to tmux session
Plug 'jpalardy/vim-slime'
let g:slime_no_mappings = 1
let g:slime_target = "tmux"
" target:
"   ':'       means current window, current pane (a reasonable default)
"   ':i'      means the ith window, current pane
"   ':i.j'    means the ith window, jth pane
"   'h:i.j'   means the tmux session where h is the session identifier
"             (either session name or number), the ith window and the jth pane
"             '%i'      means i refers the pane's unique id
"             '{token}' one of tmux's supported special tokens, like '{last}'
" use split plane with same window by default
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
" use special token
" let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'}
"   {last}  ! The last (previously active) pane
"   {next}  + The next pane by number
"   {previous}  - The previous pane by number
"   {top}   The top pane
"   {bottom}    The bottom pane
"   {left}    The leftmost pane
"   {right}   The rightmost pane
"   {top-left}    The top-left pane
"   {top-right}   The top-right pane
"   {bottom-left}   The bottom-left pane
"   {bottom-right}    The bottom-right pane
"   {up-of}   The pane above the active pane
"   {down-of}   The pane below the active pane
"   {left-of}   The pane to the left of the active pane
"   {right-of}    The pane to the right of the active pane
"
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig

