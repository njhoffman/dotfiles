local map = require("utils.core").map

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
map("x", "k", "(v:count == 0 && mode() !=# \"V\") ? \"gk\" : \"k\"", { expr = true })
map("x", "j", "(v:count == 0 && mode() !=# \"V\") ? \"gj\" : \"j\"", { expr = true })
-- Automatically jump to the end of pasted text
-- map("v", "y", "y`]")
-- map("v", "p", "p`]")

local visual_map =
    { ["<leader>r"] = { name = "+repl actions", ["r"] = { "call ripple#send_visual()", "repl visual" } } }

local visual_opts = { mode = "x", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(visual_map, visual_opts)
