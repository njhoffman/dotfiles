local lsp_install = require("lspinstall")
local lsp_servers = require("lsp.servers")
local lsp_diagnostics = require("lsp.diagnostics")
local map = require("utils.core").map

local plugin = {}

-- lsp-install
function plugin.setup_servers()
  lsp_install.setup()

  -- get all installed servers
  local installed_servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  table.insert(installed_servers, "clangd")

  for _, server in pairs(installed_servers) do
    local server_config = lsp_servers.make_config(server)
    -- print(vim.inspect(server))
    require "lspconfig"[server].setup(server_config)
  end
  lsp_diagnostics.setup()
end

function plugin.load()
  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require "lspinstall".post_install_hook = function()
    plugin.setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
  plugin.setup_servers()
end

function diagnostic_toggle_virtual_text()
  local virtual_text = vim.b.lsp_virtual_text_enabled
  virtual_text = not virtual_text
  vim.b.lsp_virtual_text_enabled = virtual_text
  vim.lsp.diagnostic.display(vim.lsp.diagnostic.get(0, 1), 0, 1, {virtual_text = virtual_text})
end

map("n", "<leader>tv", ":lua diagnostic_toggle_virtual_text()<CR>")
-- map("n", "<leader>tg", ":lua diagnostic_toggle_signs()<CR>")

return plugin

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
