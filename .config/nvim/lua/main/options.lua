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

local buffer = { o, bo }
local window = { o, wo }

-- global scope
opt("background", "dark")
opt("backup", false)
opt("confirm", true)
opt("wb", false)
opt("lbr", true)
opt("wrap", false)
opt("tw", 1000)
opt("swapfile", false)
opt("clipboard", "unnamedplus")
-- opt("cmdheight", 2)
opt("cmdheight", 1)
opt("cmdwinheight", 7)
opt("completeopt", "noinsert,noselect,menuone")
opt("cpoptions", "aABceFs_")
opt("display", "msgsep")
opt("encoding", "UTF-8")
opt("guicursor", [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
-- opt("guicursor", "")
opt("hidden", true)
opt("incsearch", true)
opt("magic", true)
opt("hlsearch", true)
opt("ignorecase", true)
opt("inccommand", "nosplit")
opt("joinspaces", false)
opt("laststatus", 2)
opt("lazyredraw", true)
opt("modelines", 5)
opt("mouse", "nivh")
opt("previewheight", 7)
opt("scrolloff", 7)
opt("shada", [[!,'2000,<2000,s300,:3000,n~/.vim/.shada]])
-- opt("shortmess", o.shortmess .. "cS")
opt("shortmess", "filnxtToOcSIs")
opt("showmatch", true)
opt("showmode", false)
opt("sidescrolloff", 5)
opt("smartcase", true)
opt("splitbelow", true)
opt("splitright", true)
opt("termguicolors", true)
opt("undolevels", 1000)
-- opt("undodir", "~/.vim/undo")
opt("updatetime", 300)
opt("whichwrap", o.whichwrap .. "<,>,h,l")
opt("wildignore", "*.o,*~,*.pyc")
opt("wildmode", "longest,full")
opt("writebackup", false)
opt("timeoutlen", 500)
opt("pumheight", 20)
opt("sessionoptions", "curdir,folds,winsize")
opt("fileencoding", "utf-8")
opt("whichwrap", "b,s,<,>,[,],h,l")
opt("autoread", true)

-- window scope
opt("foldlevel", 1, window)
opt("foldnestmax", 10, window)
opt("foldenable", false, window)
opt("concealcursor", "nc", window)
opt("conceallevel", 2, window)
opt("cursorline", true, window)
opt("number", true, window)
opt("relativenumber", true, window)
opt("signcolumn", "auto:1", window)
opt("wrap", false, window)

-- buffer scope
opt("expandtab", true, buffer)
opt("modeline", true, buffer)
opt("shiftwidth", 2, buffer)
opt("smartindent", false, buffer)
opt("softtabstop", 0, buffer)
opt("synmaxcol", 2000, buffer)
opt("tabstop", 2, buffer)
opt("textwidth", 100, buffer)
opt("undofile", true, buffer)
opt("fileformat", "unix", buffer)

-- vim.o.guifont = "FiraCode Nerd Font:h17"

vim.cmd [[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
  end
end

-- " Set to auto read when a file is changed from the outside
-- au FocusGained,BufEnter * checktime
-- enable syntax highlighting
vim.cmd([[syntax on]])

-- " Enable filetype plugins
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype indent on]])

-- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
-- vim.cmd('set inccommand=split') -- Make substitution work in realtime
-- TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
-- vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
-- vim.o.pumheight = 10 -- Makes popup menu smaller
-- vim.cmd('set colorcolumn=99999') -- fix indentline for now
-- vim.o.conceallevel = 0 -- So that I can see `` in markdown files
-- vim.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
-- vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw
