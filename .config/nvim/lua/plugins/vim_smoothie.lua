local plugin = {}
local u = require("utils.core")

function plugin.mapping()
  vim.g.smoothie_enabled = 1
  vim.g.smoothie_no_default_mappings = 1
  vim.g.smoothie_experimental_mappings = 0
  -- u.map("n" , "<unique><C-D>",      "<Plug>(SmoothieDownwards)")
  -- u.map("n" , "<unique><C-U>",      "<Plug>(SmoothieUpwards)")
  u.map("n" , "<unique><C-F>",      "<Plug>(SmoothieForwards)")
  u.map("n" , "<unique><S-Down>",   "<Plug>(SmoothieForwards)")
  -- u.map("n" , "<unique><PageDown>", "<Plug>(SmoothieForwards)")
  u.map("n" , "<unique><C-B>",      "<Plug>(SmoothieBackwards)")
  u.map("n" , "<unique><S-Up",      "<Plug>(SmoothieBackwards)")
  -- u.map("n" , "<unique><PageUp>",   "<Plug>(SmoothieBackwards)")
end

function plugin.load()
  require('vim-smoothie')
  plugin.mapping()
end

function plugin.setup(use)
  use { "psliwka/vim-smoothie", config = plugin.load }
end

return plugin
