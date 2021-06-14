" ********** Global Settings **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim/after
set runtimepath^=~/.config/nvim
set runtimepath+=~/.local/share/nvim/site/after
set runtimepath^=~/.local/share/nvim/site

" let g:backupdir=expand(stdpath('data') . '/backup')
" if !isdirectory(g:backupdir)
"    mkdir(g:backupdir, "p")
" endif
" let &backupdir=g:backupdir
"
"
" ********** Main Loader **********

" Load external files
" source $HOME/.config/nvim/settings.vim
" source $HOME/.config/nvim/autocommands.vim
" source $HOME/.config/nvim/functions.vim
" source $HOME/.config/nvim/plugins.vim

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


lua << EOF
  require('init')
  require('lsp_signature').on_attach()
  require('snippets').use_suggested_mappings()
EOF

source $HOME/.config/nvim/plugins.vim
" source $HOME/.config/nvim/mappings.vim
" source $HOME/.config/nvim/colors/barbar-colors.vim
