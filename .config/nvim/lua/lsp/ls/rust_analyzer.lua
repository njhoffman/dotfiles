local M = require("lsp.efm.handlers")
local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  -- let efm server handles linting and formatting stuff
  -- if server == "efm" then
  --   client.resolved_capabilities.document_formatting = true
  -- else
  --   client.resolved_capabilities.document_formatting = false
  -- end
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

require'lspconfig'.rust_analyzer.setup{
  cmd = lsp_cmds.rust,
  on_attach = on_attach,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {}
  },
}
