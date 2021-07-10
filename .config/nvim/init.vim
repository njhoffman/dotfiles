" ********** Global Settings **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim/after
set runtimepath^=~/.config/nvim
set runtimepath+=~/.local/share/nvim/site/after
set runtimepath^=~/.local/share/nvim/site


if (&term =~ '^xterm' && &t_Co == 256)
   set t_ut= | set ttyscroll=1
endif

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" hi! Normal guibg=#000000 ctermbg=16
" hi! NonText guibg=#000000 ctermbg=16
" hi! LineNr guibg=#000000 ctermbg=16
" hi! Folded guibg=#000000 ctermbg=16
" hi! SpecialKey guibg=#000000 ctermbg=16
" hi! VertSplit guibg=#000000 ctermbg=16
" hi! SignColumn guibg=#000000 ctermbg=16
" hi! EndOfBuffer guibg=#000000 ctermbg=16


"clear out previous autocmds to stop them being duplicated when resourcing
"  this file
" autocmd!
source $HOME/.config/nvim/functions.fzf.vim
source $HOME/.config/nvim/functions.unimpaired.vim


" use the 'alt' program to quickly load alternate file
" Run a given vim command on the results of alt from a given path.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
" source $HOME/.config/nvim/functions.surround.vim

function! Remove_comments(code)
  return substitute(a:code, "^#[^\r]*\r\\|\r#[^\r]*", "", "g")
endfunction

" fasd integration
" function! s:fasd_update() abort
function! Fasd_update() abort
  if empty(&buftype) || &filetype ==# 'dirvish'
    call jobstart(['fasd', '-A', expand('%:p')])
  endif
endfunction

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

function Refresh_lsp()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	sleep 500m
	edit
endfunction

command RefreshLSP call Refresh_lsp()

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
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

lua << EOF
   require('init')
   require('lsp_signature').on_attach()
   require('snippets').use_suggested_mappings()
EOF

source $HOME/.config/nvim/plugins.vim
