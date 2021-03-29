" language pack collection
Plug 'sheerun/vim-polyglot'
" let g:polygot_disabled = ['css']
let g_javascript_sql_dialect = 'pgsql'


" plasticboy/vim-markdown fenced syntax blocks
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = [
      \ 'coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript',
      \ 'python', 'css', 'sh', 'bash=sh', 'html', 'zsh', 'ruby', 'sass', 'xml']

let g:vim_markdown_no_extensions_in_markdown = 1

" jsx syntax
Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_highlight_close_tag = 1

" kubernetes
Plug 'andrewstuart/vim-kubernetes'


