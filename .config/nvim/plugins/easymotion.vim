
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" should disable search hl when done searching
Plug 'romainl/vim-cool'
let g:CoolTotalMatches = 1


" Disable default mappings
let g:EasyMotion_do_mapping = 0
" quick character jump with one stroke
nmap s <Plug>(easymotion-overwin-f)
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.

" <Leader>f{char} to move to {char}
" map  <Leader>F <Plug>(easymotion-bd-f)
" nmap <Leader>F <Plug>(easymotion-overwin-f)
" map  <Leader>F <Plug>(easymotion-j)
" nmap <Leader>F <Plug>(easymotion-k)

" Move to line
map gl <Plug>(easymotion-bd-jk)
nmap gl <Plug>(easymotion-overwin-line)
" map <Leader>L <Plug>(easymotion-bd-w)
" nmap <Leader>L <Plug>(easymotion-bd-w)
" nnoremap s <Plug>(easymotion-bd-f)
" nmap s <Plug>(easymotion-s2)
" nmap s <Plug>(easymotion-sn)

" Move to word
map  gw <Plug>(easymotion-bd-w)
nmap gw <Plug>(easymotion-overwin-w)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" nmap t <Plug>(easymotion-t2)

" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)

" keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" Require tpope/vim-repeat to enable dot repeat support
" " Bidirectional & within line 't' motion
" omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 0
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" map J <Plug>(easymotion-j)
" map K <Plug>(easymotion-k)
"
" hack to fix false diagnostic errors from easymotion
" let g:easymotion#is_active = 0
" function! EasyMotionCoc() abort
"   if EasyMotion#is_active()
"     let g:easymotion#is_active = 1
"     CocDisable
"   else
"     if g:easymotion#is_active == 1
"       let g:easymotion#is_active = 0
"       CocEnable
"     endif
"   endif
" endfunction
" autocmd TextChanged,CursorMoved * call EasyMotionCoc()
"
" Fuzzy search with easy motion
" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#fuzzyword#converter()],
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \   'is_stay': 1
"   \ }), get(a:, 1, {}))
" endfunction
" noremap <silent><expr> <localleader>/ incsearch#go(<SID>config_easyfuzzymotion())

let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_cursor_highlight = 1

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
" map / <Plug>(incsearch-easymotion-/)
" map ? <Plug>(incsearch-easymotion-?)
" map g/ <Plug>(incsearch-easymotion-stay)

" map z/ <Plug>(incsearch-easymotion-/)
" map z? <Plug>(incsearch-easymotion-?)
" map zg/ <Plug>(incsearch-easymotion-stay)
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" map / <Plug>(incsearch-fuzzy-/)
" map ? <Plug>(incsearch-fuzzy-?)
" map g/ <Plug>(incsearch-fuzzy-stay)
" map  / <Plug>(easymotion-next)
" omap / <Plug>(easymotion-tn)
" nmap / <Plug>(easymotion-sn)
" xmap / <Esc><Plug>(easymotion-sn)\v%V
" omap / <Plug>(easymotion-tn)
" nmap g/ <Plug>(easymotion-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nnoremap <C-n> <Tab>
nnoremap <C-p> <S-Tab>
" Enter by <Space> to excute faster & easily
" EMCommandLineNoreMap <Space> <CR>
