local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

local opt = require('utils.core').opt

-- Leader/local leader
g.mapleader = [[,]]
g.maplocalleader = [[,]]

-- Settings
local buffer = {o, bo}
local window = {o, wo}
opt('termguicolors', true)
opt('background', 'dark')
opt('scrolloff', 7)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
opt('whichwrap', o.whichwrap .. '<,>,h,l')
opt('inccommand', 'nosplit')
opt('lazyredraw', true)
opt('showmatch', true)
opt('hlsearch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('clipboard', 'unnamedplus')
opt('laststatus', 2)
opt('showmode', false)
opt('shada', [['20,<50,s10,h,/100]])
opt('hidden', true)
opt('shortmess', o.shortmess .. 'c')
opt('completeopt', 'menuone,noselect')
opt('joinspaces', false)
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('updatetime', 300)
opt('previewheight', 5)
opt('cmdheight', 2)
opt('scrolloff', 5)
opt('sidescrolloff', 5)
opt('display', 'msgsep')
opt('mouse', 'nivh')
opt('splitright', true)
opt('splitbelow', true)
opt('backup', false)
opt('writebackup', false)

opt('wrap', false, window)
opt('number', true, window)
opt('relativenumber', true, window)
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)
opt('cursorline', true, window)
opt('signcolumn', 'yes:1', window)

opt('textwidth', 100, buffer)
opt('tabstop', 2, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('smartindent', true, buffer)
opt('undofile', true, buffer)
opt('synmaxcol', 500, buffer)
opt('modeline', false, buffer)

-- we support termguicolors

-- vim.o.guifont = "FiraCode Nerd Font:h17"

-- set language to english
-- vim.cmd('language en_US.utf-8')
-- vim.v.lang = 'en_US'

-- enable syntax highlighting
vim.cmd('syntax on')

-- enable filetype detection
-- vim.cmd('filetype plugin indent on')

-- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
-- vim.cmd('set inccommand=split') -- Make substitution work in realtime
-- vim.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
-- vim.o.title = true
-- TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.cmd('let &titleold="'..TERMINAL..'"')
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
-- vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
-- vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
-- vim.o.pumheight = 10 -- Makes popup menu smaller
-- vim.o.fileencoding = "utf-8" -- The encoding written to file
-- vim.o.cmdheight = 2 -- More space for displaying messages
-- vim.cmd('set colorcolumn=99999') -- fix indentline for now
-- vim.o.mouse = "a" -- Enable your mouse
-- vim.o.splitbelow = true -- Horizontal splits will automatically be below
-- vim.o.termguicolors = true -- set term gui colors most terminals support this
-- vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
-- vim.o.conceallevel = 0 -- So that I can see `` in markdown files
-- vim.cmd('set ts=4') -- Insert 2 spaces for a tab
-- vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
-- vim.cmd('set expandtab') -- Converts tabs to spaces
-- vim.o.showtabline = 2 -- Always show tabs
-- vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- vim.o.backup = false -- This is recommended by coc
-- vim.o.writebackup = false -- This is recommended by coc
-- vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
-- vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw
