-- bluz71/vim-nightfly-guicolors

-- The g:nightflyCursorColor option specifies whether to color the cursor or not. By default the cursor will NOT be colored. If you prefer a colored cursor then add the following to your vimrc:
vim.g.nightflyCursorColor = 1

-- The g:nightflyTerminalColors option specifies whether to use the nightfly color palette in :terminal windows when termguicolors is set. By default this option is enabled. If you prefer not to use the nightfly color palette for the first 16 terminal colors then add the following to your vimrc:
vim.g.nightflyTerminalColors = 0

-- The g:nightflyUnderlineMatchParen option specifies whether to underline matching parentheses. By default this option is disabled. If you want to underline matching parentheses then add the following to your vimrc:
vim.g.nightflyUnderlineMatchParen = 1

-- The g:nightflyUndercurls option specifies whether to use undercurls for spelling and linting errors in GUI versions of Vim, including terminal Vim with termguicolors set. By default this option is enabled. If you do not like the appearance of undercurls then add the following to your vimrc:
vim.g.nightflyUndercurls = 0

-- The g:nightflyItalics option specifies whether to use italics for comments and certain HTML elements in GUI versions of Vim. By default this option is enabled. If you do not like the appearance of italics then add the following to your vimrc:
vim.g.nightflyItalics = 0

-- The g:nightflyTransparent option specifies whether to use an opaque or transparent background in GUI versions of Vim. By default this option is disabled. If you would like a transparent background then add the following to your vimrc:
vim.g.nightflyTransparent = 1

-- The g:nightflyNormalFloat option specifies whether to use customised background and foreground colors in Neovim floating windows. By default this options is disabled, hence, Neovim floating windows will usually be styled with popup menu colors. If you would like to use nightfly colors instead then add the following to your configuration:
vim.g.nightflyNormalFloat = 1

-- bulb If the above option is set then it is highly recommended to enable floating window borders to distinguish between the edit and floating windows, for example:
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--    vim.lsp.handlers.hover, {
--      border = {
--        {'┌', 'FloatBorder'},
--        {'─', 'FloatBorder'},
--        {'┐', 'FloatBorder'},
--        {'│', 'FloatBorder'},
--        {'┘', 'FloatBorder'},
--        {'─', 'FloatBorder'},
--        {'└', 'FloatBorder'},
--        {'│', 'FloatBorder'}
--      }
--    }
--   )

vim.cmd('colorscheme nightfly')
