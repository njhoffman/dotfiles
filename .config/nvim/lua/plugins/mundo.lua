
local plugins = {}

function plugins.setup(use)
  use { "simnalamburt/vim-mundo"}
  vim.g.mundo_width = 45
  vim.g.mundo_preview_height = 15
  vim.g.mundo_right = 1
  vim.g.mundo_help = 0
  vim.g.mundo_disable = 0
  vim.g.mundo_preview_bottom = 0
  vim.g.mundo_close_on_revert = 0
  vim.g.mundo_auto_preview = 1
  vim.g.mundo_playback_delay = 60
  -- vim.g.mundo_preview_statusline = nil
  -- vim.g.mundo_tree_statusline = nil
end

return plugins
