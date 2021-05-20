-- LSP Diagnostics
-- ================================================
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      severity_sort = false,
      virtual_text = function()
        if LSP.virtual_text == nil or LSP.virtual_text == false then
          return false
        elseif LSP.virtual_text == true then
          return true
        end
      end,
      update_in_insert = function()
        if LSP.update_in_insert == nil or LSP.update_in_insert == false then
          return false
        elseif LSP.update_in_insert == true then
          return true
        end
      end,
      underline = function()
        if LSP.underline == nil or LSP.underline == false then
          return false
        elseif LSP.underline == true then
          return true
        end
      end,
      signs = function(bufnr, client_id)
        if LSP.signs == nil or LSP.signs == false then
          return vim.bo[bufnr].show_signs == false
        elseif LSP.signs == true then
          return true
        end
      end
    }
)
