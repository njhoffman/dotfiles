local M = {}

local format_disabled_var = function()
  return string.format("format_disabled_%s", vim.bo.filetype)
end

local format_options_var = function()
  return string.format("format_options_%s", vim.bo.filetype)
end

local _if = function(bool, a, b)
  if bool then
    return a
  else
    return b
  end
end

M.formatToggle = function(value)
  local var = format_disabled_var()
  vim.g[var] = _if(value ~= nil, value, not vim.g[var])
end

M.format = function()
  if not vim.g[format_disabled_var()] then
    vim.lsp.buf.formatting(vim.g[format_options_var()] or {})
  end
end

function M.setup()
  local format_options_prettier = {
    tabWidth = 2,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file",
  }

  vim.g.format_options_typescript = format_options_prettier
  vim.g.format_options_javascript = format_options_prettier
  vim.g.format_options_typescriptreact = format_options_prettier
  vim.g.format_options_javascriptreact = format_options_prettier
  vim.g.format_options_json = format_options_prettier
  vim.g.format_options_css = format_options_prettier
  vim.g.format_options_scss = format_options_prettier
  vim.g.format_options_html = format_options_prettier
  vim.g.format_options_yaml = format_options_prettier
  vim.g.format_options_markdown = format_options_prettier

  vim.cmd [[command! FormatDisable lua require'lsp.formatters'.formatToggle(true)]]
  vim.cmd [[command! FormatEnable lua require'lsp.formatters'.formatToggle(false)]]
  vim.cmd [[command! FormatToggle lua require'lsp.formatters'.formatToggle()]]

  vim.lsp.handlers["textDocument/formatting"] = function(
      err, _, result, _, bufnr
  )
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.api.nvim_command("noautocmd :update")
      end
    end
  end
end

return M
