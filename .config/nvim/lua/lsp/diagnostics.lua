local config = require "config"
local LSP = config.LSP
local lsp_diagnostics = {}

-- LSP Diagnostics
-- ================================================
function lsp_diagnostics.configure()
  vim.cmd("hi LspDiagnosticsUnderlineError gui=undercurl")
  vim.cmd("hi LspDiagnosticsUnderlineWarning gui=undercurl")
  vim.cmd("hi LspDiagnosticsUnderlineInformation gui=undercurl")
  vim.cmd("hi LspDiagnosticsUnderlineHint gui=undercurl")
  vim.cmd("hi LspDiagnosticsVirtualTextError guifg=#ff4400 guibg=none")
  vim.cmd("hi LspDiagnosticsVirtualTextWarning guifg=#ffbc53 guibg=none")
  vim.cmd("hi LspDiagnosticsVirtualTextInformation guifg=#193BBF guibg=none")
  vim.cmd("hi LspDiagnosticsVirtualTextHint guifg=#787878 guibg=none")
  vim.cmd("hi LspDiagnosticsFloatingError guifg=#ff4400 guibg=#3f3f3f")
  vim.cmd("hi LspDiagnosticsFloatingWarning guifg=#674D00 guibg=#3f3f3f")
  vim.cmd("hi LspDiagnosticsFloatingInformation guifg=#183380 guibg=#3f3f3f")
  vim.cmd("hi LspDiagnosticsFloatingHint guifg=#484841 guibg=#3f3f3f")

  -- TODO: create custom highlights for current line nr
  -- highlight CustomError ctermfg=red guifg=red
  -- sign define error numhl=CustomError
  -- sign place 2 name=error line=7
  if (LSP.signs == "hidden") then
    -- just color numbers, dont show icons
    vim.fn.sign_define("LspDiagnosticsSignError",
                       { text = "", numhl = "LspDiagnosticsSignError" })
    vim.fn.sign_define("LspDiagnosticsSignWarning",
                       { text = "", numhl = "LspDiagnosticsSignWarning" })
    vim.fn.sign_define("LspDiagnosticsSignInformation",
                       { text = "", numhl = "LspDiagnosticsSignInformation" })
    vim.fn.sign_define("LspDiagnosticsSignHint",
                       { text = "", numhl = "LspDiagnosticsSignHint" })
  elseif (LSP.signs ~= false and LSP.signs ~= 0) then
    vim.fn.sign_define("LspDiagnosticsSignError", {
      texthl = "LspDiagnosticsSignError",
      text = "",
      numhl = "LspDiagnosticsSignError",
    })
    vim.fn.sign_define("LspDiagnosticsSignWarning", {
      texthl = "LspDiagnosticsSignWarning",
      text = "",
      -- numhl = "LspDiagnosticsSignWarning",
    })
    vim.fn.sign_define("LspDiagnosticsSignInformation", {
      texthl = "LspDiagnosticsSignInformation",
      text = "",
      -- numhl = "LspDiagnosticsSignInformation",
    })
    vim.fn.sign_define("LspDiagnosticsSignHint", {
      texthl = "LspDiagnosticsSignHint",
      text = "",
      -- numhl = "LspDiagnosticsSignHint",
    })
  end
  -- vim.api.nvim_exec([[
  --   " Format on save
  --   " autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  --   " autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
  --   " autocmd BufWritePre *.vue lua vim.lsp.buf.formatting_sync(nil, 100)
  --   " autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
  --   " autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
  -- ]], false)

  -- When leaving insert mode => add linting errors to location list.
  vim.api.nvim_exec([[
    fun! LspLocationList()
      lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    endfun
    augroup LSP_Location_List
      autocmd!
      autocmd! InsertLeave * :call LspLocationList()
    augroup END
  ]], false)
end

function lsp_diagnostics.extensions()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(require("lsp_extensions.workspace.diagnostic").handler,
                   { signs = { severity_limit = "Error" } })
end
-- -- Get the counts from your curreent workspace:
-- local ws_errors = require('lsp_extensions.workspace.diagnostic').get_count(0, 'Error')
-- local ws_hints = require('lsp_extensions.workspace.diagnostic').get_count(0, 'Hint')

-- -- Set the qflist for the current workspace
-- --  For more information, see `:help vim.lsp.diagnostic.set_loc_list()`, since this has some of the same configuration.
-- require('lsp_extensions.workspace.diagnostic').set_qf_list()

function lsp_diagnostics.handlers()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        severity_sort = false,
        virtual_text = function() return LSP.virtual_text end,
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
        end,
      })

  vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                                                       vim.lsp.handlers
                                                           .signature_help,
                                                       { border = "single" })

end

function diagnostic_toggle_virtual_text()
  local virtual_text = vim.b.lsp_virtual_text_enabled
  virtual_text = not virtual_text
  vim.b.lsp_virtual_text_enabled = virtual_text
  vim.lsp.diagnostic.display(vim.lsp.diagnostic.get(0, 1), 0, 1,
                             { virtual_text = virtual_text })
end

function lsp_diagnostics.setup()
  lsp_diagnostics.configure()
  lsp_diagnostics.handlers()
  -- lsp_diagnostics.extensions()
end

return lsp_diagnostics
