" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

  " Plug 'tpope/vim-liquid'
  Plug  'yuezk/vim-js'
  Plug  'HerringtonDarkholme/yats.vim'
  Plug  'maxmellon/vim-jsx-pretty'

  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'godlygeek/tabular'
  Plug 'kchmck/vim-coffee-script'

  Plug  'GutenYe/json5.vim'
  Plug  'StanAngeloff/php.vim'
  Plug  'andrewstuart/vim-kubernetes'
  Plug  'arzg/vim-sh'
  Plug  'chr4/nginx.vim'
  Plug  'chrisbra/csv.vim'
  Plug  'editorconfig/editorconfig-vim'
  Plug  'ekalinin/Dockerfile.vim'
  Plug  'elzr/vim-json'
  Plug  'ericpruitt/tmux.vim'
  Plug  'gisphm/vim-gitignore'
  Plug  'hashivim/vim-terraform'
  Plug  'jparise/vim-graphql'
  Plug  'moll/vim-node'
  Plug  'neoclide/jsonc.vim'
  Plug  'npxbr/glow.nvim'
  Plug  'pearofducks/ansible-vim'
  Plug  'rodjek/vim-puppet'
  Plug  'tpope/vim-git'
  Plug  'wgwoods/vim-systemd-syntax'
  Plug  'zinit-zsh/zinit-vim-syntax'
  Plug  'LnL7/vim-nix'
  Plug  'PotatoesMaster/i3-vim-syntax'

  Plug 'bfrg/vim-jq'

  " Don't highlight builtin functions/filters (default: 1)
  let g:jq_highlight_builtin_functions = 0

  " Don't highlight module prefix, like NAME:: (default: 1)
  let g:jq_highlight_module_prefix = 0

  " Don't highlight imported JSON file prefix, like $NAME:: (default: 1)
  let g:jq_highlight_json_file_prefix = 0

  " Highlight objects like .foo (default: 0)
  let g:jq_highlight_objects = 1

  " Highlight all function calls (default: 0)
  " This will highlight all words directly followed by an opening parenthesis
  let g:jq_highlight_function_calls = 1

call plug#end()
