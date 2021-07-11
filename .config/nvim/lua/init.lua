-- dofile('/home/wil/.config/nvim/lua/profiler.lua')
-- require("debug.typescript")
local logger = require("logger");

require "plugins-bootstrap"
require "plugins"
require "plugins-config"

logger.debug("Loaded plugins")

-- general settings
require "main.options"
-- require "main.colorscheme"

require "lsp.setup"
logger.debug("Loaded LSP")

require "mappings"
require "mappings.lsp"
require "mappings.dap"
require "mappings.pickers"
require "mappings.integrations"
require "mappings.unimpaired"
require "mappings.formatters"
require "mappings.movement"
require "mappings.ignored"
require "mappings.buffer"
require "mappings.window"
require "mappings.insert"
require "mappings.visual"
require "mappings.command"
-- logger.info(vim.inspect(packer_plugins))
-- logger.info(string.format("Finished at %s", os.date("%H:%M:%S")))

require "main.autocommands"

if packer_plugins ~= nil then
  local count = 0
  for _ in pairs(packer_plugins) do count = count + 1 end
  -- logger.debug("Loaded plugins: " .. count)
end
