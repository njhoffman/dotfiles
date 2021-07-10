-- Window movement
-- " C-W make all equal, C-W -/+ change height, CTRL-W >/< change width
-- nnoremap <c-j> <c-w>j
-- Move to window below. Corresponding maps for h, k, l. Makes using windows much easier.
local window_map = {
  -- ["<s-k>"] = { "<cmd>resize -2<cr>", "win resize vert -2" },
  -- ["<s-j>"] = { "<cmd>resize +2<cr>", "win resize vert +2" },
  -- ["<s-h>"] = { "<cmd>vertical resize -2<cr>", "win resize horiz -2" },
  -- ["<s-l>"] = { "<cmd>vertical resize +2<cr>", "win resize horiz +2" },
  ["<c-j>"] = { "<c-w>j", "win nav down" },
  ["<c-k>"] = { "<c-w>k", "win nav up" },
  ["<c-h>"] = { "<c-w>h", "win nav left" },
  ["<c-l>"] = { "<c-w>l", "win nav right" },
  ["<c-w>;"] = { "<c-w>w", "win nav next" },
  ["<leader>"] = {
    [":"] = { "<c-w>W", "win nav prev" },
    [";"] = { "<c-w>w", "win nav next" },
    ["H"] = { "<cmd>vnew<cr>", "win split horizontal" },
    ["V"] = { "<cmd>new<cr>", "win split vertical" },
    ["_"] = { "<c-w>_" },
    ["|"] = { "<c-w>|" },
    ["= "] = { "<c-w>=" },
    ["q"] = { "<c-w><c-p><cmd>q<cr>" },
  },
  ["<leader>j"] = {
    name = "+jump windows",
    ["h"] = { "<cmd>wincmd h<cr>", "win jump left" },
    ["j"] = { "<cmd>wincmd j<cr>", "win jump down" },
    ["k"] = { "<cmd>wincmd k<cr>", "win jump up" },
    ["l"] = { "<cmd>wincmd l<cr>", "win jump right" },
  },
}

local window_opts = { mode = "n", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(window_map, window_opts)
