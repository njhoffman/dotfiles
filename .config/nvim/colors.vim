let g:jellybeans_overrides = {
\    'background': { 'guibg': 'none' },
\}

let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_use_gui_italics = 1
let g:jellybeans_use_term_italics = 1

let g:jellybeans_use_term_background_color = 0

colorscheme jellybeans

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE

