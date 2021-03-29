" prettier automatic formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

let g:prettier#config#single_quote = 'true'

nmap <Leader>py <Plug>(Prettier)
" npm install -g prettier
" gem install prettier

" :noautocmd w filename.js
" :autocmd! prettier *
" :autocmd! prettier BufWritePre *
" if has("autocmd")
"   " call prettier formatting on files after save without requiring @format tag
"   augroup prettier
"     autocmd!
"     autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"     autocmd BufWritePre *.rb %!prettier %
"   augroup END
" endif
"
