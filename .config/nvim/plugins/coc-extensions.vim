" show fzf instead of coc.nvim built in fuzzy-finder
Plug 'antoinemadec/coc-fzf'

"
" :CocList / CocList extensions / CocInstall coc-marketplace
" :CocList marketplace python :CocInstall / CocUninstall
" coc-json coc-css coc-html coc-eslint coc-tsserver coc-yaml
" coc-lists coc-markdownlint coc-solargraph coc-git
" apt-get install ccls
" gem install solargraph
" npm install -g graphql-lsp dockerfile-language-server-nodejs
" npm install -g bash-language-server
" terraform-lsp

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
  " Prettier command
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
