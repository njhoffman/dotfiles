" search within files grep-like
"

Plug 'Chun-Yang/vim-action-ag'
" gag gagw gawi'
" use * to search current word in normal mode
" nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
" vmap * <Plug>AgActionVisual

Plug 'mileszs/ack.vim'
" let g:ackprg = 'ag --nogroup --column --vimgrep -S --hidden -u'

" hi! IncSearch      xxx cterm=reverse gui=reverse
" hi! IncSearch      xxx cterm=reverse gui=reverse
" hi! Search         xxx ctermfg=0 ctermbg=11 guifg=#afffff
" hi! EasyMotionIncSearchDefault xxx cterm=bold ctermfg=40 gui=bold guifg=#7fbf00

" nnoremap <Leader>s :Ag<CR>
if executable('ag')
  let g:ackprg = 'ag --nogroup --column --nonumber -S --hidden'
  let g:agprg = 'ag --nogroup --column --nonumber -S --hidden'
endif
" o to open, O top open and close the quickfix window
" go to preview file

" press shift-O to close preview window when opening file
" let g:ackprg = 'ag --nogroup --nocolor --column'

" browse tags of source code files in a sidebar
" needs ctags
" Plug 'Tagbar'
" nnoremap <F5> :buffers<CR>:buffer<Space>
" nnoremap <F6> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = '/home/vagrant/.nvm/version/node/v6.10.3/lib/node_modules/jsctags/bin/jsctags'
