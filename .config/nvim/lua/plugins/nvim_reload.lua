local plugin = {}

function plugin.load()
  local reload = require("nvim-reload")

  -- If you use Neovim's built-in plugin system
  -- Or a plugin manager that uses it (eg: packer.nvim)
  -- local plugin_dirs = vim.fn.stdpath("data") .. "/site/pack/*/start/*"

  -- reload.vim_reload_dirs = {
  --   vim.fn.stdpath("config"),
  --   plugin_dirs
  -- }

  -- reload.lua_reload_dirs = {
  --   vim.fn.stdpath("config"),
  --   -- Note: the line below may cause issues reloading your config
  --   plugin_dirs
  -- }

  -- reload.files_reload_external = {
  --   vim.fn.stdpath("config") .. "/myfile.vim"
  -- }

  -- reload.modules_reload_external = {"packer"}

  reload.post_reload_hook = function()
    require("feline").reset_highlights()
  end
end

function plugin.setup(use)
  use {"famiu/nvim-reload", config = plugin.load}
end

return plugin
