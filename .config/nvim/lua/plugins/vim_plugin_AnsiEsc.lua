local plugin = {}
local u = require("utils.core")

function plugin.config()
  -- Fix ansi escape codes in buffer, :AnsiEsc
  -- forked from powerman to disable mappings
  vim.g.no_cecutil_maps = 1
end

function plugin.load()
  plugin.config()
end

function plugin.setup(use)
  use { 'joeysino/vim-plugin-AnsiEsc' }
end

return plugin
