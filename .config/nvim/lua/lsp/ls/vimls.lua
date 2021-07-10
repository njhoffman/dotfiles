local lspconfig = require "lspconfig"
local lsp_cmds = require("lsp.commands")
local on_attach_hook = require("lsp.on_attach_hook")

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  -- require'completion'.on_attach(client)
  on_attach_hook.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached")
end

lspconfig.vimls.setup {
  cmd = lsp_cmds.vim,
  on_attach = on_attach,
  filetypes = { "vim" },
  init_options = {
    diagnostic = { enable = true },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true,
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = { fromRuntimepath = true, fromVimruntime = true },
    vimruntime = "",
  },
  -- root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd() end,

}
