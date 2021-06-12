-- dofile('/home/wil/.config/nvim/lua/profiler.lua')

require "lsp"
-- require("debug.typescript")

-- install 3rd party plugin packages
require "plugins"
require "plugins-config"

-- general settings
require "main.options"
-- require "main.colorscheme"

require "main.autocommands"

require "mappings"
require "mappings.lsp"
require "mappings.pickers"
require "mappings.integrations"
require "mappings.unimpaired"
require "mappings.formatters"
require "mappings.movement"
require "mappings.ignored"

-- only available after plugins loaded
-- if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then
--   print("Treesitter fugitive is loaded")
-- end
