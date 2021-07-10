local map = require("utils.core").map

-- Remap for dealing with word wrap in Normal mode/Visual mode
-- map("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true })
-- map("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true })
-- map("x", "k", "(v:count == 0 && mode() !=# \"V\") ? \"gk\" : \"k\"", { expr = true })
-- map("x", "j", "(v:count == 0 && mode() !=# \"V\") ? \"gj\" : \"j\"", { expr = true })
-- Automatically jump to the end of pasted text
-- map("v", "y", "y`]")
-- map("v", "p", "p`]")
local visual_map =
  {
    ["K"] = { "<cmd>move '<-2<CR>gv=gv<cr>", "move selected text up"},
    ["J"] = { "<cmd>move '<+1<CR>gv=gv<cr>", "move selected text down"},
    ["grn"] = { "expand incremental seleciton"},
    ["grm"] = { "shrink incremental selection"},
    ["grc"] = { "scope inc. selection"},
    ["+"] = { "<cmdlua require'nvim-treesitter.incremental-selection'.node_incremental()<cmd>", "expand inc. seleciton"},
    ["-"] = { "<cmdlua require'nvim-treesitter.incremental-selection'.node_decremental()<cmd>", "expand inc. seleciton"},
    ["<leader>r"] = { name = "+repl actions", ["r"] = { "call ripple#send_visual()", "repl visual" } }
  }

local visual_opts = { mode = "x", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(visual_map, visual_opts)
