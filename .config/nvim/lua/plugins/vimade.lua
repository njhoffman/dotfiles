
local plugin = {}


function plugin.config()
  vim.g.vimade = { enabletreesitter = 1 }
  vim.g.vimade.basegroups =  {
    'VirtualText',
    'Search',
    'SignColumn',
    'v2hexokinase',
    'LineNr',
    'CursorLine',
    'CursorLineNr',
    'DiffAdd',
    'DiffChange',
    'DiffDelete',
    'DiffText',
    'FoldColumn',
    'Whitespace',
  }
  vim.cmd('au! CompleteChanged * redraw')
  vim.cmd('au! FocusLost * VimadeFadeActive')
  vim.cmd('au! FocusGained * VimadeUnfadeActive')
  vim.g.vimade.fadelevel = 0.6
  vim.g.vimade.signsretentionperiod = 1000
  vim.g.vimade.fadepriority = 50
  vim.g.vimade.enablesigns = 1
  -- vim.g.vimade.basebg = '0000000'
  -- Enhancement for FocusGained & FocusLost events in vimade
  -- if has('gui_running') == 0 && has('nvim') == 0
  --   vim.cmd('call feedkeys(":silent execute \'!\' | redraw!\\<CR>"')
  -- endif

end

function plugin.load()
  plugin.config()
end


function plugin.setup(use)
  use { "TaDaa/vimade", config = plugin.load }
end

return plugin

-- vim.g.vimade                      = { fadelevel = "0.4" }
-- vim.g.vimade.basebg               = '0000000'
-- vim.g.vimade.fadelevel            = 0.6
-- vim.g.vimade.fadepriority         = 10
-- vim.g.vimade.checkinterval        = 100
-- vim.g.vimade.signsretentionperiod = 1000
-- vim.g.vimade.enablefocusfading    = 1
-- vim.g.vimade.enabletreesitter     = 1
-- vim.g.vimade.colbufsize           = 15
-- vim.g.vimade.rowbufxize           = 15
-- vim.g.vimade.enablesigns          = 1
-- vim.g.vimade.groupdiff            = 1
-- vim.g.vimade.groupscrollbind      = 0
-- pum content redraws can drag on performance, do user redraw
--  let g:vimade = {
--    \ "normalid": '',
--    \ "normalncid": '',
--    \ "basefg": '',
--    \ "basebg": '',
--    \ "fadelevel": 0.4,
--    \ "colbufsize": 15, "15 is the default for gui vim, 5 is the default for terminals and gvim
--    \ "rowbufsize": 15, "15 is the default for gui vim, 0 is the default for terminals and gvim
--    \ "checkinterval": 100, "100 is the default for gui vim, 500 is the default for terminals and neovim
--    \ "usecursorhold": 0, "0 is default, but will automatically set to 1 for Windows GVIM
--    \ "detecttermcolors": 0,
--    \ 'enablescroll': 1, "1 is the default for gui vim, but will automatically set to 0 for terminals and Windows GVIM.
--    \ 'enablesigns': g:vimade_features.has_signs_priority, "enabled for vim/nvim versions that support sign priority.  Older vim/nvim versions may suffer performance issues
--    \ 'signsid': 13100,
--    \ 'signsretentionperiod': 4000,
--    \ 'fademinimap': 1,
--    \ 'fadepriority': 10,
--    \ 'groupdiff': 1,
--    \ 'groupscrollbind': 0,
--    \ 'enablefocusfading': 0,
--    \ 'enablebasegroups': 1,
--    \ 'enabletreesitter' : 0, "EXPERIMENTAL FEATURE - 0 is the default, enables support for treesitter highlights"
--    \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace']
--  }



-- VimadeEnable - Turns vimade on (Vimade is on by default)
-- VimadeDisable - Turns vimade off and unfades all buffers
-- VimadeToggle - Toggles between on/off states
-- VimadeRedraw - Forces vimade to redraw fading for every window.
-- VimadeFadeLevel [0.0-1.0] - Sets the FadeLevel config and forces an immediate redraw.
-- VimadeFadePriority [0+] - Sets the FadePriority config and forces an immediate redraw.
-- VimadeInfo - Provides debug information for Vimade. Please include this info in bug reports
-- VimadeWinDisable - Disables fading for the current window
-- VimadeWinEnable - Enables fading for the current window
-- VimadeBufDisable - Disables fading for the current buffer
-- VimadeBufEnable - Enables fading for the current buffer
-- VimadeFadeActive - Fades the current active window
-- VimadeUnfadeActive - Unfades the current active window
-- VimadeOverrideFolded - Overrides the Folded highlight by creating a link to the Vimade base fade. This should produce acceptable results for colorschemes that include Folded highlights that are distracting in faded windows.
-- let g:vimade = {
--   \ 'normalid': '',
--   \ 'normalncid': '',
--   \ 'basefg': '',
--   \ 'basebg': '',
--   \ 'fadelevel': 0.4,
--   \ 'colbufsize': 15, '15 is the default for gui vim, 5 is the default for terminals and gvim
--   \ 'rowbufsize': 15, '15 is the default for gui vim, 0 is the default for terminals and gvim
--   \ 'checkinterval': 100, '100 is the default for gui vim, 500 is the default for terminals and neovim
--   \ 'usecursorhold': 0, '0 is default, but will automatically set to 1 for Windows GVIM
--   \ 'detecttermcolors': 0,
--   \ 'enablescroll': 1, --1 is the default for gui vim, but will automatically set to 0 for terminals and Windows GVIM.
--   \ 'enablesigns': g:vimade_features.has_signs_priority, --enabled for vim/nvim versions that support sign priority.  Older vim/nvim versions may suffer performance issues
--   \ 'signsid': 13100,
--   \ 'signsretentionperiod': 4000,
--   \ 'fademinimap': 1,
--   \ 'fadepriority': 10,
--   \ 'groupdiff': 1,
--   \ 'groupscrollbind': 0,
--   \ 'enablefocusfading': 0,
--   \ 'enablebasegroups': 1,
--   \ 'enabletreesitter' : 0, --EXPERIMENTAL FEATURE - 0 is the default, enables support for treesitter highlights--
--   \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace']
-- }
