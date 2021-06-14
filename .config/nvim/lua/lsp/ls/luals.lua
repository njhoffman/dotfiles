local lspconfig = require("lspconfig")
local lsp_cmds = require('lsp.commands')
local M = require('lsp.efm.handlers')


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.lua.setup {
  cmd = lsp_cmds.lua,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT"},
      diagnostics = {enable = true, globals = {"vim", "use", "lua"}},
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}
