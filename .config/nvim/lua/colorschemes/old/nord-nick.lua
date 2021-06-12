--Lua:
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_disable_background = true
require("nord-nick").set()

vim.cmd("hi! Type guifg=#becd36")
--html
vim.cmd("hi! htmlTag guifg=#7f90aa")
vim.cmd("hi! htmlEndTag guifg=#7f90aa")
vim.cmd("hi! htmlArg guifg=#7f90aa")
vim.cmd("hi! htmlTagName guifg=#7f90aa")

-- jsx
vim.cmd("hi! jsxTag guifg=#ff6600")
vim.cmd("hi! jsxTagName guifg=#ff6600")
vim.cmd("hi! jsxAttrib guifg=#88bbdd")
vim.cmd("hi! jsxEqual guifg=#6699bb")

vim.cmd("hi! link jsVariableType Type")
vim.cmd("hi! link jsxComponentName jsxTag")
vim.cmd("hi! link jsxRegexpString javascriptRegExpString")
vim.cmd("hi! link jsTemplateVar javascriptTemplateVar")
vim.cmd("hi! link jsTemplateDelim javascriptTemplateDelim")
vim.cmd("hi! link jsTemplateString javascriptTemplateString")

-- vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi! EndOfBuffer guibg=NONE ctermbg=NONE")
-- vim.cmd("hi! SignColumn guibg=NONE ctermbg=NONE")

-- vim.cmd("hi! String guifg=#22BB99 ctermfg=green")
-- vim.cmd("hi! Normal guifg=#9a9aaa ctermfg=white")
-- vim.cmd("hi! LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi! CursorLine guibg=#182224 ctermfg=Black")
-- vim.cmd("hi! CursorLineNr guifg=#afd7ff ctermfg=Black")
-- vim.cmd("hi! CursorColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi! Comment gui=italic")

-- -- LspDiagnosticsFloatingError
-- -- LspDiagnosticsFloatingWarning
-- -- LspDiagnosticsFloatingInformation
-- -- LspDiagnosticsFloatingHint

-- -- " hi! IncSearch      xxx cterm=reverse gui=reverse
-- -- " hi! IncSearch      xxx cterm=reverse gui=reverse
-- -- " hi! Search         xxx ctermfg=0 ctermbg=11 guifg=#afffff
-- -- " hi! EasyMotionIncSearchDefault xxx cterm=bold ctermfg=40 gui=bold guifg=#7fbf00
-- -- vim.cmd('hi! IncSearch gui=reverse cterm=reverse')
-- -- vim.cmd('hi! IncSearch cterm=bold ctermfg=40 gui=bold guifg=#7fbf00')
-- vim.cmd("hi! HlSearchLensCur guifg=#ff2266 guibg=#003333")
-- vim.cmd("hi! HlSearchLens guifg=#00DDFF guibg=#000000")
-- vim.cmd("hi! HlSearchCur guifg=#00FFDD guibg=#000000")

-- vim.cmd("hi! LspDiagnosticsDefaultWarning guifg=#664400")
-- vim.cmd("hi! LspDiagnosticsDefaultError guifg=#990000")
-- vim.cmd("hi! LspDiagnosticsDefaultHint guifg=#666688")
-- vim.cmd("hi! LspDiagnosticsDefaultInformation guifg=#664466")
-- -- vim.cmd('hi! Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE')
-- -- vim.cmd('hi! PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE')
-- -- vim.cmd('hi! Pmenu guifg=#717cb4 guibg=#090b10')
-- -- vim.cmd('hi! Pmenu guifg=#818ce4 guibg=#000804')
-- -- vim.cmd('hi! Pmenu guifg=#81bbd4 guibg=#080808')
-- -- vim.cmd('hi! PmenuSel guifg=#84ffff guibg=#3a4c55')
-- vim.cmd("hi! PmenuSbar guifg=#717cb4 guibg=#090b10")
-- vim.cmd("hi! PmenuThumb guifg=#8f93a2 guibg=#84ffff")
-- vim.cmd("hi! Pmenu ctermfg=250 ctermbg=235 guifg=#8cabcc guibg=#081018 ")
-- vim.cmd("hi! PmenuSel cterm=underline ctermfg=250 ctermbg=131 guifg=#6cffff guibg=#192224")
-- vim.cmd("set pumwidth=25")
-- vim.cmd("set pumblend=5")
-- vim.cmd("hi! PmenuSel blend=0")
-- -- vim.g.completion_menu_length = 30
-- -- vim.g.pumwidth = ##

-- -- hi! Normal ctermbg=NONE guibg=NONE
-- -- vim.cmd('hi! NormalFloat guifg=#8f93a2 guibg=#090b10')
-- -- material.bg =			'#0F111A'
-- -- material.bg_alt =		'#090B10'
-- -- material.accent =		'#84FFFF'
-- -- material.contrast =		'#090B10'
-- -- material.active =		'#1A1C25'
-- -- material.fg =			'#8F93A2'
-- -- material.text =			'#717CB4'
-- -- Pmenu =					{ fg = material.text, bg = material.contrast },
-- -- PmenuSel =				{ fg = material.accent, bg = material.active },
-- -- PmenuSbar =				{ fg = material.text, bg = material.contrast },
-- -- PmenuThumb =			{ fg = material.fg, bg = material.accent },
-- -- hi! Pmenu guifg=#99aacc guibg=#001818  ctermbg=234 ctermfg=250
-- -- hi! PmenuSel guifg=#bceeff guibg=#226888 ctermbg=23 ctermfg=255
-- -- hi! PmenuThumb ctermbg=23 ctermfg=255
-- -- hi! NormalFloat guifg=#99aacc guibg=#100812  ctermbg=234 ctermfg=250

-- -- suda.vim, startuptime.vim, wakatime, nvim-reload
