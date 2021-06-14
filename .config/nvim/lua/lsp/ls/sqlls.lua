-- ----------------------------------------------------------------------------
-- SQL Language Server configuration
--
-- Requires : npm install -g sql-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sqlls
-- ----------------------------------------------------------------------------

local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')
local M = require("lsp.efm.handlers")

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.dockerls.setup {
  cmd = lsp_cmds.sqlls,
  -- filetypes = {"Dockerfile"},
  on_attach = on_attach,
  -- cmd = {"sql-language-server", "up", "--method", "stdio"};
}
