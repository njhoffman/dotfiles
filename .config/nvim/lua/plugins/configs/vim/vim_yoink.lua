-- :Yanks - Display the current yank history
-- :ClearYanks - Delete history. This will reduce the history down to 1 entry taken from the default register.
vim.g.yoinkMaxItems = 15
vim.g.yoinkSavePersistently = 1
vim.g.yoinkMoveCursorToEndOfPaste = 1
vim.g.yoinkSyncNumberedRegisters = 1

-- g:yoinkSyncNumberedRegisters - When set to 1, every time the yank history changes the numbered registers 1 - 9 will be updated to sync with the first 9 entries in the yank history. See here for an explanation of why we would want do do this. Default: 0.
-- g:yoinkIncludeDeleteOperations - When set to 1, delete operations such as x or d or s will also be added to the yank history. Default: 0
-- g:yoinkAutoFormatPaste - When set to 1, after a paste occurs it will automatically be formatted (using = key). Default: 0. Note that you can also leave this off and use the toggle key instead for cases where you want to format after the paste.
-- g:yoinkSwapClampAtEnds - When set to 1, when we reach the beginning or end of the yank history, the swap will stop there. When set to 0, it will cycle back to the other end of the history so you can swap in the same direction forever. Default: 1
-- g:yoinkIncludeNamedRegisters - When set to 1, all yanks for all registers will be included in the history. When set to 0, only changes to the default register will be recorded. Default: 1
-- g:yoinkSyncSystemClipboardOnFocus - When set to 0, the System Clipboard feature described below will be disabled. Default: 1

-- Persistent/Shared History
-- When g:yoinkSavePersistently is set to 1, the yank history will be saved persistently by taking advantage of Neovim's "ShaDa" feature. Note that since ShaDa support only exists in Neovim this feature is not available for Vim.
-- Note also that the ! option must be added to Neovims shada setting for this feature to work. For example: set shada=!,'100,<50,s10,h (see :h 'shada' for details)
-- You can also use this feature to sync the yank history across multiple running instances of Vim by updating Neovim's shada file. For example, if you execute :wshada in the first instance and then :rshada in the second instance, the second instance will be synced with the yank history in the first instance. If this becomes a common operation you might consider using key bindings for this.
