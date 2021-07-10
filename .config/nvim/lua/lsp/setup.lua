local config = require("config")

vim.lsp.set_log_level(config.LSP.log_level)

-- lsp
if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
  require("lsp.plugins.nvim-lightbulb")
  require("lsp.plugins.lspsaga")
  require("lsp.plugins.lsp_signature")
  require("lsp.plugins.lspkind")
  require("lsp.plugins.lsp-status")
  require("lsp.plugins.nvim_compe")
  require("lsp-colors").setup({ Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981" })

  require("lsp.diagnostics").setup()
  require("lsp.formatters").setup()
  require("snippets").use_suggested_mappings()

  require("lsp.ls.bashls")
  require("lsp.ls.cssls")
  -- require('lsp.ls.clangd') - ccls
  -- require('lsp.ls.cmake')
  -- require('lsp.ls.cssls')
  -- require('lsp.ls.dhall-lsp') - hls
  require("lsp.ls.dockerls")
  require("lsp.ls.efmls")
  -- require("lsp.ls.flow")
  -- require('lsp.ls.graphql')
  require("lsp.ls.gopls")
  -- go get github.com/nametake/golangci-lint-langserver
  -- require("lsp.ls.golangcilsp")
  require("lsp.ls.html")
  require("lsp.ls.jsonls")
  require("lsp.ls.luals")
  require("lsp.ls.null-ls")
  -- require('lsp.ls.perlls')
  -- require('lsp.ls.phpactor')
  -- require('lsp.ls.pyright') -- pyls, pylsp
  -- require "lsp.ls.solargraph"
  -- require "lsp.ls.rust_analyzer" - rls
  -- require('lsp.ls.sqlls')
  -- require('lsp.ls.solargraph')
  -- require('lsp.ls.stylelint-lsp')
  -- require('lsp.ls.tailwindcss')
  -- require('lsp.ls.tflint')
  -- require('lsp.ls.terraformls')
  require("lsp.ls.tsserver")
  require("lsp.ls.vimls")
  require("lsp.ls.yamlls")
  require("lsp.ls.zeta_note")

end

-- map("n", "<leader>tg", ":lua diagnostic_toggle_signs()<CR>")

-- vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>]]
