-- General settings
require "config"

require "utils/packer"
require "utils/handlers"
-- require "main.options"
-- require "main.mappings"
-- require "main.autocmds"
-- require "main.colorscheme"
-- install plugin packages
require "plugins"
-- LSP
require "lsp"

require "plugins.treesitter"
-- require "plugins.general"
-- require "plugins.completion"
-- require "plugins.which-key"
-- require "plugins.nvim-tree"
-- require "plugins.statusline"
-- require "plugins.startify"
-- require "plugins.telescope"

if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then
  print("Treesitter fugitive is loaded")
end
