local config = require("config")

vim.lsp.set_log_level(config.LSP.log_level)

-- lsp
if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
  require("lsp.plugins.nvim-lightbulb")
  require("lsp.plugins.lspsaga")
  require("lsp.plugins.lsp_signature")
  require("lsp.plugins.lspkind")
  require("lsp.plugins.nvim_compe")
  require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981",
  })
  require("lsp.diagnostics").setup()
  require("lsp.formatters").setup()
  require("lsp.lsp-status").activate()
  require("snippets").use_suggested_mappings()

  -- require("lspinstall").setup()
  -- -- Load omnifunc popup icons

  -- -- Load Bash Language Server configuration
  -- require('lsp.ls.bashls')

  -- -- Load CSS Language Server configuration
  -- require('lsp.ls.cssls')

  -- -- Load Dockerfile Language Server configuration
  -- require('lsp.ls.dockerls')

  -- Load EFM Language Server configuration
  require("lsp.ls.efmls")

  -- -- Load Gloang Server configuration
  require("lsp.ls.gopls")
  -- go get github.com/nametake/golangci-lint-langserver
  -- require("lsp.ls.golangcilsp")

  -- -- Load HTML Language Server configuration
  -- require('lsp.ls.html')

  -- -- Load Json Language Server configuration
  -- require('lsp.ls.jsonls')

  -- -- Load Lua Language Server configuration
  require("lsp.ls.luals")

  -- -- Python Language Server configuration
  -- require('lsp.ls.pyright')

  -- -- Ruby Language configuration
  -- require "lsp.ls.solargraph"

  -- -- Rust Language configuration
  -- require "lsp.ls.rust_analyzer"

  -- -- SQL Language Server configuration
  -- require('lsp.ls.sqlls')

  -- -- Load TypeScript Language Server (tsserver) configuration
  -- require('lsp.ls.tsserver')

  -- -- Load Vim Language Server (vls) configuration
  -- require('lsp.ls.vimls')

  -- -- Load Yaml Language Server (yaml) configuration
  require("lsp.ls.yamlls")

end

-- map("n", "<leader>tg", ":lua diagnostic_toggle_signs()<CR>")

-- vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>]]
