" enhanced word motions
Plug 'chaoren/vim-wordmotion'

" a word (lowercase) is any of the following
"
" |------------------+---------------------|
" |     Acronyms     |    [HTML]And[CSS]   |
" |:================:+:===================:|
" |  Uppercase words | [UPPERCASE] [WORDS] |
" |  Lowercase words | [lowercase] [words] |
" |  Hex color codes |      [#0f0f0f]      |
" |   Hex literals   |  [0x00ffFF] [0x0f]  |
" |  Octal literals  |   [0o644] [0o0755]  |
" |  Binary literals |   [0b01] [0b0011]   |
" |  Regular numbers |    [1234] [5678]    |
" | Other characters |       [~!@#$]       |
"
" uppercase is any sequence of non-space characters separated by spaces

let g:wordmotion_spaces = ['_', '-', '.']
" default: let g:wordmotion_spaces = ['_']

"
" | Mode |        Mapping        |
" |:====:+:=====================:|
" |  nxo |          w/W          |
" |  nxo |          b/B          |
" |  nxo |          e/E          |
" |  nxo |         ge/gE         |
" |  xo  |         aw/aW         |
" |  xo  |         iw/iW         |
" |   c  | <C-R><C-W>/<C-R><C-A> |
"
