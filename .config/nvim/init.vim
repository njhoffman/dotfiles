" ********** Main Loader **********
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath^=~/.config/nvim
set runtimepath+=~/.config/nvim/after
set runtimepath^=~/.local/share/nvim/site
set runtimepath+=~/.local/share/nvim/site/after

" change mapleader to ,
let mapleader=","

" Load external files
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim

lua << EOF
  -- trace, debug, info, warn, error
  vim.lsp.set_log_level("info")
  require('init')
EOF

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugins/barbar-colors.vim
