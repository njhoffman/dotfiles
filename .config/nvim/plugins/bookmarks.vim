Plug 'MattesGroeger/vim-bookmarks'

let g:bookmark_no_default_key_mappings = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_show_warning = 1
nmap <Leader>bb <Plug>BookmarkToggle
nmap <Leader>bi <Plug>BookmarkAnnotate
nmap <Leader>ba <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>bk <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear
nmap <Leader>bx <Plug>BookmarkClearAll
" nmap <Leader>kk <Plug>BookmarkMoveUp
" nmap <Leader>jj <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" highlight BookmarkSign ctermbg=whatever ctermfg=whatever
" highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
" highlight BookmarkLine ctermbg=whatever ctermfg=whatever
" highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever


