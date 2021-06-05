local plugin = {}

signs_config_1 = {
  add = {
    hl = "GitSignsAddFaded",
    text = "│ "
    -- text = " ▎",
  },
  change = {
    hl = "GitSignsChangeFaded",
    -- text = " ▎",
    text = "│ "
  },
  delete = {
    hl = "GitSignsDeleteFaded",
    text = "│ "
    -- text = " ▎",
  },
  topdelete = {
    hl = "GitSignsDeleteFaded",
    text = "│ "
    -- text = " ▎",
  },
  changedelete = {
    hl = "GitSignsChangeDeleteFaded",
    text = "│ "
    -- text = " ▎",
  }
}

signs_config_2 = {
  add = {hl = "GreenSign", text = "│", numhl = "GitSignsAddNr"},
  change = {hl = "BlueSign", text = "│", numhl = "GitSignsChangeNr"},
  delete = {hl = "RedSign", text = "│", numhl = "GitSignsDeleteNr"},
  topdelete = {hl = "RedSign", text = "│", numhl = "GitSignsDeleteNr"},
  changedelete = {hl = "PurpleSign", text = "│", numhl = "GitSignsChangeDeleteNr"}
}

function plugin.load()
  require("gitsigns").setup {
    signs = signs_config_1,
    numhl = false,
    linehl = false,
    -- keymaps = {
    --   -- Default keymap options
    --   noremap = true,
    --   buffer = true,
    --   ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    --   ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    --   ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    --   ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    --   ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    --   ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    --   ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    --   -- Text objects
    --   ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    --   ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    -- },
    watch_index = {interval = 1000},
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
    use_decoration_api = false
  }
end

function plugin.setup(use)
  use {"lewis6991/gitsigns.nvim", config = plugin.load, requires = {"nvim-lua/plenary.nvim"}}
end

return plugin
-- signs = {
--   add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
--   change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--   delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--   topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--   changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--
-- add          = {hl = 'GitSignsAdd'   , text = ' ', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
-- change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
-- delete       = {hl = 'GitSignsDelete', text = ' ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
-- topdelete    = {hl = 'GitSignsDelete', text = ' ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
-- changedelete = {hl = 'GitSignsChangeDelete', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
