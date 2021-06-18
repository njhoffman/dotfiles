
-- g:float_preview#win
-- When the floating window opens, float-preview.nvim will emit a custom autocommand which you can use to further configure the opened window. The window ID will be exposed through g:float_preview#win.
-- Example: a function that disables numbers and the cursor line in the opened window.
-- function! DisableExtras()
--   call nvim_win_set_option(g:float_preview#win, 'number', v:false)
--   call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
--   call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
-- endfunction
-- autocmd User FloatPreviewWinOpen call DisableExtras()

-- vim.g.float_preview#docked = 1
-- If set to 0, the preview window will be displayed beside the popup menu. Defaults to 1.

-- vim.g.float_preview#winhl
-- Custom highlights for preview window. See :help 'winhl' for more information.

-- vim.g.float_preview#max_height = 30
-- Height of the preview window. Defaults to :help 'previewheight'.

-- vim.g.float_preview#max_width = 50
-- Only used when g:float_preview#docked == 0. Max width of the preview window. Defaults to 50.

-- vim.g.float_preview#auto_close = 1
-- Defaults to 1. Only used when g:float_preview#dock
