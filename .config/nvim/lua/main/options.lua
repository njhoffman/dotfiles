local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local opt = require("utils.core").opt
-- -- Disable some built-in plugins we don't want
-- local disabled_built_ins = {
--   'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip',
--   'netrwPlugin'
-- }
-- for i = 1, 10 do g['loaded_' .. disabled_built_ins[i]] = 1 end

-- Leader/local leader
g.mapleader = [[,]]
g.maplocalleader = [[,]]

local buffer = {o, bo}
local window = {o, wo}

-- global scope
opt("background", "dark")
opt("backup", false)
opt("clipboard", "unnamedplus")
opt("cmdheight", 2)
opt("completeopt", "menu,menuone,noselect")
opt("display", "msgsep")
opt("encoding", "UTF-8")
opt("guicursor", [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt("hidden", true)
opt("hlsearch", true)
opt("ignorecase", true)
opt("inccommand", "nosplit")
opt("joinspaces", false)
opt("laststatus", 2)
opt("lazyredraw", true)
opt("mouse", "nivh")
opt("previewheight", 7)
opt("scrolloff", 7)
opt("shada", [[!,'2000,<2000,s300,:3000,n~/.vim/.shada]])
-- opt("shortmess", o.shortmess .. "cS")
opt("shortmess", "filnxtToOcSI")
opt("showmatch", true)
opt("showmode", false)
opt("sidescrolloff", 5)
opt("smartcase", true)
opt("splitbelow", true)
opt("splitright", true)
opt("termguicolors", true)
opt("undolevels", 1000)
opt("undodir", "~/.vim/undo")
opt("updatetime", 300)
opt("whichwrap", o.whichwrap .. "<,>,h,l")
opt("wildignore", "*.o,*~,*.pyc")
opt("wildmode", "longest,full")
opt("writebackup", false)
opt("timeoutlen", 500)

-- window scope
opt("concealcursor", "nc", window)
opt("conceallevel", 2, window)
opt("cursorline", true, window)
opt("number", true, window)
opt("relativenumber", true, window)
opt("signcolumn", "yes:1", window)
opt("wrap", false, window)

-- buffer scope
opt("expandtab", true, buffer)
opt("modeline", false, buffer)
opt("shiftwidth", 2, buffer)
opt("smartindent", true, buffer)
opt("softtabstop", 0, buffer)
opt("synmaxcol", 500, buffer)
opt("tabstop", 2, buffer)
opt("textwidth", 100, buffer)
opt("undofile", true, buffer)

-- vim.o.guifont = "FiraCode Nerd Font:h17"

-- enable syntax highlighting
vim.cmd("syntax on")

-- enable filetype detection
-- vim.cmd('filetype plugin indent on')

-- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
-- vim.cmd('set inccommand=split') -- Make substitution work in realtime
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
-- vim.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
-- vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw
