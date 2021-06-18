-- Quickstart
-- :Scratch opens a scratch buffer in a new window (by default using the top 20% of the screen,
-- configurable via g:scratch_height and g:scratch_top).
-- The window automatically closes when inactive (and its contents will be available the next time it is opened).

-- gs in normal mode opens the scratch window and enters insert mode. The scratch window closes when you leave insert mode. This is especially useful for quick notes.
-- gs in visual mode pastes the current selection (character-wise, line-wise or block-wise) into the scratch buffer.
-- Both above mappings have a gS variant that clears the scratch buffer before opening it.

-- By default the contents of the scratch window are lost when leaving Vim. To enable cross-session persistence, set the g:scratch_persistence_file option to a valid file path.

vim.g.scratch_no_mappings = 1
-- vim.cmd([[nmap <leader>s <plug>(scratch-insert-reuse)]])
-- vim.cmd([[nmap <leader>S <plug>(scratch-insert-clear)]])
-- vim.cmd([[xmap <leader>s <plug>(scratch-selection-reuse)]])
-- vim.cmd([[xmap <leader>S <plug>(scratch-selection-clear)]])

vim.g.scratch_height = 0.4

vim.g.scratch_persistence_file = "~/.local/share/nvim/scratchbuf.vim"
