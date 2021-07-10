local map = require("utils.core").map

map("n", "<leader>tS", ":luafile %<CR>", { silent = false })
map("n", "<BS>", "<C-^>")
map("n", "<leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })
map("n", "<leader>ns", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })
map("n", "<leader>nt", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })

-- map("n", ",gdb", "<Plug>(EasyAlign)", {noremap = false, silent = true})
-- map("n", "<F6>", ":NvimTreeToggle<CR>")
-- map("n", "<C-n>", ":NvimTreeToggle<CR>")
-- vim.api.nvim_set_keymap("n", "<Leader>d", ":Sayonara<CR>", {noremap = true, silent = true})
-- map("n", "<leader>wk", ":WhichKey<CR>", {silent = true})

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

local buffer_map = {
  -- ["q"] = {"<cmd>update | bdelete<CR>", "Save and safely remove buffer"},
  -- [":"] = { ":<C-f>", "auto open task window" },
  ["Q"] = { "<nop>" },
  ["_"] = { "<cmd>noh<cr> | :nohlsearch<cr>", "remove highlight" },
  ["<c-q>"] = { "<cmd>silent! tabclose | qa<cr>", "Quick exit without saving" },
  ["<c-x>"] = { "<cmd>silent! tabclose | xa!<cr>", "Quick exit with saving" },
  ["<C-s>"] = { "<cmd>w<cr><esc>", "Quick save" },
  ["<tab>"] = { "<cmd>bn<CR>", "Cycle buffers" },
  ["<s-tab>"] = { "<cmd>bp<CR>", "Cycle buffers" },
  ["D"] = { "d$", "delete to line end" },
  ["H"] = { "<cmd>BufferPrev<CR>", "Buffer left" },
  ["L"] = { "<cmd>BufferNext<CR>", "Buffer right" },
  ["ZZ"] = "Write if modified and exit",
  ["p"] = { "p`]", "Jump to end of pasted text" },
  -- ["<Leader>s"] = { "<cmd>call scratch#insert(0)<cr>", "scratch clear"},
  -- ["<Leader>S"] = { "<cmd>call scratch#insert(1)<cr>", "scratch reuse"},
  ["<leader>"] = {
    ["<cr>"] = { "<cmd>noh<cr>", "remove highlight" },
    ["q"] = { "<cmd>silent! tabclose | Sayonara<cr>", "Close window saving" },
    ["x"] = { "<cmd>update | silent! tabclose | bdelete<CR>", "Save and safely remove buffer" },
    -- ["x"] = { "<cmd>Bdelete<cr>", "Delete buffer without messing windows up" },
    ["!"] = { "<cmd>BufferCloseAllButCurrent<CR>", "Close all buffers but current" },
    ["w"] = { "<cmd>noa w<cr>", "Write files without autocommands" },
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

local opts = { mode = "n", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(buffer_map, opts)
