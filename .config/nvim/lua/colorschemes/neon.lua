-- https://github.com/rafamadriz/neon

vim.g.neon_style = "dark"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true

vim.cmd[[colorscheme neon]]
vi
-- neon_style	"default"	There's three options to choose from, default, dark and light
-- neon_italic_comment	true	Italic text for comments
-- neon_italic_keyword	false	Applies to conditionals and keywords like for, do, while, loops etc.
-- neon_italic_boolean	false	true and false
-- neon_italic_function	false	Applies to function (calls and definitions), method (calls and definitions) and built-in functions.
-- neon_italic_variable	false	Applies to variable names that are defined by the languages, like this or self. And any variable name that does not have another highlight group.
-- neon_bold	false	Applies to error and warning messages, functions (calls and definitions), lsp virtual text, etc.
