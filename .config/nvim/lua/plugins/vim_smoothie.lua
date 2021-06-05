local plugin = {}
local map = require("utils.core").map

function set_config()
  vim.g.smoothie_enabled = 1
  vim.g.smoothie_no_default_mappings = 1
  vim.g.smoothie_experimental_mappings = 0
end

function plugin.load()
  set_config()
end

function plugin.setup(use)
  use {"psliwka/vim-smoothie", config = plugin.load}
end

return plugin
