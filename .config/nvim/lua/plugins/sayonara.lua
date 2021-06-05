function set_mapping()
  local map = require("utils.core").map
end

local plugin = {}

function plugin.load()
  set_mapping()
end

function plugin.setup(use)
  use {"mhinz/vim-sayonara", config = plugin.load}
  set_mapping()
end

return plugin
