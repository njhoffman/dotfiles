" show fzf instead of coc.nvim built in fuzzy-finder
Plug 'antoinemadec/coc-fzf'

" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" :CocList / CocList extensions / CocInstall coc-marketplace
" :CocList marketplace python :CocInstall / CocUninstall
" coc-json coc-css coc-html coc-eslint coc-tsserver coc-yaml
" coc-lists coc-markdownlint coc-solargraph coc-git
" apt-get install ccls
" gem install solargraph
" npm install -g graphql-lsp dockerfile-language-server-nodejs
" npm install -g bash-language-server
" terraform-lsp

" traverses within location window
try
    nmap <silent> [c :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry

" Use `[g` and `]g` to navigate diagnostics outside of window
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <Leader>gs <Plug>(coc-git-chunkinfo)
nmap <silent> <Leader>gS <Plug>(coc-git-commit)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " navigate chunks of current buffer
" nmap [g <Plug>(coc-git-prevchunk)
" nmap ]g <Plug>(coc-git-nextchunk)
" " navigate conflicts of current buffer
" nmap [c <Plug>(coc-git-prevconflict)
" nmap ]c <Plug>(coc-git-nextconflict)
" " show chunk diff at current position
" nmap gs <Plug>(coc-git-chunkinfo)
" " show commit contains current position
" nmap gc <Plug>(coc-git-commit)
" " create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
  " " Using CocList
  " " Show all diagnostics
  nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
  " " Manage extensions
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " " Show commands
  " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " " Find symbol of current document
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " " Search workspace symbols
  " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " " Resume latest coc list
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  "
  " sign ALEErrorSign text=  linehl=ALEErrorLine texthl=ALEErrorSign
  " sign ALEStyleErrorSign text=  linehl=ALEErrorLine texthl=ALEStyleErrorSign
  " sign ALEWarningSign text= ✘ linehl=ALEWarningLine texthl=ALEWarningSign
  " sign ALEStyleWarningSign text= ✘ linehl=ALEWarningLine
  " texthl=ALEStyleWarningSign
  " sign ALEInfoSign text= כֿ linehl=ALEInfoLine texthl=ALEInfoSign
  "
