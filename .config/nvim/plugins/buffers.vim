" buffer explorer
Plug 'jlanzarotta/bufexplorer'
let g:bufExplorerShowDirectories = 0
let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.

" vim-bufmru  - switch buffers in most recently used order
" 		Alt-B or Alt-Shift-B to navigate buffers in insert mode and normal mode
Plug 'mildred/vim-bufmru'
" imap <A-B> <C-O>:BufMRUPrev<CR>
" imap <A-B> <C-O>:BufMRUPrev<CR>
" imap <A-b> <C-O>:BufferPrev<CR>
" imap <A-b> <C-O>:BufferNext<CR>
" map <A-B> :BufferPrev<CR>
" map <A-b> :BufferNext<CR>
" nmap <Esc>B :BufMRUPrev<CR>
" nmap <Esc>b :BufMRUNext<CR>
" barbar
" map <silent> H :BufferPrev<CR>
" map <silent> L :BufferNext<CR>
" bufferline
" map <silent> H :BufferLineCyclePrev<CR>
" map <silent> L :BufferLineCycleNext<CR>

" bufferline
map <silent> H :BufMRUPrev<CR>
map <silent> L :BufMRUNext<CR>

"  Shift H/L to navigate in normal mode
" map <S-h> :bp<CR>
" map <S-l> :bn<CR>
" map <S-h> :BufMRUPrev<CR>
" map <S-l> :BufMRUNext<CR>

" vim-scripts/bufmru - switch to a most recently used buffer quickly
Plug 'vim-scripts/bufmru.vim'
  " Press  <Space>  to show the most recently used buffer and enter Bufmru mode.
    "   Press  f  or  b  (forward/backward) to reach more MRU buffers.
    "   Press  e  or  <Enter>  to accept the current choice.
    "   Press  q  or  <Esc>  to quit the mode and to go back to the start buffer
let g:bufmru_switchkey = "<Space>"
