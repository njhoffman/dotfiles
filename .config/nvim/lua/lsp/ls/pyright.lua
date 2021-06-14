local lspconfig = require "lspconfig"
local lsp_cmds = require("lsp.commands")
local M = require("lsp.efm.handlers")

-- function to attach completion when setting up lsp
local on_attach = function(client)
  -- require'completion'.on_attach(client)
  M.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.pyright.setup {
  cmd = lsp_cmds.python,
  on_attach = on_attach,
  filetypes = {"python"},
  -- root_dir = function(filename)
  --   return util.root_pattern(unpack(root_files))(filename) or util.path.dirname(filename)
  -- end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}
