local map = require("utils.core").map

-- Blink current search match
-- vim.cmd('nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>')
-- vim.cmd('nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>')

-- Note that g! is equivalent to v, so you could also do the above with:
-- deleting lines
-- :g/profile/d
-- :g/^\s*$/d
-- :g!/^\s*"/d
-- basics
map("i", "jk", [[col('.') == 1 ? '<esc>' : '<esc>l']], { expr = true })
map("n", "<leader>tS", ":luafile %<CR>", { silent = false })
map("n", "<BS>", "<C-^>")
map("t", "<C-o>", [[<C-\><C-n>]])
-- map("n", "<A-t>", ":ToggleTerm<CR>")
map("t", "<A-t>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("n", "D", "d$")
-- map('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"' , {expr = true})
-- map('t', 'jj', '<ESC>', {noremap = false})
-- map('v', '<leader>s', ':s//gcI<Left><Left><Left><Left>')

-- :map <C-X> <ESC>:x<CR>
-- :imap <C-X> <ESC>:x<CR>
-- " better commandline mode mappings
-- cnoremap <silent> <M-[> <C-u>:History:<CR>
-- <c-r>,+  pastes into comman
-- next/prev history, copy
vim.cmd([[cnoremap <C-n>          <Down>]])
vim.cmd([[cnoremap <C-p>          <Up>]])
vim.cmd([[cnoremap <C-y>          <C-r>*]])
-- vim.cmd([[cnoremap <esc>  <C-c>]])
-- cnoremap <C-g>          <C-c>
-- vim.cmd([[au CmdwinEnter : let b:cpt_save = &cpt | set cpt=.]])
-- vim.cmd([[au CmdwinLeave : let &cpt = b:cpt_save]])
-- vim.cmd([[au CmdwinEnter [/?]  startinsert]])

vim.cmd([[au CmdwinEnter * nnoremap <buffer><esc> <C-c><C-c>]])
vim.cmd([[au CmdwinEnter * startinsert ]])
vim.cmd([[au CmdwinEnter * set nonumber norelativenumber]])

map("n", "<leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]],
    { silent = false })
map("n", "<leader>ns", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]],
    { silent = false })
map("n", "<leader>nt", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]],
    { silent = false })

-- prevent "write partial file" nonsense
vim.cmd(
    [[cabbrev <expr> w getcmdtype()==':' && getcmdline() == "'<,'>w" ? '<c-u>w' : 'w']])
-- buffer management

-- " Return to last edit position when opening files (You want this!)
-- au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

-- Esc in the terminal
map("t", "jj", [[<C-\><C-n>]])

-- visual mode mappings
-- vim.cmd([[xmap <leader>s <plug>(scratch-selection-reuse)]])
-- vim.cmd([[xmap <leader>S <plug>(scratch-selection-clear)]])
-- Visually select, paste the text that was last edited/pasted
map("n", "gv", "`[v`]", { noremap = false })
map("n", "<leader>[", "`[V`]<", { noremap = true })
map("n", "<leader>]", "`[V`]>", { noremap = true })
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")
-- " Visual mode pressing * or # searches for the current selection
-- vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
-- vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

-- Remap for dealing with word wrap in Normal mode/Visual mode
map("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true })
map("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true })
map("x", "k", "(v:count == 0 && mode() !=# \"V\") ? \"gk\" : \"k\"",
    { expr = true })
map("x", "j", "(v:count == 0 && mode() !=# \"V\") ? \"gj\" : \"j\"",
    { expr = true })
-- Automatically jump to the end of pasted text
map("v", "y", "y`]")
map("v", "p", "p`]")
map("n", "p", "p`]")

-- map("n", "<F5>", ":lua require('utils.core')._lazygit_toggle()<CR>")
-- :map <C-X> <ESC>:x<CR>
-- :imap <C-X> <ESC>:x<CR>

-- ["<C-f>"] = {"<Plug>(SmoothieForwards)", "Scroll forward"},
-- TODO: fork and add option to limit overshot
-- TODO: add shift mapping for twice the speed

-- Window movement
-- " C-W make all equal, C-W -/+ change height, CTRL-W >/< change width

-- nnoremap + 4<C-W>+
-- nnoremap - 4<C-W>-

-- nnoremap Q @@
-- Instead of stumbling into ex mode, repeat the last macro used.

-- nnoremap s "_d
-- Makes s (along with corresponding maps for ss and S) act like d, except it doesn’t save the cut text to a register. Helps when I want to delete something without clobbering my unnamed register.

-- nnoremap <c-j> <c-w>j
-- Move to window below. Corresponding maps for h, k, l. Makes using windows much easier.

-- nnoremap <leader>e :exe getline(line('.'))<cr>
-- Run the current line as if it were a command. Often more convenient than q: when experimenting.

local window_map = {
  ["<s-k>"] = { ":resize -2<CR>" },
  ["<s-j>"] = { ":resize +2<CR>" },
  ["<s-h>"] = { ":vertical resize -2<CR>" },
  ["<s-l>"] = { ":vertical resize +2<CR>" },
  ["<c-h>"] = { "<c-w>h" },
  ["<c-j>"] = { "<c-w>j" },
  ["<c-k>"] = { "<c-w>k" },
  ["<c-l>"] = { "<c-w>l" },
  ["<leader>"] = {
    [";"] = { "<c-w>w" },
    ["H"] = { "<cmd>vnew<cr>" },
    ["V"] = { "<cmd>new<cr>" },
    ["_"] = { "<c-w>_" },
    ["|"] = { "<c-w>|" },
    ["= "] = { "<c-w>=" },
    ["q"] = { "<c-w><c-p><cmd>q<cr>" },
  },
  ["<leader>j"] = {
    name = "+jump windows",
    ["h"] = { "<cmd>wincmd h<cr>", "Left" },
    ["j"] = { "<cmd>wincmd j<cr>", "Down" },
    ["k"] = { "<cmd>wincmd k<cr>", "Up" },
    ["l"] = { "<cmd>wincmd l<cr>", "Right" },
  },
}

local buffer_map = {
  -- ["q"] = {"<cmd>update | bdelete<CR>", "Save and safely remove buffer"},
  -- [":"] = { ":<C-f>", "auto open task window" },
  ["Q"] = { "<nop>" },
  ["_"] = { "<cmd>noh<cr>", "remove highlight" },
  ["<c-q>"] = { "<cmd>qa<cr>", "Quick exit without saving" },
  ["<c-x>"] = { "<cmd>xa!<cr>", "Quick exit with saving" },
  ["<C-s>"] = { "<cmd>w<cr><esc>", "Quick save" },
  ["<tab>"] = { "<cmd>bn<CR>", "Cycle buffers" },
  ["<s-tab>"] = { "<cmd>bp<CR>", "Cycle buffers" },
  ["H"] = { "<cmd>BufferPrev<CR>", "Buffer left" },
  ["L"] = { "<cmd>BufferNext<CR>", "Buffer right" },
  ["ZZ"] = "Write if modified and exit",
  -- ["<Leader>s"] = { "<cmd>call scratch#insert(0)<cr>", "scratch clear"},
  -- ["<Leader>S"] = { "<cmd>call scratch#insert(1)<cr>", "scratch reuse"},
  ["<leader>"] = {
    ["<cr>"] = { "<cmd>noh<cr>", "remove highlight" },
    ["q"] = { "<cmd>Sayonara<cr>", "Close window saving" },
    ["x"] = { "<cmd>update | bdelete<CR>", "Save and safely remove buffer" },
    -- ["x"] = { "<cmd>Bdelete<cr>", "Delete buffer without messing windows up" },
    ["!"] = {
      "<cmd>BufferCloseAllButCurrent<CR>",
      "Close all buffers but current",
    },
    ["w"] = { "<cmd>:noa w<cr>", "Write files without autocommands" },
    -- ["*"] = "save all buffers",
    -- ["["] = {"<cmd>bprev<cr>", "prev buffer"},
    -- ["]"] = {"<cmd>bnext<cr>", "next buffer"},
    ["<leader>n"] = {
      name = "+new",
      ["f"] = "create new file",
      ["s"] = "create new file in a split",
      ["t"] = "create new file in tab",
    },
    -- ["<leader>s"] = {
    --   name = "+session",
    --   ["s"] = {"<cmd>SSave<cr>", "session save"},
    --   ["c"] = {"<cmd>SClose<cr>", "session close"},
    --   ["d"] = {"<cmd>SDelete<cr>", "session delete"},
    --   ["l"] = {"<cmd>SLoad<cr>", "session load"}
    -- }
  },
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require("which-key").register(buffer_map, opts)
require("which-key").register(window_map, opts)

local insert_map = { ["<c-s>"] = { "<cmd>w<cr><esc>", "Quick save" } }

local insert_opts = {
  mode = "i",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require("which-key").register(insert_map, insert_opts)

-- vim.g.dashboard_custom_shortcut = {
--   last_session       = 'SPC s l',
--   find_history       = 'SPC f h',
--   find_file          = 'SPC f f',
--   new_file           = 'SPC c n',
--   change_colorscheme = 'SPC t c',
--   find_word          = 'SPC f a',
--   book_marks         = 'SPC f b',

-- }
-- fzf

--
-- map("n", ",gdb", "<Plug>(EasyAlign)", {noremap = false, silent = true})
-- map("n", "<F6>", ":NvimTreeToggle<CR>")
-- map("n", "<C-n>", ":NvimTreeToggle<CR>")
-- vim.api.nvim_set_keymap("n", "<Leader>d", ":Sayonara<CR>", {noremap = true, silent = true})
-- map("n", "<leader>wk", ":WhichKey<CR>", {silent = true})

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-p>",
--   ":lua require'telescope'.extensions.project.project{}<CR>",
--   {noremap = true, silent = true}
-- )
--
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
-- new files
-- nnoremap q; q:

-- set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
