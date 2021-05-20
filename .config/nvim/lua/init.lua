-- General settings

-- install 3rd party plugin packages
require "plugins"

-- install debugger adapter protocol functionality
-- require "main.debugger"

-- require "main.options"
require "main.mappings"
require "main.autocommands"


-- plugin config and startup
require "plugins.statusline"
require "plugins.telescope"
require "plugins.treesitter"
-- require "plugins.general"
-- require "plugins.bufferline"
-- require "plugins.galaxyline"
-- require "plugins.completion"
-- require "plugins.which-key"
-- require "plugins.nvim-tree"
-- require "plugins.startify"

require "main.colorscheme"
require "plugins.feline"

-- only available after plugins loaded
-- if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then
--   print("Treesitter fugitive is loaded")
-- end
