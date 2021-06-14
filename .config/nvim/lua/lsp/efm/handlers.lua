local config = require("config")
local util = require("lsp.util")
local utils = require("utils.core")
local lsp_signature = require "lsp_signature"
local lsp_status = require("lsp-status")

local function documentFormat(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    utils.keymap({"n", "<Leader>aa", "<cmd>lua vim.lsp.buf.formatting()<cr>", {}})
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
    -- vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
    vim.api.nvim_command([[augroup END]])
    -- vim.cmd([[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 500) ]])
    -- lsp_config.log(string.format("Formatting supported %s", client.name))
  end
end

local function documentCodeAction(client, bufnr)
  if client.resolved_capabilities.code_action then
    vim.cmd [[augroup CodeAction]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]]
    vim.cmd [[augroup END]]
  end
end

local function formatAlt(client, bufnr)
  vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
      return
    end
    if not vim.bo[bufnr].modified then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.cmd("noautocmd :update")
      end
    end
  end
end



local function documentHighlight(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
    hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
      ]], false)
  end
end

local function documentHoverDiagnostic(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if config.LSP.hover_diagnostic == "popup" then
    vim.api.nvim_exec([[
    augroup lsp_diagnostic
    autocmd! * <buffer>
    autocmd CursorHold * lua require"lspsaga.diagnostic".show_line_diagnostics()
    autocmd CursorHoldI * silent! lua require"lspsaga.diagnostic".signature_help()
    augroup END
      ]], false)
  elseif config.LSP.hover_diagnostic == "virtual" then
    vim.api.nvim_exec([[
    augroup lsp_diagnostic
    autocmd! * <buffer>
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
    augroup END
      ]], false)
  end
end
-- log_capabilities(client.resolved_capabilities)

local M = {}

function M.common_on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- vim.cmd([[ setlocal omnifunc=v:lua.vim.lsp.omnifunc ]])
  lsp_signature.on_attach(client)
  lsp_status.on_attach(client)
  -- util.log("client.name: " .. client.name .. "\n" .. vim.inspect(client.resolved_capabilities))
  documentHoverDiagnostic(client, bufnr)
  documentFormat(client, bufnr)
  -- documentFormatAlt(client, bufnr)
  documentCodeAction(client, bufnr)

  if config.LSP.highlight_word == nil or config.LSP.highlight_word == true then documentHighlight(client, bufnr) end

  -- require("compe").on_attach()
end

return M
