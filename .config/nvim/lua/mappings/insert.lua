local map = require("utils.core").map

local insert_map = { ["<c-s>"] = { "<esc><cmd>w<cr>", "Quick save" } }
local insert_opts = { mode = "i", buffer = nil, silent = true, noremap = true, nowait = true }

map("i", "jk", [[col('.') == 1 ? '<esc>' : '<esc>l']], { expr = true })

require("which-key").register(insert_map, insert_opts)
