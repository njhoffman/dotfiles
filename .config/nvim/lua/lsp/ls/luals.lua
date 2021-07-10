local lspconfig = require("lspconfig")
local lsp_cmds = require("lsp.commands")
local on_attach_hook = require("lsp.on_attach_hook")
local lsp_status = require("lsp-status")

-- LuaFormatter on/off
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
-- client.resolved_capabilities.document_formatting = true

local on_attach = function(client, bufnr)
  on_attach_hook.common_on_attach(client, bufnr)
  -- print("'" .. client.name .. "' server attached")
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "?.lua")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  lspconfig = {
    -- cmd = {"lua-language-server"}
    cmd = lsp_cmds.lua,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = runtime_path },
        diagnostics = { enable = true, globals = { "vim", "use", "lua" } },
        workspace = {
          library = { [vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true },
        },
      },
    },
  },
})

lspconfig.sumneko_lua.setup(luadev)
