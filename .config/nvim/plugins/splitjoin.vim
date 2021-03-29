" switch between single line and multi-line statements
Plug 'andrewradev/splitjoin.vim'

" custom jsx ftplugin used to allow use with jsx tags
" currently only works when you are inside the block/braces
" gS : one-liner to multi-liner
" gJ : join block into single-line

" needs tabular or align plugin
let g:splitjoin_align=1

let g:splitjoin_curly_brace_padding=1

" let g:splitjoin_split_mapping = ''
" let g:splitjoin_join_mapping = ''

" nnoremap <Leader>s :SplitjoinSplit<CR>
" nnoremap <Leader>j :SplitjoinJoin<CR>
" nnoremap <Leader>S f{:SplitjoinSplit<CR>o
" nnoremap <Leader>J :SplitjoinJoin<CR>
