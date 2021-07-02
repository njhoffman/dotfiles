local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local on_attach_hook = require("lsp.on_attach_hook")

if not lspconfig.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--enable-all",
          "--disable",
          "lll",
          "--out-format",
          "json",
        },
      },
    },
  }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  on_attach_hook.common_on_attach(client, bufnr)
  -- print("'" .. client.name .. "' server attached " .. bufnr)
end

lspconfig.golangcilsp.setup {
  cmd = { "golangci-lint-langserver" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(".git")(fname) or
               lspconfig.util.root_pattern("go.mod")(fname) or
               lspconfig.util.path.dirname(fname)
  end,
  filetypes = { "go", "gomod" },
  on_attach = on_attach,
}
