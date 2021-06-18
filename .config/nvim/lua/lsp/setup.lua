local config = require("config")
local lsp_install = require("lspinstall")
local util = require("lsp.util")
local lsp_diagnostics = require("lsp.diagnostics")

local M = {}
M.setup_servers = function()
  require "lsp.capabilities"
  require("lsp.lsp-config")
  lsp_install.setup()
  lsp_diagnostics.setup()
end

  -- lsp
  if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
    require("lsp.plugins.nvim-lightbulb")
    require("lsp.plugins.lspsaga")
    require("lsp.plugins.lsp_signature")
    require("lsp.plugins.nvim_compe")

    require "lspinstall".setup()

    -- -- Load omnifunc popup icons
    -- -- require('lsp.ls.lspkind')

    -- -- Load Bash Language Server configuration
    -- require('lsp.ls.bashls')

    -- -- Load CSS Language Server configuration
    -- require('lsp.ls.cssls')

    -- -- Load Dockerfile Language Server configuration
    -- require('lsp.ls.dockerls')

    -- Load EFM Language Server configuration
    require('lsp.ls.efmls')

    -- -- Load Gloang Server configuration
    -- require "lsp.ls.gopls"

    -- -- Load HTML Language Server configuration
    -- require('lsp.ls.html')

    -- -- Load Json Language Server configuration
    -- require('lsp.ls.jsonls')

    -- -- Load Lua Language Server configuration
    -- require('lsp.ls.luals')

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
    -- require('lsp.ls.yamlls')

  -----------------------------------------------
  -- Last but not least - general language server
  -----------------------------------------------

  require('lsp_signature').on_attach()
  require('snippets').use_suggested_mappings()

  local servers = {
    -- bashls = {},
    -- clangd = {},
    -- cssls = {},
    efm = {},
    -- gopls = {},
    -- html = {},
    -- jsonls = {},
    -- lua = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
    -- vimls = {}
  }
  -- local servers = require'lspinstall'.installed_servers()
  -- table.insert(servers, 'tsserver')
  -- table.insert(servers, 'clangd')
  for server, _ in pairs(servers) do
    -- print(vim.inspect(server))
    -- require'lspconfig'[server].setup{}
  end

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require "lspinstall".post_install_hook = function()
    M.setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end

  vim.lsp.set_log_level(config.LSP.log_level)
  -- util.log("Setting LSP log level '" .. config.LSP.log_level .. "' at " .. vim.lsp.get_log_path())
  M.setup_servers()
end

-- for _, server in pairs(installed_servers) do
--   local server_config = lsp_servers.make_config(server)
--   -- print(vim.inspect(server))
--   require"lspconfig"[server].setup(server_config)
-- end

-- map("n", "<leader>tg", ":lua diagnostic_toggle_signs()<CR>")

-- vim.lsp.handlers["textDocument/hover"] =
--   vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {
--     border = "single"
--   }
-- )

-- vim.lsp.handlers["textDocument/signatureHelp"] =
--   vim.lsp.with(
--   vim.lsp.handlers.signature_help,
--   {
--     border = "single"
--   }
-- )

-- vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>]]
