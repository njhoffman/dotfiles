" show inline colors in sign column, fg text or bg text
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
" let g:Hexokinase_ftDisabled = 1

" foreground, foregroundfull, background, backgroundfull, virtual, sign_column
let g:Hexokinase_highlighters = ['virtual']
" let g:Hexokinase_highlighters = ['sign_column']

" Fix ansi escape codes in buffer, :AnsiEsc
" forked from powerman to disable mappings
Plug 'joeysino/vim-plugin-AnsiEsc'
let g:no_cecutil_maps = 1

" show syntax highlight linkages, :HLT!
Plug 'gerw/vim-HiLinkTrace'
