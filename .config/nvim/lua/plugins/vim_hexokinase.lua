local plugin = {}

function plugin.config()
  vim.g.Hexokinase_ftDisabled = 1
  vim.g.Hexokinase_highlighters = {'virtual'}
  -- foreground, foregroundfull, background, backgroundfull, virtual, sign_column
  -- let g:Hexokinase_highlighters = ['sign_column']
end

function plugin.load()
  plugin.config()
end

function plugin.setup(use)
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase', config = plugin.load }
end

return plugin
