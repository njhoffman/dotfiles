local M = require("lsp.efm.handlers")
local lspconfig = require "lspconfig"
local lsp_cmds = require('lsp.commands')

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  -- let efm server handles linting and formatting stuff
  -- if server == "efm" then
  --   client.resolved_capabilities.document_formatting = true
  -- else
  --   client.resolved_capabilities.document_formatting = false
  -- end
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

require'lspconfig'.clangd.setup{
  cmd = lsp_cmds.clangd,
  on_attach = on_attach,
  -- capabilities = default capabilities, with offsetEncoding utf-8
  -- filetypes = { "c", "cpp", "objc", "objcpp" },
  filetypes = {"c", "cpp", "cu", "h", "hpp", "c++", "h++"},
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", "build", "README.md", "makefile")
}
