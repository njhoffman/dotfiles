local M = require("lsp.efm.handlers")
local lspconfig = require "lspconfig"
local lsp_cmds = require("lsp.commands")

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

lspconfig.gopls.setup{
  cmd = lsp_cmds.go,
  filetypes = {"go", "gomod"},
  root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
  on_attach = on_attach
}
