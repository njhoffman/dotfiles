local lspconfig = require "lspconfig"
local lsp_status = require("lsp-status")
local on_attach_hook = require "lsp.on_attach_hook"
local lsp_cmds = require("lsp.commands")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
local on_attach = function(client, server)
  client.resolved_capabilities.document_formatting = true
  -- let efm server handles linting and formatting stuff
  on_attach_hook.common_on_attach(client, server)
  print("'" .. client.name .. "' server attached")
end

lspconfig.cssls.setup {
  cmd = lsp_cmds.css,
  filetypes = { "css", "scss", "less", "html" },
  root_dir = lspconfig.util.root_pattern("package.json"),
  settings = { css = { validate = true }, less = { validate = true }, scss = { validate = true } },
  on_attach = on_attach,
}
