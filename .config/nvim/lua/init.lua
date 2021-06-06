-- dofile('/home/wil/.config/nvim/lua/profiler.lua')

-- general settings
require "main.options"
require "main.colorscheme"

-- install 3rd party plugin packages
require "plugins"

-- require("debug.typescript")
require "lsp".load()

-- -- install debugger adapter protocol functionality
require "main.autocommands"

require "plugins.feline".load()

require "mappings"
require "mappings.pickers"
-- require "main.mappings.lsp"
-- require "mappings.integrations"
-- require "mappings.lsp"
-- require "mappings.formatters"

-- only available after plugins loaded
-- if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then
--   print("Treesitter fugitive is loaded")
-- end
