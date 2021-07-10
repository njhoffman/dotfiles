local reload = require("nvim-reload")

-- If you use Neovim's built-in plugin system
-- Or a plugin manager that uses it (eg: packer.nvim)
local plugin_dirs_packer = vim.fn.stdpath("data") .. "/site/pack/*/start/*"

-- If you use vim-plug
-- local plugin_dirs_plug = vim.fn.stdpath("data") .. "/plugged/*"
-- reload.vim_reload_dirs = { vim.fn.stdpath("config"), plugin_dirs_plug }

reload.lua_reload_dirs = {
  vim.fn.stdpath("config"),
  -- Note: the line below may cause issues reloading your config
  plugin_dirs_packer,
}

-- reload.files_reload_external = {
--     vim.fn.stdpath('config') .. '/myfile.vim'
-- }

reload.modules_reload_external = { "packer" }

reload.post_reload_hook = function()
  vim.cmd([[call bufferline#highlight#setup()]])
  require("feline").reset_highlights()
end