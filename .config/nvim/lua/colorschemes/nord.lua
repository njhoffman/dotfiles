vim.cmd("colorscheme nord")
vim.cmd('hi! Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi! EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('hi! SignColumn guibg=NONE ctermbg=NONE')

vim.cmd('hi! String guifg=#22BB99 ctermfg=green')
vim.cmd('hi Normal guifg=#9a9aaa ctermfg=white')
vim.cmd('hi! LineNr guibg=NONE ctermbg=NONE')
vim.cmd('hi! CursorLine guibg=#182224 ctermfg=Black')
vim.cmd('hi! CursorLineNr guifg=#afd7ff ctermfg=Black')
vim.cmd('hi! CursorColumn guibg=NONE ctermbg=NONE')
vim.cmd('hi! Comment gui=italic')

-- LspDiagnosticsFloatingError
-- LspDiagnosticsFloatingWarning
-- LspDiagnosticsFloatingInformation
-- LspDiagnosticsFloatingHint

vim.cmd('hi! LspDiagnosticsDefaultWarning guifg=#664400')
vim.cmd('hi! LspDiagnosticsDefaultError guifg=#990000')
vim.cmd('hi! LspDiagnosticsDefaultHint guifg=#666688')
vim.cmd('hi! LspDiagnosticsDefaultInformation guifg=#664466')

-- vim.cmd('hi! Pmenu guifg=#717cb4 guibg=#090b10')
-- vim.cmd('hi! Pmenu guifg=#818ce4 guibg=#000804')
vim.cmd('hi! Pmenu guifg=#819bb4 guibg=#101814')
vim.cmd('hi! PmenuSel guifg=#84ffff guibg=#3a3c45')
vim.cmd('hi! PmenuSbar guifg=#717cb4 guibg=#090b10')
vim.cmd('hi! PmenuThumb guifg=#8f93a2 guibg=#84ffff')
-- vim.g.completion_menu_length = 30
-- vim.g.pumwidth = ##

-- vim.cmd('hi! NormalFloat guifg=#8f93a2 guibg=#090b10')
-- material.bg =			'#0F111A'
-- material.bg_alt =		'#090B10'
-- material.accent =		'#84FFFF'
-- material.contrast =		'#090B10'
-- material.active =		'#1A1C25'
-- material.fg =			'#8F93A2'
-- material.text =			'#717CB4'
-- Pmenu =					{ fg = material.text, bg = material.contrast },
-- PmenuSel =				{ fg = material.accent, bg = material.active },
-- PmenuSbar =				{ fg = material.text, bg = material.contrast },
-- PmenuThumb =			{ fg = material.fg, bg = material.accent },
-- hi! Pmenu guifg=#99aacc guibg=#001818  ctermbg=234 ctermfg=250
-- hi! PmenuSel guifg=#bceeff guibg=#226888 ctermbg=23 ctermfg=255
-- hi! PmenuThumb ctermbg=23 ctermfg=255
-- hi! NormalFloat guifg=#99aacc guibg=#100812  ctermbg=234 ctermfg=250
