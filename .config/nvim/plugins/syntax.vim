
" Plug 'pangloss/vim-javascript'
"
" jsx/tsx syntax
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_disable_tsx = 0
let g:vim_jsx_pretty_disable_jsx = 0

" Plug 'sheerun/vim-polyglot', { 'do': 'rm ~/.vim/plugged/vim-polyglot/after/indent/javascript.vim' }

" plasticboy/vim-markdown fenced syntax blocks
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = [
      \ 'coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript',
      \ 'python', 'css', 'sh', 'bash=sh', 'html', 'zsh', 'ruby', 'sass', 'xml']

let g:vim_markdown_no_extensions_in_markdown = 1

" plucked syntax from vim-polyglot
Plug 'zinit-zsh/zinit-vim-syntax'
Plug 'neoclide/jsonc.vim'
Plug 'elzr/vim-json'
Plug 'GutenYe/json5.vim'
Plug 'chr4/nginx.vim'
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-terraform'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'jparise/vim-graphql'
Plug 'arzg/vim-sh'
Plug 'ericpruitt/tmux.vim'
Plug 'andrewstuart/vim-kubernetes'
" to fix https://github.com/neoclide/coc-snippets/issues/126
Plug 'honza/vim-snippets'

Plug 'gisphm/vim-gitignore'

" language pack collection
" Plug 'sheerun/vim-polyglot'
" ensure jsx has latest version
" let g:polyglot_disabled = ['jsx']
" let g:polyglot_disabled = { "autoindent", "sensible" }
let g_javascript_sql_dialect = 'pgsql'
