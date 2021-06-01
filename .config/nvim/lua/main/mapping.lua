local config = require("config")
local map = require("utils.core").map

-- map underscore to remove search highlighting
map("n", "_", ":nohl<CR>")

-- Blink current search match
-- vim.cmd('nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>')
-- vim.cmd('nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>')

-- Note that g! is equivalent to v, so you could also do the above with:
-- deleting lines
-- :g/profile/d
-- :g/^\s*$/d
-- :g!/^\s*"/d

-- session saving/loading
map("n", "ss", ":<C-u>SessionSave<CR>", {silent = true})
map("n", "sl", ":<C-u>SessionLoad<CR>", {silent = true})

-- buffer management
map("n", "<Leader>q", "<cmd>qa<cr>", {silent = true})
map("n", "<Leader>x", "<cmd>x!<cr>", {silent = true})
map("n", "<Leader>w", "<cmd>w<cr>", {silent = true})
map("n", "W", ":noa w<cr>", {silent = true})
map("n", "<C-q>", "<cmd>q<cr>", {silent = true})
map("n", "<C-x>", "<cmd>x<cr>", {silent = true})
map("n", "<C-s>", "<cmd>w<cr>", {silent = true})
map("i", "<C-s>", "<esc><cmd>w<cr>", {silent = true})
-- map('n', '<leader>d', '<cmd>Sayonara<cr>', {silent = true, nowait = true})

-- Esc in the terminal
map("t", "jj", [[<C-\><C-n>]])

-- Window movement
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
map("n", "<Leader>;", "<c-w>w")
map("n", "<Leader>H", "<cmd>vnew<cr>")
map("n", "<Leader>V", "<cmd>new<cr>")
-- make full screen / equal heights, close non-focused window
map("n", "<Leader>_", "<c-w>_")
map("n", "<Leader>|", "<c-w>|")
map("n", "<Leader>=", "<c-w>=")
map("n", "<Leader>q", "<c-w><c-p><cmd>q<cr>")
-- " C-W make all equal, C-W -/+ change height, CTRL-W >/< change width
-- nnoremap + 4<C-W>+
-- nnoremap - 4<C-W>-

-- visual mode mappings
map("n", "gV", "gv", {noremap = true})
map("n", "gv", "'[V']", {noremap = true})
map("n", "<leader>[", "`[V`]<", {noremap = true})
map("n", "<leader>]", "`[V`]>", {noremap = true})

-- noremap <Space> :<c-u>noh<CR>:echo<CR>

-- " select put text, via http://stackoverflow.com/a/4775281/955926
-- " toggle fold under cursor
-- nnoremap <silent> zz zA
-- nnoremap <silent> <Leader>z zA
-- " close all folds
-- nnoremap <silent> zZ zM
-- " open all folds
-- nnoremap <silent> ZZ zR

-- " map current directory
-- nnoremap <silent> <Leader>cd :cd %:h<CR>
-- nnoremap <silent> <Leader>cdh :cd ~<CR>
-- nnoremap <silent> <Leader>cdr :cd /<CR>
-- " better commandline mode mappings
-- cnoremap <silent> <M-[> <C-u>:History:<CR>
-- cnoremap <C-b> <Left>
-- cnoremap <C-f> <Right>
-- cnoremap <M-b> <S-Left>
-- cnoremap <M-f> <S-Right>
-- " <C-n>: next history.
-- " cnoremap <C-n>          <Down>
-- " <C-p>: previous history.
-- " cnoremap <C-p>          <Up>
-- " <C-y>: paste.
-- cnoremap <C-y>          <C-r>*
-- " <C-g>: Exit.
-- cnoremap <C-g>          <C-c>
-- nnoremap q; q:

-- " Disable ex mode
-- nnoremap Q <Nop>

-- print(vim.inspect(vim.api.nvim_get_keymap('n')))
-- :verbose nmap
-- set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
