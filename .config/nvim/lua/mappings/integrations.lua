-- ["<F5>"] = {"<cmd>MundoToggle<CR>"},
-- gitsigns
--   buffer = true?

local integrations_map = {
  ["e"] = {"<cmd>NvimTreeToggle<cr>", "toggle explorer"},
  ["u"] = {"<cmd>MundoToggle<cr>", "toggle undo tree"},
  ["<leader>o"] = {
    name = "+open",
    ["t"] = {"<cmd>ToggleTerm<cr>", "terminal"},
    ["e"] = {"<cmd>NvimTreeFindFile<cr>", "find current file"},
    ["u"] = {"<cmd>MundoToggle<cr>", "undo tree"}
  },
  ["<leader>p"] = {
    name = "+plugins",
    ["u"] = {"<cmd>PackerUpdate<cr>", "update"},
    ["i"] = {"<cmd>PackerInstall<cr>", "install"},
    ["S"] = {"<cmd>PackerSync<cr>", "sync"},
    ["c"] = {"<cmd>PackerClean<cr>", "clean"},
    ["s"] = {"<cmd>PackerStatus<cr>", "status"}
  },
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

    -- ["n"] = "<F5>", ":MundoToggle<CR>")
  }
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(integrations_map, opts)

-- <Plug>(ripple_open_repl)	y<cr> (nmap)	Open REPL
-- <Plug>(ripple_send_motion)	yr (nmap)	Send motion to REPL
-- <Plug>(ripple_send_previous)	yp (nmap)	Resend previous code selection
-- <Plug>(ripple_send_selection)	R (xmap)	Send selection to REPL
-- <Plug>(ripple_send_line)	yrr (nmap)	Send line to REPL
-- <Plug>(ripple_send_buffer)	yr<cr> (nmap)	Send whole buffer to REPL
