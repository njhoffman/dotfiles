-- ["<F5>"] = {"<cmd>MundoToggle<CR>"},
-- gitsigns
--   buffer = true?

local interface_maps = {
  ["<leader>g"] = {
    name = "+git",
    ["f"] = {"<cmd>Telescope git_files<cr>", "files"},
    ["c"] = {"<cmd>Telescope git_commits<cr>", "commits"},
    ["b"] = {"<cmd>Telescope git_branches<cr>", "branches"},
    ["s"] = {"<cmd>Telescope git_status<cr>", "status"},
    ["n"] = {"<cmd>Gitsigns next_hunk<cr>", "next hunk"},
    ["p"] = {"<cmd>Gitsigns prev_hunk<cr>", "prev hunk"},
    ["v"] = {"<cmd>Gitsigns preview_hunk<cr>", "preview hunk"},
    ["r"] = {"<cmd>Gitsigns reset_hunk<cr>", "reset hunk"},
    ["R"] = {"<cmd>Gitsigns reset_buffer<cr>", "reset buffer"}
    --   ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    --   ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    --   ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    --   ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    --   ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    --   -- Text objects
    --   ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    --   ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
  },
-- ["n"] = "<F5>", ":MundoToggle<CR>")
