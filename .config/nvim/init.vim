" ********** Global Settings **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after
set runtimepath^=~/.vim/nvim


" yanks dir
if has("persistent_undo")
  set undodir=$HOME/.vim/undo
  set undofile
endif

"
" ********** Main Loader **********

" Load external files
" source $HOME/.config/nvim/settings.vim
" source $HOME/.config/nvim/autocommands.vim
" source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/plugins.vim
augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction

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


source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugins/barbar-colors.vim
