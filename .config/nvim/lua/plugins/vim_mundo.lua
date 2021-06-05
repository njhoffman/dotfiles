local plugin = {}

function set_config()
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

function plugin.load()
  set_config()
end

function plugin.setup(use)
  use {"simnalamburt/vim-mundo", config = plugin.load}
end

return plugin

-- Your current position in the undo tree is marked with an @ character. Other nodes are marked with an o character.
-- j/k  - Next/Prev undo state.
-- J/K  - Next/Prev write state.
-- i    - Toggle 'inline diff' mode.
-- /    - Find changes that match string.
-- n/N  - Next/Prev undo that matches search.
-- P    - Play current state to selected undo.
-- d    - Vert diff of undo with current state.
-- p    - Diff of selected undo and current state.
-- r    - Diff of selected undo and prior undo.
-- q    - Quit!
-- <cr> - Revert to selected state.
