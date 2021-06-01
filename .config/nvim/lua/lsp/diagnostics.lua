local config = require "config"
local LSP = config.LSP
local lsp_diagnostics = {}

-- LSP Diagnostics
-- ================================================
function lsp_diagnostics.configure()
  vim.cmd("hi! LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red")
  vim.cmd("hi! LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow")
  vim.cmd("hi! LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White")
  vim.cmd("hi! LspDiagnosticsVirtualTextHint guifg=White ctermfg=White")

  if (LSP.signs == "hidden") then
    -- just color numbers, dont show icons
    vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsSignError"})
    vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsSignWarning"})
    vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsSignInformation"})
    vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsSignHint"})
  elseif (LSP.signs ~= false and LSP.signs ~= 0) then
    vim.fn.sign_define(
      "LspDiagnosticsSignError",
      {
        texthl = "LspDiagnosticsSignError",
        text = "",
        numhl = "LspDiagnosticsSignError"
      }
    )
    vim.fn.sign_define(
      "LspDiagnosticsSignWarning",
      {
        texthl = "LspDiagnosticsSignWarning",
        text = "",
        numhl = "LspDiagnosticsSignWarning"
      }
    )
    vim.fn.sign_define(
      "LspDiagnosticsSignInformation",
      {
        texthl = "LspDiagnosticsSignInformation",
        text = "",
        numhl = "LspDiagnosticsSignInformation"
      }
    )
    vim.fn.sign_define(
      "LspDiagnosticsSignHint",
      {
        texthl = "LspDiagnosticsSignHint",
        text = "",
        numhl = "LspDiagnosticsSignHint"
      }
    )
  end
end

function lsp_diagnostics.publish()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      severity_sort = false,
      virtual_text = function()
        return LSP.virtual_text
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
        else
          return LSP.signs
        end
      end
    }
  )
end

function lsp_diagnostics.setup()
  lsp_diagnostics.configure()
  lsp_diagnostics.publish()
end

return lsp_diagnostics
