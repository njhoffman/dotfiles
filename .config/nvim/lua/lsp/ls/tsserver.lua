require("null-ls").setup {}
local lsp_status = require("lsp-status")
local lspconfig = require("lspconfig")
local lsp_cmds = require('lsp.commands')
local M = require("lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Set default client capabilities plus window/workDoneProgress
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

local on_attach = function(client, bufnr)
  local lspTsUtils = require("nvim-lsp-ts-utils")
  -- disable tsserver formatting if you plan on formatting via null-ls
  client.resolved_capabilities.document_formatting = false
  lspTsUtils.setup({
    -- defaults
    debug = false,
    disable_commands = false,
    enable_import_on_completion = true,
    import_on_completion_timeout = 5000,
    -- eslint
    eslint_enable_code_actions = true,
    -- eslint_bin = "eslint",
    eslint_bin = "eslint_d",
    eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
    eslint_enable_disable_comments = true,
    -- experimental settings!
    -- eslint diagnostics
    eslint_enable_diagnostics = true,
    eslint_diagnostics_debounce = 250,
    -- formatting
    enable_formatting = true,
    formatter = "prettier",
    formatter_args = {"--stdin-filepath", "$FILENAME"},
    format_on_save = true,
    no_save_after_format = false,
    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = true,
    -- update imports on file move
    update_imports_on_move = true,
    require_confirmation_on_move = false,
    -- watch_dir = "/src"
    watch_dir = "/"
  })

  lspTsUtils.setup_client(client)
  lsp_status.on_attach(client, bufnr)
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end


lspconfig.typescript.setup {
  -- autostart = LSP.tsserver
  cmd = lsp_cmds.tsserver,
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript",
    "typescriptreact", "typescript.tsx"
  },
  on_attach = on_attach
}
