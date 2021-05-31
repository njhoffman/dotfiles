local utils = require('utils.core')
local map = utils.map

-- map underscore to remove search highlighting
map('n', '_', ':nohl<CR>')

-- Blink current search match
-- vim.cmd('nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>')
-- vim.cmd('nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>')

-- Note that g! is equivalent to v, so you could also do the above with:
-- deleting lines
-- :g/profile/d
-- :g/^\s*$/d
-- :g!/^\s*"/d

-- session saving/loading
map('n', 'ss', ':<C-u>SessionSave<CR>', { silent = true })
map('n', 'sl', ':<C-u>SessionLoad<CR>', { silent = true })

-- buffer management
map('n', '<Leader>q', '<cmd>qa<cr>', { silent = true })
map('n', '<Leader>x', '<cmd>x!<cr>', { silent = true })
map('n', '<Leader>w', '<cmd>w<cr>', {silent = true})
map('n', '<C-s>', '<cmd>w<cr>', {silent = true})
map('i', '<C-s>', '<esc><cmd>w<cr>', {silent = true})
-- map('n', '<leader>d', '<cmd>Sayonara<cr>', {silent = true, nowait = true})

-- Esc in the terminal
map('t', 'jj', [[<C-\><C-n>]])

-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- print(vim.inspect(vim.api.nvim_get_keymap('n')))
-- :verbose nmap
