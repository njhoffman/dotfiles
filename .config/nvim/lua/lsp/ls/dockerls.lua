-- ----------------------------------------------------------------------------
-- Dockerfile Language Server
--
-- Requires: npm install -g dockerfile-language-server-nodejs
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- ----------------------------------------------------------------------------
--
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
  cmd = lsp_cmds.dockerls,
  -- filetypes = {"Dockerfile"},
  on_attach = on_attach
}
