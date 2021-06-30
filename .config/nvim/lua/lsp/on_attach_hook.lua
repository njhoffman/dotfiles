local config = require("config")
local lsp_signature = require "lsp_signature"
local lsp_status = require("lsp-status")
local f = require("utils.functional")

local function documentFormat(client)
  if client.resolved_capabilities.document_formatting then
    -- utils.keymap({"n", "<Leader>aa", "<cmd>lua vim.lsp.buf.formatting()<cr>", {}})
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]

    -- vim.cmd [[autocmd BufWritePre <buffer> lua require'lsp.formatters'.format()]]
    vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.formatters'.format()]]

    -- vim.cmd(
    --     [[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 500) ]])
    -- vim.api.nvim_command(
    --     [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
    vim.cmd [[augroup END]]
    -- lsp_config.log(string.format("Formatting supported %s", client.name))
    -- elseif client.resolved_capabilities.document_range_formatting then
    --   buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local function documentCodeAction(client)
  if client.resolved_capabilities.code_action then
    vim.cmd [[augroup CodeAction]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]]
    vim.cmd [[augroup END]]
  end
end

local function documentHighlight(client)
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

local function documentHoverDiagnostic()
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

local function log_capabilities(client)
  -- @param filter = table {"hover"}
  local capabilities = client.resolved_capabilities;
  local reduce = function(filter)
    local result = {}
    for k, _ in pairs(capabilities) do
      table.insert(result,
                   f.map(function(v) return { v = capabilities[v] } end)(
                       f.filter(f.contains(k))(filter)))
    end
    return f.flatten(result)
  end

  -- local log = utils.log_to_file("/tmp/neovim-lsp-capabilities.log")
  require("logger").debug(client.name, vim.inspect(reduce(capabilities)))
end

local M = {}

function M.common_on_attach(client, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- vim.cmd([[ setlocal omnifunc=v:lua.vim.lsp.omnifunc ]])

  require"logger".debug("client.name: " .. client.name .. "\n" ..
                            vim.inspect(client.resolved_capabilities))

  -- util.log("client.name: " .. client.name .. "\n" .. vim.inspect(client.resolved_capabilities))
  documentHoverDiagnostic()
  documentFormat(client)
  documentCodeAction(client)

  if config.LSP.highlight_word == nil or config.LSP.highlight_word == true then
    documentHighlight(client)
  end

  lsp_signature.on_attach(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  -- require("compe").on_attach()
end

return M
