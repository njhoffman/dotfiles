
function set_mapping()
  local map = require('utils.core').map
  map("n", "<Leader>d",":Sayonara<CR>")
  -- vim.api.nvim_set_keymap("n", "<Leader>d", ":Sayonara<CR>", {noremap = true, silent = true})
end

local plugin = {}

function plugin.load()
  set_mapping()
end

function plugin.setup(use)
  use {'mhinz/vim-sayonara', config = plugin.load}
  set_mapping()
end

return plugin
