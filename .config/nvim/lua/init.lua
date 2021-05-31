-- dofile('/home/wil/.config/nvim/lua/profiler.lua')

-- general settings
require "main.options"


-- install 3rd party plugin packages
local plugins = require "plugins"

-- install debugger adapter protocol functionality
-- require "main.debugger"
require "main.autocommands"


-- plugin config and startup
-- require "plugins.telescope"
-- require "plugins.treesitter"
-- require "plugins.general"
-- require "plugins.bufferline"
-- require "plugins.galaxyline"
-- require "plugins.completion"
-- require "plugins.which-key"
-- require "plugins.nvim-tree"
-- require "plugins.startify"

require "main.colorscheme"
require "plugins.feline".load()
require "main.mapping"

-- only available after plugins loaded
-- if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then
--   print("Treesitter fugitive is loaded")
-- end
