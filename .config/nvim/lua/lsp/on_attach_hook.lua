local config = require("config")
local lsp_signature = require "lsp_signature"
local lsp_status = require("lsp-status")
local f = require("utils.functional")

local function documentFormat(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    -- vim.cmd [[autocmd BufWritePre <buffer> lua require'lsp.formatters'.format()]]
    vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.formatters'.format()]]
    vim.cmd [[augroup END]]
    -- lsp_config.log(string.format("Formatting supported %s", client.name))
    -- elseif client.resolved_capabilities.document_range_formatting then
    -- utils.keymap({"n", "<Leader>aa", "<cmd>lua vim.lsp.buf.formatting()<cr>", {}})
    --   buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local function documentCodeAction(client)
  if client.resolved_capabilities.code_action then
    vim.cmd [[augroup CodeAction]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd CursorHold * lua require'lsp.plugins.nvim-lightbulb']]
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
  -- lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})
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
  -- imApi.nvim_command [[autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
  -- vimApi.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.util.show_line_diagnostics()]]
end

local function documentSignature()
  lsp_signature.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- -- If you want to hook lspsaga or other signature handler, pls set to false
    -- doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- -- set to 0 if you DO NOT want any API comments be shown
    -- -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- -- mode, 10 by default

    -- floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    -- fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    -- hint_enable = true, -- virtual hint enable
    -- hint_prefix = "🐼 ", -- Panda for parameter
    -- hint_scheme = "String",
    -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
    -- hi_parameter = "Search", -- how your parameter will be highlight
    -- max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- -- to view the hiding contents
    -- max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single", -- double, single, shadow, none
    },
    -- extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  })
end

local function log_capabilities(client)
  -- @param filter = table {"hover"}
  local capabilities = client.resolved_capabilities;
  local reduce = function(filter)
    local result = {}
    for k, _ in pairs(capabilities) do
      table.insert(result, f.map(function(v) return { v = capabilities[v] } end)(f.filter(f.contains(k))(filter)))
    end
    return f.flatten(result)
  end

  -- local log = utils.log_to_file("/tmp/neovim-lsp-capabilities.log")
  require("logger").debug(client.name, vim.inspect(reduce(capabilities)))
end

local M = {}

function M.common_on_attach(client, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- require"logger".debug("client.name: " .. client.name .. "\n" ..
  --                           vim.inspect(client.resolved_capabilities))
  -- util.log("client.name: " .. client.name .. "\n" .. vim.inspect(client.resolved_capabilities))
  documentHoverDiagnostic()
  documentSignature()
  documentFormat(client)
  documentCodeAction(client)

  if config.LSP.highlight_word == nil or config.LSP.highlight_word == true then documentHighlight(client) end

  lsp_status.on_attach(client)

end

return M
