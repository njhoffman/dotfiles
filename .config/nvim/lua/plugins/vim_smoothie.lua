local plugin = {}
local map = require("utils.core").map

function set_mapping()
  vim.g.smoothie_enabled = 1
  vim.g.smoothie_no_default_mappings = 1
  vim.g.smoothie_experimental_mappings = 0
  map("n", "<unique><C-F>", "<Plug>(SmoothieForwards)")
  map("n", "<unique><S-Down>", "<Plug>(SmoothieForwards)")
  map("n", "<unique><C-B>", "<Plug>(SmoothieBackwards)")
  map("n", "<unique><S-Up", "<Plug>(SmoothieBackwards)")
end

function plugin.load()
  set_mapping()
end

function plugin.setup(use)
  use {"psliwka/vim-smoothie", config = plugin.load}
end

return plugin
