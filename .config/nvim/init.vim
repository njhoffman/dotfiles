" ********** Main Loader **********

" Load external files
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim

lua << EOF
  require('init')
EOF

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plugins/barbar-colors.vim
