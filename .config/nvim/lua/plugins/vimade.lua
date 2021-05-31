local plugin = {}

function plugin.config()
  vim.g.vimade = {enabletreesitter = 1}
  vim.g.vimade.basegroups = {
    "VirtualText",
    "Search",
    "SignColumn",
    "v2hexokinase",
    "LineNr",
    "CursorLine",
    "CursorLineNr",
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffText",
    "FoldColumn",
    "Whitespace",
  }
  vim.cmd("au! CompleteChanged * redraw")
  vim.cmd("au! FocusLost * VimadeFadeActive")
  vim.cmd("au! FocusGained * VimadeUnfadeActive")

  vim.g.vimade.fadelevel = 0.6
  vim.g.vimade.signsretentionperiod = 1000
  vim.g.vimade.fadepriority = 50
  vim.g.vimade.enablesigns = 1
end

function plugin.load()
  -- plugin.config()
  require"vimade"
end

function plugin.setup(use)
  use { "TaDaa/vimade", config = plugin.load }
end

return plugin
