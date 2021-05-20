local u = require("utils.core")

local plugins = {}
-- vim-mundo
  u.map('n', '<f5>',':MundoToggle<CR>')

-- nvim-tree
function plugins.nvim_tree()
  u.map("n", "<f6>", ":NvimTreeToggle<CR>")
  u.map("n", "<f7>", ":NvimTreeRefresh<CR>")
  u.map("n", "<f8>", ":NvimTreeFindFile<CR>")
end

-- telescope
function plugins.telescope()
  u.map("n", "<leader>ff", ":Telescope find_files<CR>")
  u.map("n", "<leader>fo", ":Telescope oldfiles<CR>")
  u.map("n", "<leader>fg", ":Telescope live_grep<CR>")
  u.map("n", "<leader>fh", ":Telescope help_tags<CR>")
  u.map("n", "<leader>fc", ":Telescope colorscheme<CR>")
  u.map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
  u.map("n", "<leader>b", ":Telescope buffers<CR>")
end
-- vim-unimpaired
--  [<Space>        => add newlines
--  [p [P           => paste line after
--  =p =P           => paste line after reindenting
--  [a [q [b [l     => :next :cnext :bnext :lnext
--  [A [Q [b [L     => :last :clast :blast :llast
--  [o(x) s l n w p => options spell, list, number, wrap, paste
--  yo(x) s l n w p => toggle options
--  [f [n           => next file, next scm marker

return plugins
