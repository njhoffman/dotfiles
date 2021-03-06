" vim-easy-align alignment inhancer
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" vmap <Enter> <Plug>(EasyAlign)

let g:easy_align_ignore_groups = ['Comment', 'String']

" TODO: map Enter to delimiter_align in interactive mode

" Left-alignment around the FIRST occurrences of delimiters
" :EasyAlign =

" Left-alignment around the SECOND occurrences of delimiters
" :EasyAlign 2=

" Left-alignment around the LAST occurrences of delimiters
" :EasyAlign -=

" Left-alignment around ALL occurrences of delimiters
" :EasyAlign *=

" Left-right ALTERNATING alignment around all occurrences of delimiters
" :EasyAlign **=

" Right-left ALTERNATING alignment around all occurrences of delimiters
" :EasyAlign! **=
" press Ctrl-P in interactive mode for Live interactive mode
" Start interactive mode with filter option set to g/hello/
" EasyAlign g/hello/

" Start live interactive mode with filter option set to v/goodbye/
" LiveEasyAlign v/goodbye/

" Align the lines with 'hi' around the first colons
" EasyAlign:g/hi/

" ga:
" ga->:
" ga2:
" ga*:
" testing:  one
" test: two: three
"
" ga*|
" ga**|
" ga<C-P> *|  <C-D>
" |Option|Type|Default|Description|
" |--|--|--|--|
" |threads|Fixnum|1|number of threads|
" |queues|Fixnum|1|number of concurrent queues|
" |batch|Boolean|false|enables batch mode|
