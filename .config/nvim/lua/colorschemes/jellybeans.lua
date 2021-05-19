
vim.g.jellybeans_use_lowcolor_black = 1
vim.g.jellybeans_use_gui_italics = 1
vim.g.jellybeans_use_term_italics = 1
vim.g.jellybeans_use_term_background_color = 1
-- vim.g.jellybeans_background_color = 'none'
-- vim.g.jellybeans_overrides = {    'background': { 'guibg': 'none' } }

-- vim.g.jellybeans_overrides.background = { guibg: 'none' }

vim.cmd('colorscheme jellybeans')
vim.cmd('hi! Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi! EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('hi! SignColumn guibg=NONE ctermbg=NONE')


-- vim.cmd('hi! background guibg=NONE')
vim.cmd('hi! String guifg=#22BB99 ctermfg=green')
vim.cmd('hi! Constant guifg=#6699aa ctermfg=LightBlue')
vim.cmd('hi! Identifier guifg=#8eb9c6 ctermfg=LightCyan')
vim.cmd('hi! StorageClass guifg=#c59f6f ctermfg=Blue')

vim.cmd('hi! LineNr guibg=NONE ctermbg=NONE')
vim.cmd('hi! CursorLine guibg=#081214 ctermfg=Black')
vim.cmd('hi! CursorLineNr guifg=#afd7ff ctermfg=Black')
vim.cmd('hi! CursorColumn guibg=NONE ctermbg=NONE')

vim.cmd('hi! GitGutterAdd guifg=#007700 guibg=NONE ctermbg=NONE');
vim.cmd('hi! GitGutterChange guifg=#999900 guibg=NONE ctermbg=NONE');
vim.cmd('hi! GitGutterDelete guifg=#880000 guibg=NONE ctermbg=NONE');

-- transparent bg
-- vim.autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
-- vim.autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
-- vim.autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE

