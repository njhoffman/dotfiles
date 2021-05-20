local lsp_install = require('lspinstall')
local lsp_servers = require('lsp.servers')
local lsp_diagnostics = require('lsp.diagnostics')

local plugin = {}

-- lsp-install
local function setup_servers()
  lsp_install.setup()

  -- get all installed servers
  local installed_servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  table.insert(installed_servers, "clangd")

  for _, server in pairs(installed_servers) do
    local server_config = lsp_servers.make_config(server)
    require "lspconfig"[server].setup(server_config)
  end
  lsp_diagnostics.setup()
end


function plugin.setup(use)
  setup_servers()
  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
end

return plugin
