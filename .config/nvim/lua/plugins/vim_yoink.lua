local map = require("utils.core").map
local plugin = {}

-- :Yanks - Display the current yank history
-- :ClearYanks - Delete history. This will reduce the history down to 1 entry taken from the default register.

function set_mapping()
  -- Change current yank and see a preview of it in the status bar
  -- nmap [y <plug>(YoinkRotateBack)
  -- nmap ]y <plug>(YoinkRotateForward)
  -- nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  -- nmap <c-p> <plug>(YoinkPostPasteSwapForward)
  -- nmap p <plug>(YoinkPaste_p)
  -- nmap P <plug>(YoinkPaste_P)
  -- " Also replace the default gp with yoink paste so we can toggle paste in this case too
  -- nmap gp <plug>(YoinkPaste_gp)
  -- nmap gP <plug>(YoinkPaste_gP)
  -- You might also want to add a map for toggling whether the current paste is formatted or not:
  -- nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
  -- Now, hitting <c-=> after a paste will toggle between formatted and unformatted (equivalent to using the = key). By default pastes will not be formatted until you toggle it afterwards using <c-=> (however you can also change this with the yoinkAutoFormatPaste setting as described below)
  -- Finally, you can also optionally add the following map:
  -- nmap y <plug>(YoinkYankPreserveCursorPosition)
  -- xmap y <plug>(YoinkYankPreserveCursorPosition)
  --
  -- I want to use the same binding for paste to trigger the swap afterwards
  -- Try adding this to your .vimrc:
  -- nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
  -- nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
end

function set_config()
  vim.g.yoinkMaxItems = 15
  vim.g.yoinkSavePersistently = 1

  -- g:yoinkMaxItems - History size. Default: 10.
  -- g:yoinkSyncNumberedRegisters - When set to 1, every time the yank history changes the numbered registers 1 - 9 will be updated to sync with the first 9 entries in the yank history. See here for an explanation of why we would want do do this. Default: 0.
  -- g:yoinkIncludeDeleteOperations - When set to 1, delete operations such as x or d or s will also be added to the yank history. Default: 0
  -- g:yoinkSavePersistently - When set to 1, the yank history will be saved persistently across sessions of Vim. Note: Requires Neovim. See here for details. Default: 0
  -- g:yoinkAutoFormatPaste - When set to 1, after a paste occurs it will automatically be formatted (using = key). Default: 0. Note that you can also leave this off and use the toggle key instead for cases where you want to format after the paste.
  -- g:yoinkMoveCursorToEndOfPaste - When set to 1, the cursor will always be placed at the end of the paste. Default is 0 which will match normal Vim behaviour and place the cursor at the beginning when pasting multiline yanks. Setting to 1 can be nicer because it makes the post-paste cursor position more consistent between multiline and non-multiline pastes (that is, the cursor will be at the end in both cases). And also causes consecutive multiline pastes to be ordered correctly instead of interleaved together. Will also add to the jumplist if the cursor is moved more than 1 line.
  -- g:yoinkSwapClampAtEnds - When set to 1, when we reach the beginning or end of the yank history, the swap will stop there. When set to 0, it will cycle back to the other end of the history so you can swap in the same direction forever. Default: 1
  -- g:yoinkIncludeNamedRegisters - When set to 1, all yanks for all registers will be included in the history. When set to 0, only changes to the default register will be recorded. Default: 1
  -- g:yoinkSyncSystemClipboardOnFocus - When set to 0, the System Clipboard feature described below will be disabled. Default: 1

  -- Persistent/Shared History
  -- When g:yoinkSavePersistently is set to 1, the yank history will be saved persistently by taking advantage of Neovim's "ShaDa" feature. Note that since ShaDa support only exists in Neovim this feature is not available for Vim.
  -- You can also use this feature to sync the yank history across multiple running instances of Vim by updating Neovim's shada file. For example, if you execute :wshada in the first instance and then :rshada in the second instance, the second instance will be synced with the yank history in the first instance. If this becomes a common operation you might consider using key bindings for this.
  -- Note also that the ! option must be added to Neovims shada setting for this feature to work. For example: set shada=!,'100,<50,s10,h (see :h 'shada' for details)
end

function plugin.load()
  set_config()
  set_mapping()
end

function plugin.setup(use)
  use {"svermeulen/vim-yoink", config = plugin.load}
end

return plugin
