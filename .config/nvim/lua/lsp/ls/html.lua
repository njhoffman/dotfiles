-- npm install -g vscode-html-languageserver-bin
local lspconfig = require"lspconfig"
local lsp_cmds = require('lsp.commands')
local M = require("lsp.efm.handlers")

local on_attach = function(client, server)
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  M.common_on_attach(client, server)
  print("'" .. client.name .. "' server attached")
end

lspconfig.html.setup {
  cmd = lsp_cmds.html,
  filetypes = {"html", "tsx", "jsx", "javascriptreact"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {css = true, javascript = true}
  },
  settings = {},
  on_attach = on_attach
}
