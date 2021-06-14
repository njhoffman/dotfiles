local lsp_status = require("lsp.lspstatus")
local lsp_config = require("lsp.lspconfig")

-- lsp_status.activate()
-- local lsp_config = require "lsp.setup"
-- local config = vim.tbl_deep_extend("force", {}, theme.diagnostic_colors, options or {})

-- local lsp_servers = {}


-- local luadev = require('lua-dev').setup({
--     lspconfig = {
--         cmd = {
--             "/usr/bin/lua-language-server", "-E",
--             "/usr/share/lua-language-server/main.lua"
--         }
--     }
-- })




-- vim.g.null_ls_disable = true

-- enable null-ls integration (optional)
-- require("null-ls").setup {
--   {
--     debounce = 250,
--     keep_alive_interval = 60000, -- 60 seconds,
--     save_after_format = true,
--     default_timeout = 5000,
--     sources = nil,
--     on_attach = nil
--   }
-- }
-- config that activates keymaps and enables snippet support

-- Vim lsp
-- lsp_servers.vimls.setup {on_attach = on_attach}

-- function lsp_servers.make_config(server_name)
--   local server_config = {
--     -- enable snippet support
--     capabilities = capabilities,
--     -- map buffer local keybindings when the language server attaches
--     on_attach = lsp_config.common_on_attach
--   }
--   -- language specific config
--   if server_name == "lua" then
--     server_config.settings = lsp_servers.lua.settings
--   elseif server_name == "clangd" then
--     server_config.filetypes = {"c", "cpp"} -- we don't want objective-c and objective-cpp!
--   elseif server_name == "efm" then
--     server_config.init_options = lsp_servers.efm.init_options
--     server_config.settings = lsp_servers.efm.settings
--     server_config.filetypes = lsp_servers.efm.filetypes
--   elseif server_name == "typescript" then
--     server_config.on_attach = lsp_servers.typescript.on_attach
--     server_config.filetypes = lsp_servers.typescript.filetypes
--   end
--   return server_config
-- end
-- return lsp_servers
