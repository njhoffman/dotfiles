-- https://github.com/neg-serg/neg

vim.cmd('colorscheme neg')
vim.cmd('hi! Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi! EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('hi! SignColumn guibg=NONE ctermbg=NONE')

vim.cmd('hi! String guifg=#008877 ctermfg=green')
-- vim.cmd('hi! Normal guifg=#bbbbbb ctermfg=white')

vim.cmd('hi! LineNr guibg=NONE ctermbg=NONE')
vim.cmd('hi! CursorLine guibg=#081214 ctermfg=Black')
vim.cmd('hi! CursorLineNr guibg=NONE guifg=#afd7ff ctermfg=Black')
vim.cmd('hi! CursorColumn guibg=NONE ctermbg=NONE')

vim.cmd('hi! Constant guifg=#6699aa ctermfg=LightBlue')
vim.cmd('hi! jsBuiltinValues guifg=#666688 ctermfg=LightBlue')
vim.cmd('hi! jsIdentifier guifg=#6699aa ctermfg=LightBlue')
vim.cmd('hi! MatchParen guibg=NONE ctermbg=NONE guifg=#66ccff ctermfg=blue')
vim.cmd('hi! MatchWord guibg=NONE ctermbg=NONE guifg=#66ccff ctermfg=blue')

vim.cmd('hi! LspDiagnosticsDefaultWarning guifg=#664400')
vim.cmd('hi! LspDiagnosticsDefaultError guifg=#990000')
vim.cmd('hi! LspDiagnosticsDefaultHint guifg=#666688')
vim.cmd('hi! LspDiagnosticsDefaultInformation guifg=#664466')
