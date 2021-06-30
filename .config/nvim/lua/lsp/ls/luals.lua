local lspconfig = require("lspconfig")
local lsp_cmds = require("lsp.commands")
local on_attach_hook = require("lsp.on_attach_hook")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- client.resolved_capabilities.document_formatting = true
-- Set default client capabilities plus window/workDoneProgress

local on_attach = function(client, bufnr)
  on_attach_hook.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.sumneko_lua.setup {
  cmd = lsp_cmds.lua,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { enable = true, globals = { "vim", "use", "lua" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}
