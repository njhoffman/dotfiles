local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')
local M = require("lsp.efm.handlers")

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.bashls.setup {
  cmd = lsp_cmds.bash,
  filetypes = {"sh", "bash", "conf", "zsh"},
  on_attach = on_attach
}
