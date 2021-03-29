
Plug 'dhruvasagar/vim-table-mode'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__' let g:table_mode_corner_corner='+'

nmap <Leader>tr :TableModeRealign
nmap <Leader>tm :TableModeToggle

let g:table_mode_header_fillchar='='
" let g_table_mode_delete_row_map = <Leader>tdd
" let g_table_mode_delete_column_map = <Leader>tdc
" let g_table_mode_insert_column_after_map = <Leader>tic


" 1st) | name | address | phone |
" 2nd) || for horiz line, | for columns
" +-----------------+--------------------------+------------+
" | name            | address                  | phone      |
" +=================+==========================+============+
" | John Adams      | 1600 Pennsylvania Avenue | 0123456789 |
" +-----------------+--------------------------+------------+
" | Sherlock Holmes | 221B Baker Street        | 0987654321 |
" +-----------------+--------------------------+------------+
"
" move around cells: [|, ]|, {| & }|
" :Tablesize or <Leader>tt to existing data

" Call Text object: i| a|
" Delete Row/Column:
