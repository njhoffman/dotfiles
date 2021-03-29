
" Execute common unix commands / utilities from vim
Plug 'tpope/vim-eunuch'

" :Delete: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Delete, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Cfind: Run find and load the results into the quickfix list.
" :Clocate: Run locate and load the results into the quickfix list.
" :Lfind/:Llocate: Like above, but use the location list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.

" rename files in vim
Plug 'qpkorr/vim-renamer'
let g:RenamerShowHidden=1

" Find and replace
Plug 'brooth/far.vim'
nnoremap <silent> <Find-Shortcut>  :Farf<cr>
vnoremap <silent> <Find-Shortcut>  :Farf<cr>
let g:far#mode_open = { "regex": 1, "case_sensitive": 1, "word": 0, "substitute": 0 }

" shortcut for far.vim replace
nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
vnoremap <silent> <Replace-Shortcut>  :Farr<cr>
" :far foo bar **/*.py
" :fardo
" Far, Farr (interactive), F, Farf (find only)

" View man pages in vim
" vman printf
" compdef vman="man"
Plug 'jez/vim-superman'

