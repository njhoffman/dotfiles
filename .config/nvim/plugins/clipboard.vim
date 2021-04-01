" clipboard emulation between vim sessions and host
" NOTE: must install xsel for desktop clipboard compatibility
Plug 'svermeulen/vim-easyclip'

" exchange between clipboard and tmux buffers
Plug 'roxma/vim-tmux-clipboard'
let g:yankround_dir="~/.vim/yanks"
Plug 'LeafCage/yankround.vim'
" Plug 'maxbrunsfeld/vim-yankstack'
" set <m-p> = ^[p   " rotate yanks forward
" set <m-P> = ^[P   " rotate yanks backward
" note that, the ^[ is an Esc char that comes before the 'p'
" In most default configurations, ^[p may be typed by pressing first <C-v>, then <M-p>
" call yankstack#setup()
" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste

" repeats non-native commands inside of plugin maps (required for easyclip)
Plug 'tpope/vim-repeat'

" autoformatting can be helpful for pasting from one indent level to another
let g:EasyClipAutoFormat=0
" nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" imap <C-v> <plug>EasyClipInsertModePaste
" cmap <C-v> <plug>EasyClipCommandModePaste


" TODO: if single line, p: same line after, P: new line after
" TODO: if multi-line, p: after, P: before, paste-mod
" TODO: if yanked without line yank, remove last space
" paste onto new line
" nnoremap P :pu<CR>
" Make Y behave like other capitals
nnoremap Y y$
" <C-R>" paste buffer " in insert mode
" Paste yanked line without line breaks before/after cursor position
" nnoremap gP i<CR><Esc>PkJxJx
" nnoremap gp a<CR><Esc>PkJxJx

" causes other instances to restore their clipboard if not copied with Y
let g:EasyClipShareYanks=0
let g:EasyClipYankHistorySize=50

" delete characters don't go to default register, good idea except for dd
let g:EasyClipEnableBlackHoleRedirect=0

let g:EasyClipUsePasteDefaults=0
"
" nmap p <plug>EasyClipPasteUnformattedAfter
"
" nmap P O<C-v><Esc>
" nmap P <plug>EasyClipPasteBefore

 " past cursor at the end of pasted text
let g:EasyClipAlwaysMoveCursorToEndOfPaste=1

" let g:EasyClipUseYankDefaults=1
" let g:EasyClipUseCutDefaults=1
" let g:EasyClipUsePasteDefaults=1
" let g:EasyClipUsePasteToggleDefaults=1

" <blank>": all yank/delete/paste uses '' register, system clipboard must be accessed explicitly
" unnamed: all yanke/delete/paste uses system register *
" unnamedplus: both vim and easyclip use the + register
" unnamed,unnamedplus: both vim and easyclip use the + register, and automatically copy contents to * register
set clipboard=unnamedplus,unnamedplus

" fix for yankring and neovim
let g:yankring_clipboard_monitor=1

" basic pasting p/P with indentation fixed
Plug 'sickill/vim-pasta'
let g:pasta_paste_before_mapping = 'P'
let g:pasta_paste_after_mapping = 'p'
" let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']

" coc-yank plugin, CocInstall coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
" autocmd WinLeave * call coc#util#clear_pos_matches('^HighlightedyankRegion')
"
" yank.highlight.enable enable highlight feature, default: true.
" yank.highlight.duration duration of highlight in miliseconds, default: 500.
" yank.list.maxsize maxsize of yank list, default: 200
" yank.enableCompletion: Enable completion support for yanked text, default: true
" yank.priority: Priority of yank completion source, default: 90.
" yank.limit: Max completion item count from yank history.

