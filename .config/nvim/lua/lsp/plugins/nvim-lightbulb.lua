local af = require("utils.autofunc")
-- Showing defaults
require"nvim-lightbulb".update_lightbulb {
  sign = {
    enabled = false,
    -- Priority of the gutter sign
    priority = 10,
  },
  float = {
    enabled = false,
    -- Text to show in the popup float
    text = "💡",
    -- Available keys for window options:
    -- - height     of floating window
    -- - width      of floating window
    -- - wrap_at    character to wrap at for computing height
    -- - max_width  maximal width of floating window
    -- - max_height maximal height of floating window
    -- - pad_left   number of columns to pad contents at left
    -- - pad_right  number of columns to pad contents at right
    -- - pad_top    number of lines to pad contents at top
    -- - pad_bottom number of lines to pad contents at bottom
    -- - offset_x   x-axis offset of the floating window
    -- - offset_y   y-axis offset of the floating window
    -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
    -- - winblend   transparency of the window (0-100)
    win_opts = {},
  },
  virtual_text = {
    enabled = true,
    -- Text to show at virtual text
    text = "💡",
  },
  status_text = {
    enabled = false,
    -- Text to provide when code actions are available
    text = "💡",
    -- Text to provide when no actions are available
    text_unavailable = "",
  },
}

-- af(
--   "CursorHold,CursorHoldI",
--   "*",
--   function()
--     local lightbulb_config = {
--       sign = {
--         enabled = false,
--         priority = 10
--       },
--       float = {
--         enabled = false,
--         -- Text to show in the popup float
--         text = "💡",
--         -- Available keys for window options:
--         -- - height     of floating window
--         -- - width      of floating window
--         -- - wrap_at    character to wrap at for computing height
--         -- - max_width  maximal width of floating window
--         -- - max_height maximal height of floating window
--         -- - pad_left   number of columns to pad contents at left
--         -- - pad_right  number of columns to pad contents at right
--         -- - pad_top    number of lines to pad contents at top
--         -- - pad_bottom number of lines to pad contents at bottom
--         -- - offset_x   x-axis offset of the floating window
--         -- - offset_y   y-axis offset of the floating window
--         -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
--         -- - winblend   transparency of the window (0-100)
--         win_opts = {}
--       },
--       virtual_text = {
--         enabled = true,
--         text = ""
--         -- text = "  💡"
--       }
--     }
--     -- vim.api.nvim_command("highlight LightBulbVirtualText ctermfg= ctermbg= guifg=#007777 guibg=")
--     vim.api.nvim_command("highlight LightBulbVirtualText guifg=#666688")
--     -- require "nvim-lightbulb".update_lightbulb(lightbulb_config)
--   end
-- )
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb(lightbulb_config)]]
-- vim.fn.sign_define("LightBulbSign", {text = "", texthl = "", linehl = "", numhl = ""})

--      ﮻  ﱥ    ● ★ ◉ ◎ ◯ ? ✖ Ⓘ ⓧ ⓞ  Ⓘ ◆ ◇ ⬢ ✔ ♥       
--                             
