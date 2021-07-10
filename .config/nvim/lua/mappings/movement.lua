-- Blink current search match
-- vim.cmd('nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>')
-- vim.cmd('nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>')
-- ["<C-f>"] = {"<Plug>(SmoothieForwards)", "Scroll forward"},
-- TODO: fork and add option to limit overshot
-- TODO: add shift mapping for twice the speed
local movement_map = {
  ["<C-f>"] = {
    "<Plug>(SmoothieDownwards)<Plug>(SmoothieDownwards)",
    "Scroll forward",
  },
  ["<C-b>"] = { "<Plug>(SmoothieBackwards)", "Scroll backwards" },
  ["G"] = { "<Plug>(Smoothie_G)", "Scroll to bottom" },
  ["gg"] = { "<Plug>(Smoothie_gg)", "Scroll to top" },
  -- HlsLens
  ["n"] = {
    "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
  },
  ["N"] = {
    "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
  },
  ["*"] = { "*<Cmd>lua require('hlslens').start()<CR>" },
  ["#"] = { "#<Cmd>lua require('hlslens').start()<CR>" },
  ["g*"] = { "g*<Cmd>lua require('hlslens').start()<CR>" },
  ["g#"] = { "g#<Cmd>lua require('hlslens').start()<CR>" },
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}
--- Spectre
-- vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('v', '<leader>S', ":lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>Sw', "viw:lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>sp', "viw:lua require('spectre').open_file_search()<CR>", {noremap = true, silent = false})- vim.api.nvim_set_keymap('n', '<leader>to', ':TodoTelescope<CR>', {noremap = true, silent = false})
-- -- Fterm
-- vim.api.nvim_set_keymap('n', '<F5>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<F5>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>nn', ":e ~/Note/", {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})

require("which-key").register(movement_map, opts)
