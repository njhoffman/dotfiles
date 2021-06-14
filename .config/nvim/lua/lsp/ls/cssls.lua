local M = require("lsp.efm.handlers")
local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')

-- function to attach completion when setting up lsp
local on_attach = function(client, server)
  -- require'completion'.on_attach(client)
  -- let efm server handles linting and formatting stuff
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end
  M.common_on_attach(client)
  print("'" .. client.name .. "' server attached")
end

lspconfig.cssls.setup {
  cmd = lsp_cmds.css,
  filetypes = {"css", "scss", "less"},
  -- filetypes = {"css", "scss", "less", "javascript", "javascriptreact"},
  root_dir = lspconfig.util.root_pattern("package.json"),
  settings = {
    css = {validate = true},
    less = {validate = true},
    scss = {validate = true}
  },
  on_attach = on_attach
}
