local plugin = {}

function plugin.config()
  vim.g.Hexokinase_ftDisabled = 1
  vim.g.Hexokinase_highlighters = {"virtual"}
end

function plugin.load()
  -- require"-hexokinase"
  -- plugin.config()
end

function plugin.setup(use)
  use {"RRethy/vim-hexokinase", run = "make hexokinase", config = plugin.load}
end

return plugin
