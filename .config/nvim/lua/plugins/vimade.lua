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
    "Whitespace"
  }
  vim.cmd("au! CompleteChanged * redraw")
  vim.cmd("au! FocusLost * VimadeFadeActive")
  vim.cmd("au! FocusGained * VimadeUnfadeActive")

  vim.g.vimade.rowbufsize = 15
  vim.g.vimade.colbufsize = 15
  vim.g.vimade.fadelevel = 0.9
  vim.g.vimade.signsretentionperiod = 1000
  vim.g.vimade.fadepriority = 50
  vim.g.vimade.enablesigns = 1
  vim.g.vimade.enablefocusfading = 1
end

function plugin.load()
  -- require "vimade"
  plugin.config()
end

function plugin.setup(use)
  use {"TaDaa/vimade"}
  -- , config = plugin.load}
  plugin.load()
end

return plugin
