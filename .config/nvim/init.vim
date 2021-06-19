" ********** Global Settings **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim/after
set runtimepath^=~/.config/nvim
set runtimepath+=~/.local/share/nvim/site/after
set runtimepath^=~/.local/share/nvim/site

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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

lua << EOF
  require('init')
  require('lsp_signature').on_attach()
  require('snippets').use_suggested_mappings()
  vim.cmd([[hi! Underlined gui=none]])
EOF
