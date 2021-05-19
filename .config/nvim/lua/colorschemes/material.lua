-- darker, oceanic, deep-ocean, palenight
vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = true

-- material_style	"oceanic"	The theme comes in five styles, 'darker', 'lighter', 'palenight', 'oceanic' and 'deep ocean'
-- material_contrast	true	Make sidebars and popup menus like nvim-tree and telescope have a different background
-- material_lighter_contrast	false	Increase the contrast for the 'lighter' variant of the theme
-- material_italic_comments	false	Make comments italic
-- material_italic_keywords	false	Make keywords like if, for, while etc. italic
-- material_italic_functions	false	Make function calls and names italic
-- material_italic_variables	false	Make variable names and identifiers italic
-- material_borders	false	Enable the border between verticaly split windows visable
-- material_disable_background	false	Disable the setting of background color so that NeoVim can use your terminal background
-- material_variable_color	#717CB4	Set a custom color for variables and fields

-- :lua require('material.functions').toggle_style()
-- This command toggles the style

vim.cmd('hi! String guifg=#22BB99 ctermfg=green')
vim.cmd('hi! jsString guifg=#22BB99 ctermfg=green')
-- vim.cmd('hi Normal guifg=#bbbbbb ctermfg=white')

require('material').set()

