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
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

require'lspconfig'.solargraph.setup{
  cmd = lsp_cmds.ruby,
  filetypes = { "solargraph" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "solargraph-project.json"),
    settings = {
      ["solargraph"] = {}
    },
  on_attach = on_attach
}
