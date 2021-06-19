" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Plug  'yuezk/vim-js',
" Plug  'HerringtonDarkholme/yats.vim',
" Plug  'maxmellon/vim-jsx-pretty',
" Plug  'plasticboy/vim-markdown',
" Plug  'GutenYe/json5.vim',
" Plug  'StanAngeloff/php.vim',
" Plug  'andrewstuart/vim-kubernetes',
" Plug  'arzg/vim-sh',
" Plug  'chr4/nginx.vim',
" Plug  'chrisbra/csv.vim',
" Plug  'editorconfig/editorconfig-vim',
" Plug  'ekalinin/Dockerfile.vim',
" Plug  'elzr/vim-json',
" Plug  'ericpruitt/tmux.vim',
" Plug  'gisphm/vim-gitignore',
" Plug  'hashivim/vim-terraform',
" Plug  'jparise/vim-graphql',
" Plug  'moll/vim-node',
" Plug  'neoclide/jsonc.vim',
" Plug  'npxbr/glow.nvim',
" Plug  'pearofducks/ansible-vim',
" Plug  'rodjek/vim-puppet',
" Plug  'tpope/vim-git',
" Plug  'wgwoods/vim-systemd-syntax',
" Plug  'zinit-zsh/zinit-vim-syntax'
" Plug  'tpope/vim-liquid'

  " Plug 'vim-pandoc/vim-pandoc'
  " Plug 'vim-pandoc/vim-pandoc-syntax'
  " Plug 'njhoffman/vim-liquid'

call plug#end()
