-- ----------------------------------------------------------------------------
-- Dockerfile Language Server
--
-- Requires: npm install -g dockerfile-language-server-nodejs
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- ----------------------------------------------------------------------------
--
local lspconfig = require "lspconfig"
local lsp_cmds = require("lsp.commands")
local on_attach_hook = require "lsp.on_attach_hook"
local lsp_status = require("lsp.plugins.lsp-status")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  client.resolved_capabilities.document_formatting = false
  on_attach_hook.common_on_attach(client, bufnr)
  -- print("'" .. client.name .. "' server attached")
end

lspconfig.dockerls.setup {
  capabilities = capabilities,
  cmd = lsp_cmds.dockerls,
  filetypes = { "dockerfile" },
  on_attach = on_attach,
  root_dir = function(fname) return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname) end,
}
