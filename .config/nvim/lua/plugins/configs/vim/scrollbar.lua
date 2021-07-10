local af = require("../utils/autofunc")

vim.g.scrollbar_right_offset = 0
vim.g.scrollbar_highlight = { head = "Scrollbar", body = "Scrollbar", tail = "Scrollbar" }
vim.g.scrollbar_shape = { head = "▖", body = "▌", tail = "▘" }

af("CursorMoved,VimResized,QuitPre", "*", "silent! lua require('scrollbar').show()")
af("WinEnter,FocusGained", "*", "silent! lua require('scrollbar').show()")
af("WinLeave,BufLeave,BufWinLeave,FocusLost", "*", "silent! lua require('scrollbar').clear()")

-- augroup ScrollbarInit
--   autocmd!
--   autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
--   autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
--   autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
-- augroup end
