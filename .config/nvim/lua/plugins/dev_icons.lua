local plugin = {}

local devicons_config = {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {zsh = {icon = "", color = "#428850", name = "Zsh"}},
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}

function plugin.load()
  require"nvim-web-devicons".setup(devicons_config)
end

function plugin.setup(use)
  use {"junegunn/vim-easy-align", config = plugin.load}
end

return plugin
