" floating window terminal interface
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'

" popfix for custom ui creation
" https://github.com/RishabhRD/popfix

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" g:floaterm_rootmarkers
" Example: ['.project', '.git', '.hg', '.svn', '112222.root', '.gitignore'], Default: []"

let g:floaterm_gitcommit = 'floaterm'

let g:floaterm_autoclose = 2

command! Ranger FloatermNew ranger
command! NNN FloatermNew nnn
command! LF FloatermNew lf
command! Vifm FloatermNew vifm
command! Lazygit FloatermNew lazygit

" :FloatermNew :FloatermToggle :FloatermNext :FloatermPrev
" :FloatermNew --autoclose=0 g++ -c % && ./a.aout
" g:floaterm_keymap_new
" g:floaterm_keymap_prev
" g:floaterm_keymap_nextvifm
" g:floaterm_keymap_first
" g:floaterm_keymap_last
" g:floaterm_keymap_hide
" g:floaterm_keymap_show
" g:floaterm_keymap_kill
" " let g:floaterm_keymap_toggle = '<Leader>n'
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
" Set floaterm window's background to black
hi Floaterm guibg=#000000

" hi FloatermBorder guibg=orange guifg=cyan
hi FloatermBorder guibg=#001122 guifg=#22ccaa
" hi FloatermBorder guibg=#111111 guifg=#00aacc

" Set floaterm window background to gray once the cursor moves out from it
hi FloatermNC guibg=#002211

" wrapper scripts must be in: autoload/floaterm/wrapper

" floating window in place code execution
Plug 'windwp/vim-floaterm-repl'
let g:floaterm_repl_runner= "~/scratchpads/runner.sh"
