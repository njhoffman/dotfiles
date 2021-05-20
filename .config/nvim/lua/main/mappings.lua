local config = require("config")
local plugin_mappings = require('mappings.plugins')
local lsp_mappings = require("mappings.lsp")

lsp_mappings.lsp_saga()
plugin_mappings.nvim_tree()
plugin_mappings.telescope()
