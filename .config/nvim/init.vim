" ********** Main Loader **********

set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim/after
set runtimepath^=~/.config/nvim
set runtimepath+=~/.local/share/nvim/site/after
set runtimepath^=~/.local/share/nvim/site

" change mapleader to ,
let mapleader=","

" Load external files
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/color.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim


" remove ansi colors
" :s/\e\[[0-9;]*m//g
