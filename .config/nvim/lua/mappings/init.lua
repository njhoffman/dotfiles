local map = require("utils.core").map

-- Note that g! is equivalent to v, so you could also do the above with:
-- deleting lines
-- :g/profile/d
-- :g/^\s*$/d
-- :g!/^\s*"/d
-- basics
map("t", "<C-o>", [[<C-\><C-n>]])
-- Esc in the terminal
map("t", "jj", [[<C-\><C-n>]])
-- map("n", "<A-t>", ":ToggleTerm<CR>")
-- map('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"' , {expr = true})
-- map('t', 'jj', '<ESC>', {noremap = false})
-- map('v', '<leader>s', ':s//gcI<Left><Left><Left><Left>')

-- prevent "write partial file" nonsense
vim.cmd([[cabbrev <expr> w getcmdtype()==':' && getcmdline() == "'<,'>w" ? '<c-u>w' : 'w']])

-- " Return to last edit position when opening files (You want this!)
-- au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

-- vim.cmd([[xmap <leader>s <plug>(scratch-selection-reuse)]])
-- vim.cmd([[xmap <leader>S <plug>(scratch-selection-clear)]])
-- map("n", "<F5>", ":lua require('utils.core')._lazygit_toggle()<CR>")
-- :map <C-X> <ESC>:x<CR>
-- :imap <C-X> <ESC>:x<CR>

-- nnoremap <leader>e :exe getline(line('.'))<cr>
-- Run the current line as if it were a command. Often more convenient than q: when experimenting.
-- call nvim_set_keymap('n', ' <NL>', '', {'nowait': v:true})
-- vim.api.nvim_del_keymap("i", "<C-S>")
-- surround insert unmappings
-- vim.cmd([[iunmap <C-S>]])
