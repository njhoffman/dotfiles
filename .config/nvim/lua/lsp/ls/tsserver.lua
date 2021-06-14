local lsp = vim.lsp
local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')
local M = require("lsp.efm.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
-- lspconfig.tsserver.setup{on_attach = on_attach, capabilities = capabilities}

-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   cmd = lsp_cmds.tsserver,
--   filetypes = {
--     "javascript", "javascriptreact", "javascript.jsx", "typescript",
--     "typescriptreact", "typescript.tsx"
--   },
--   capabilities = {
--     textDocument = {completion = {completionItem = {snippetSupport = true}}}
--   }
-- }
require("null-ls").setup {}

lspconfig.tsserver.setup {
  -- autostart = LSP.tsserver
  on_attach = function(client, bufnr)
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

    on_attach()
    lspTsUtils.setup_client(client)
    -- return require("lsp-config").common_on_attach(client, bufnr)
  end,
}
