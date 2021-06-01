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

function! GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    " exec "normal :" . prefix . "GFiles\<CR>"
    exec "normal :FzfPreviewFromResources project\<CR>"
  else
    exec "normal :FzfPreviewFromResources directory\<CR>"
    " exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

lua << EOF
require('init')
EOF
" source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugins/barbar-colors.vim
