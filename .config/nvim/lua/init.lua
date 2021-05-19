-- General settings
require "config"

require "utils.packer"

require "utils.handlers"
-- require "main.options"
-- require "main.mappings"
require "main.autocommands"

-- install 3rd party plugin packages
require "plugins"

-- install lsp services
require "lsp"
-- require "debuggers"

-- plugin config and startup
require "plugins.bqf"
require "plugins.compe"
require "plugins.nvim-hlslens"
require "plugins.nvim-lspconfig"
require "plugins.statusline"
require "plugins.telescope"
require "plugins.todo"
require "plugins.toggleterm"
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
