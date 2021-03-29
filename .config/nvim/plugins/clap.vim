
" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" The bang version will try to download the prebuilt binary if cargo does not exist.
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" :Clap install-binary[!] will always try to compile the binary locally,
" if you do care about the disk used for the compilation, try using the force download way,
" which will download the prebuilt binary even you have installed cargo.
" Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }

let g:clap_insert_mode_only=1

" `:Clap install-binary[!]` will run using the terminal feature which is inherently async.
" If you don't want that and hope to run the hook synchorously:
" Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
" Command	List	Requirement
" Clap bcommits	Git commits for the current buffer	git
" Clap blines	Lines in the current buffer	none
" Clap buffers	Open buffers	none
" Clap colors	Colorschemes	none
" Clap command	Command	none
" Clap hist: or Clap command_history	Command history	none
" Clap hist/ or Clap search_history	Search history	none
" Clap commits	Git commits	git
" Clap files	Files	fd/git/rg/find
" Clap filetypes	File types	none
" Clap gfiles or Clap git_files	Files managed by git	git
" Clap git_diff_files	Files managed by git and having uncommitted changes	git
" Clap grep+	Grep on the fly	rg
" Clap grep2+	Grep on the fly with cache and dynamic results	maple
" Clap history	Open buffers and v:oldfiles	none
" Clap help_tags	Help tags	none
" Clap jumps	Jumps	none
" Clap lines	Lines in the loaded buffers	none
" Clap marks	Marks	none
" Clap maps	Maps	none
" Clap quickfix	Entries of the quickfix list	none
" Clap loclist	Entries of the location list	none
" Clap registers	Registers	none
" Clap tags	Tags in the current buffer	vista.vim ( git clone https://github.com/universal-ctags/ctags.git)
" Clap proj_tags	Tags in the current project	maple and universal-ctags with JSON output support
" Clap yanks	Yank stack of the current vim session	none
" Clap filer	Ivy-like file explorer	maple
" Clap providers	List the vim-clap providers	none
" Clap windows	Windows	none

let g:clap_preview_size = { '*': 5, 'files': 10 }
" Default: `{'width': '67%', 'height': '33%', 'row': '33%', 'col': '17%'}`
" let g:clap_layout = { 'width': '75%', 'height': '85%' }

" For example, use <C-n>/<C-p> instead of <C-j>/<C-k> to navigate the result.
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-f> <C-R>=clap#navigation#scroll('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-b> <C-R>=clap#navigation#scroll('up')<CR>
autocmd FileType clap_input nnoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input nnoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
autocmd FileType clap_input nnoremap <silent> <buffer> <C-f> <C-R>=clap#navigation#scroll('down')<CR>
autocmd FileType clap_input nnoremap <silent> <buffer> <C-b> <C-R>=clap#navigation#scroll('up')<CR>
inoremap <silent> <buffer> <PageUp>   <C-R>=clap#navigation#scroll('up')<CR>
"" `:Clap quick_open` to open some dotfiles quickly.
let g:clap_provider_quick_open = {
      \ 'source': ['~/.vimrc', '~/.spacevim', '~/.bashrc', '~/.tmux.conf'],
      \ 'sink': 'e',
      \ }

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:palette = {}

let s:palette.display = { 'ctermbg': '235', 'guibg': '#171d2D' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same background.
let s:bg0 = { 'ctermbg': '60', 'guibg': '#1e2441' }
let s:palette.input = s:bg0
let s:palette.indicator = extend({ 'ctermfg': '238', 'guifg':'#676b83' }, s:bg0)
let s:palette.spinner = extend({ 'ctermfg': '11', 'guifg':'#ffe500', 'cterm': 'bold', 'gui': 'bold'}, s:bg0)
let s:palette.search_text = extend({ 'ctermfg': '195', 'guifg': '#CADFF3', 'cterm': 'bold', 'gui': 'bold' }, s:bg0)

let s:palette.preview = { 'ctermbg': '238', 'guibg': '#363c55' }

let s:palette.selected = { 'ctermfg': '81', 'guifg': '#5FD7d7', 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:palette.current_selection = { 'ctermbg': '236', 'guibg': '#31364D', 'cterm': 'bold', 'gui': 'bold' }

let s:palette.selected_sign = { 'ctermfg': '196', 'guifg': '#f2241f' }
let s:palette.current_selection_sign = s:palette.selected_sign

let g:clap#themes#material_design_dark#palette = s:palette

let &cpoptions = s:save_cpo
unlet s:save_cpo
let g:clap_theme = 'material_design_dark' " material_design_dark, solarized_dark, atom_dark

" Clap interface for coc actions, commands, diagnostics, extensions, location,
" outline, symbols, services
Plug 'vn-ki/coc-clap'
