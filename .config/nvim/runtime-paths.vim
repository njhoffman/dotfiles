
" ********** Global Settings **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after
set runtimepath^=~/.vim/nvim
" set runtimepath^=~/.config/nvim
" set runtimepath+=~/.config/nvim/after
" set runtimepath^=~/.local/share/nvim/site
" set runtimepath+=~/.local/share/nvim/site/after

if has("persistent_undo")
  set undodir=$HOME/.vim/undo
  set undofile
endif
