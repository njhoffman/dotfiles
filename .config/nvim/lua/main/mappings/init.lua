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
map("i", "jk", [[col('.') == 1 ? '<esc>' : '<esc>l']], {expr = true})
map("n", "<leader>tS", ":luafile %<CR>", {silent = false})
map("n", "<BS>", "<C-^>")
map("t", "<C-o>", [[<C-\><C-n>]])
map("n", "<A-t>", ":ToggleTerm<CR>")
map("t", "<A-t>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("n", "D", "d$")

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
vim.cmd([[au CmdwinEnter : let b:cpt_save = &cpt | set cpt=.]])
vim.cmd([[au CmdwinLeave : let &cpt = b:cpt_save]])
-- vim.cmd([[au CmdwinEnter [/?]  startinsert]])
vim.cmd([[au CmdwinEnter * startinsert]])

map("n", "<leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<leader>ns", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<leader>nt", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})

-- text
map("n", [[<leader>tu]], [[guw]])
map("n", [[<leader>tU]], [[gUw]])
map("n", "<leader>t,", "A,<ESC>")
map("n", "<leader>t;", "A;<ESC>")
map("n", "<leader>t:", "A:<ESC>")

-- buffer management

-- " Return to last edit position when opening files (You want this!)
-- au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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
-- map("n", "<S-k>", ":resize -2<CR>")
-- map("n", "<S-j>", ":resize +2<CR>")
-- map("n", "<S-h>", ":vertical resize -2<CR>")
-- map("n", "<S-l>", ":vertical resize +2<CR>")
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
-- nnoremap Q <nop>
-- " Toggle paste mode on and off
-- map <leader>pp :setlocal paste!<cr>
-- visual mode mappings
-- Visually select, paste the text that was last edited/pasted
map("n", "gv", "`[v`]", {noremap = false})
map("n", "<leader>[", "`[V`]<", {noremap = true})
map("n", "<leader>]", "`[V`]>", {noremap = true})
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")
-- " Visual mode pressing * or # searches for the current selection
-- vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
-- vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

-- Remap for dealing with word wrap in Normal mode/Visual mode
map("n", "k", 'v:count == 0 ? "gk" : "k"', {expr = true})
map("n", "j", 'v:count == 0 ? "gj" : "j"', {expr = true})
map("x", "k", '(v:count == 0 && mode() !=# "V") ? "gk" : "k"', {expr = true})
map("x", "j", '(v:count == 0 && mode() !=# "V") ? "gj" : "j"', {expr = true})
-- Automatically jump to the end of pasted text
map("v", "y", "y`]")
map("v", "p", "p`]")
map("n", "p", "p`]")

-- map("n", "<F5>", ":lua require('utils.core')._lazygit_toggle()<CR>")
-- :map <C-X> <ESC>:x<CR>
-- :imap <C-X> <ESC>:x<CR>

-- <Plug>(ripple_open_repl)	y<cr> (nmap)	Open REPL
-- <Plug>(ripple_send_motion)	yr (nmap)	Send motion to REPL
-- <Plug>(ripple_send_previous)	yp (nmap)	Resend previous code selection
-- <Plug>(ripple_send_selection)	R (xmap)	Send selection to REPL
-- <Plug>(ripple_send_line)	yrr (nmap)	Send line to REPL
-- <Plug>(ripple_send_buffer)	yr<cr> (nmap)	Send whole buffer to REPL

-- ["<C-f>"] = {"<Plug>(SmoothieForwards)", "Scroll forward"},
-- TODO: fork and add option to limit overshot
-- TODO: add shift mapping for twice the speed

local buffer_maps = {
  -- ["q"] = {"<cmd>update | bdelete<CR>", "Save and safely remove buffer"},
  -- ["gg"] = {"<Plug>(Smoothie_gg)", "Scroll to top"},
  ["Q"] = {"<nop>"},
  ["_"] = {"<cmd><noh><cr>", "remove highlight"},
  ["q"] = {"<cmd>Sayonara<cr>", "Quick exit with saving"},
  ["<C-q>"] = {"<cmd>qa<cr>", "Quick exit without saving"},
  ["<C-x>"] = {"<cmd>xa!<cr>", "Quick exit with saving"},
  ["<C-s>"] = {"<cmd>w<cr><esc>", "Quick save"},
  ["<TAB>"] = {"<cmd>bn<CR>", "Cycle buffers"},
  ["<S-TAB>"] = {"<cmd>bp<CR>", "Cycle buffers"},
  ["H"] = {"<cmd>BufferPrev<CR>", "Buffer left"},
  ["L"] = {"<cmd>BufferNext<CR>", "Buffer right"},
  ["<C-f>"] = {"<Plug>(SmoothieDownwards)<Plug>(SmoothieDownwards)", "Scroll forward"},
  ["<C-b>"] = {"<Plug>(SmoothieBackwards)", "Scroll backwards"},
  ["G"] = {"<Plug>(Smoothie_G)", "Scroll to bottom"},
  ["<leader>"] = {
    ["<cr>"] = {"<cmd>nohl<cr>", "remove highlight"},
    ["q"] = {"<cmd>update | bdelete<CR>", "Save and safely remove buffer"},
    ["x"] = {"<cmd>Bdelete<cr>", "Delete buffer without messing windows up"},
    ["!"] = {"<cmd>BufferCloseAllButCurrent<CR>", "Close all buffers but current"},
    -- ["*"] = "save all buffers",
    ["ZZ"] = "Write if modified and exit",
    ["w"] = {"<cmd>:noa w<cr>", "Write files without autocommands"},
    ["b"] = {"<cmd>FindBuffer<cr>", "Find buffer"},
    ["e"] = {"<cmd>NvimTreeToggle<cr>", "toggle explorer"},
    ["u"] = {"<cmd>MundoToggle<cr>", "toggle undo tree"},
    -- ["["] = {"<cmd>bprev<cr>", "prev buffer"},
    -- ["]"] = {"<cmd>bnext<cr>", "next buffer"},
    ["<leader>n"] = {
      name = "+new",
      ["f"] = "create new file",
      ["s"] = "create new file in a split",
      ["t"] = "create new file in tab"
    },
    ["<leader>j"] = {
      name = "+jump windows",
      ["h"] = {"<cmd>wincmd h<cr>", "Left"},
      ["j"] = {"<cmd>wincmd j<cr>", "Down"},
      ["k"] = {"<cmd>wincmd k<cr>", "Up"},
      ["l"] = {"<cmd>wincmd l<cr>", "Right"}
    },
    ["<leader>s"] = {
      name = "+session",
      ["s"] = {"<cmd>SSave<cr>", "session save"},
      ["c"] = {"<cmd>SClose<cr>", "session close"},
      ["d"] = {"<cmd>SDelete<cr>", "session delete"},
      ["l"] = {"<cmd>SLoad<cr>", "session load"}
    }
  }
}

local format_maps = {
  ["<leader>s"] = {
    name = "+surround",
    ["a"] = "add surrounding",
    ["d"] = "delete surrounding",
    ["db"] = "automatically seearch and delete",
    ["r"] = "replace surrounding",
    ["rb"] = "automatically search and select to replace"
  },
  ["<leader>t"] = {
    name = "+text",
    [","] = "add comma to end of line",
    [";"] = "add semicolon to end of line",
    [":"] = "add colon to end of line",
    ["u"] = "lowercase",
    ["U"] = "uppercase",
    ["S"] = "source file"
  }
}

-- gitsigns
--   buffer = true?

local interface_maps = {
  ["<leader>g"] = {
    name = "+git",
    ["f"] = {"<cmd>Telescope git_files<cr>", "files"},
    ["c"] = {"<cmd>Telescope git_commits<cr>", "commits"},
    ["b"] = {"<cmd>Telescope git_branches<cr>", "branches"},
    ["s"] = {"<cmd>Telescope git_status<cr>", "status"},
    ["n"] = {"<cmd>Gitsigns next_hunk<cr>", "next hunk"},
    ["p"] = {"<cmd>Gitsigns prev_hunk<cr>", "prev hunk"},
    ["v"] = {"<cmd>Gitsigns preview_hunk<cr>", "preview hunk"},
    ["r"] = {"<cmd>Gitsigns reset_hunk<cr>", "reset hunk"},
    ["R"] = {"<cmd>Gitsigns reset_buffer<cr>", "reset buffer"}
    --   ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    --   ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    --   ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    --   ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    --   ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    --   -- Text objects
    --   ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    --   ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
  },
  ["<leader>o"] = {
    name = "+open",
    ["t"] = {"<cmd>ToggleTerm<cr>", "terminal"},
    ["e"] = {"<cmd>NvimTreeFindFile<cr>", "find current file"},
    ["u"] = {"<cmd>MundoToggle<cr>", "undo tree"}
  },
  ["<leader>p"] = {
    name = "+plugins",
    ["u"] = {"<cmd>PackerUpdate<cr>", "update"},
    ["i"] = {"<cmd>PackerInstall<cr>", "install"},
    ["S"] = {"<cmd>PackerSync<cr>", "sync"},
    ["c"] = {"<cmd>PackerClean<cr>", "clean"},
    ["s"] = {"<cmd>PackerStatus<cr>", "status"}
  }
}

-- Ignore
require("which-key").register(
  {
    ["<leader>cic"] = "which_key_ignore",
    ["<leader>ci"] = "which_key_ignore",
    ["<leader>1"] = "which_key_ignore",
    ["<leader>2"] = "which_key_ignore",
    ["<leader>3"] = "which_key_ignore",
    ["<leader>4"] = "which_key_ignore",
    ["<leader>5"] = "which_key_ignore",
    ["<leader>6"] = "which_key_ignore",
    ["<leader>7"] = "which_key_ignore",
    ["<leader>8"] = "which_key_ignore",
    ["<leader>9"] = "which_key_ignore"
  }
)

require("which-key").register(
  {
    ["<leader>cd"] = "which_key_ignore",
    ["<leader>ci"] = "which_key_ignore"
  },
  {mode = "v"}
)

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(buffer_maps, opts)
require("which-key").register(format_maps, opts)
require("which-key").register(interface_maps, opts)

-- vim.g.dashboard_custom_shortcut = {
--   last_session       = 'SPC s l',
--   find_history       = 'SPC f h',
--   find_file          = 'SPC f f',
--   new_file           = 'SPC c n',
--   change_colorscheme = 'SPC t c',
--   find_word          = 'SPC f a',
--   book_marks         = 'SPC f b',

-- }
--fzf

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
