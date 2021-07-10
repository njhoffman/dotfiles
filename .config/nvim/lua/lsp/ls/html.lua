-- npm install -g vscode-html-languageserver-bin
local lspconfig = require "lspconfig"
local lsp_status = require("lsp-status")
local on_attach_hook = require "lsp.on_attach_hook"
local lsp_cmds = require("lsp.commands")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  client.resolved_capabilities.document_formatting = true
  on_attach_hook.common_on_attach(client, server)
  print("'" .. client.name .. "' server attached")
end

lspconfig.html.setup {
  capabilities = capabilities,
  cmd = lsp_cmds.html,
  filetypes = { "html", "tsx", "jsx", "javascriptreact" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = { css = true, javascript = true },
  },
  settings = {},
  on_attach = on_attach,
  root_dir = function(fname) return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname) end,

  -- root_dir = function(fname)
  --         return root_pattern(fname) or vim.loop.os_homedir()
  --       end,
}
