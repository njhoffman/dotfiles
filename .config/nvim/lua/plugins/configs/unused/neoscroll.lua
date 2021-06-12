local plugin = {}
local map = require("utils.core").map

function plugin.load()
  require("neoscroll").setup(
    {
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {
        -- "<C-u>",
        -- "<C-d>",
        "<C-b>",
        "<C-f>",
        -- "<C-y>",
        -- "<C-e>",
        "zt",
        "zz",
        "zb"
      },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = true,
      easing_function = "sine"
      -- easing_function = nil -- Default easing function, quadratic, cubic, quartic, quintic, circular, sine
      -- easing_function = function(x) return math.pow(x, 2) end
    }
  )

  -- Syntax scrolling function: `scroll(lines, move_cursor, time[, easing_function_name])`
  local t = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  -- t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
  -- t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
  t["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "true", "500"}}
  t["<C-f>"] = {"scroll", {"vim.api.nvim_win_get_height(0)", "true", "500"}}
  -- t["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "true", "450"}}
  -- t["<C-f>"] = {"scroll", {"vim.api.nvim_win_get_height(0)", "true", "450"}}
  -- t["<C-y>"] = {"scroll", {"-0.10", "false", "100"}}
  -- t["<C-e>"] = {"scroll", {"0.10", "false", "100"}}
  t["zt"] = {"zt", {"250"}}
  t["zz"] = {"zz", {"250"}}
  t["zb"] = {"zb", {"250"}}

  -- require("neoscroll.config").set_mappings(t)
end

function plugin.setup(use)
  use {"karb94/neoscroll.nvim", config = plugin.load}
end

return plugin
