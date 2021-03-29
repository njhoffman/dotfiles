" expand visual selection incrementally
Plug 'terryma/vim-expand-region'
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)

" always stay in select mode
let g:expand_region_use_select_mode = 1

" Default settings. (NOTE: Remove comments in dictionary before sourcing)
" let g:expand_region_text_objects = {
"       \ 'iw'  :0,
"       \ 'iW'  :0,
"       \ 'i"'  :0,
"       \ 'i''' :0,
"       \ 'i]'  :1, " Support nesting of square brackets
"       \ 'ib'  :1, " Support nesting of parentheses
"       \ 'iB'  :1, " Support nesting of braces
"       \ 'il'  :0, " 'inside line'. Available through https://github.com/kana/vim-textobj-line
"       \ 'ip'  :0,
"       \ 'ie'  :0, " 'entire file'. Available through https://github.com/kana/vim-textobj-entire
"       \ }
"
" Extend the global default (NOTE: Remove comments in dictionary before sourcing)
" call expand_region#custom_text_objects({
"       \ "\/\\n\\n\<CR>": 1, " Motions are supported as well. Here's a search motion that finds a blank line
"       \ 'a]' :1, " Support nesting of 'around' brackets
"       \ 'ab' :1, " Support nesting of 'around' parentheses
"       \ 'aB' :1, " Support nesting of 'around' braces
"       \ 'ii' :0, " 'inside indent'. Available through https://github.com/kana/vim-textobj-indent
"       \ 'ai' :0, " 'around indent'. Available through https://github.com/kana/vim-textobj-indent
"       \ })
