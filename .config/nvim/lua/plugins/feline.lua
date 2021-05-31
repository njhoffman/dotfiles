
-- This table is equal to the default separators table
local separators = {
  vertical_bar = "┃",
  vertical_bar_thin = "│",
  left = "",
  right = "",
  block = "█",
  left_filled = "  ",
  right_filled = "  ",
  slant_left = "  ",
  slant_left_thin = " ",
  slant_right = " ",
  slant_right_thin = " ",
  slant_left_2 = " ",
  slant_left_2_thin = " ",
  slant_right_2 = " ",
  slant_right_2_thin = " ",
  left_rounded = "  ",
  left_rounded_thin = "  ",
  right_rounded = "   ",
  right_rounded_thin = "  ",
  circle = "●",
}

local properties = {
  force_inactive = {
    bufnames = {},
    buftypes = {"terminal"},
    filetypes = {"NvimTree", "dbui", "packer", "startify", "fugitive", "fugitiveblame"},
  },
}

function get_colors()
  local u = require("utils/statusline")
  local colors = require("plugins/statusline/colors")
  local cc = colors[u.status_color].colors

  local colorsets = {}

  colorsets.colors = {
    fore = cc.fore,
    back = cc.back,
    dark = cc.dark,
    white = cc.white,
    skyblue = cc.skyblue,
    cyan = cc.cyan,
    green = cc.green,
    oceanblue = cc.oceanblue,
    magenta = cc.magenta,
    orange = cc.orange,
    red = cc.red,
    violet = cc.violet,
    yellow = cc.yellow,
  }

  colorsets.vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.blue,
    VISUAL = colors.violet,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.red,
    ["V-REPLACE"] = colors.red,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.magenta,
    SHELL = colors.green,
    TERM = colors.blue,
    NONE = colors.yellow,
  }

  colorsets.vi_mode_text = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    [""] = "V-BLOCK",
    V = "V-LINE",
    c = "COMMAND",
    no = "UNKNOWN",
    s = "UNKNOWN",
    S = "UNKNOWN",
    ic = "UNKNOWN",
    R = "REPLACE",
    Rv = "UNKNOWN",
    cv = "UNKWON",
    ce = "UNKNOWN",
    r = "REPLACE",
    rm = "UNKNOWN",
    t = "INSERT",
  }

  return colorsets

end

function get_components()
  local lsp = require("feline/providers/lsp")
  local vi_mode_utils = require("feline/providers/vi_mode")
  local u = require("utils/statusline")
  local color = require("plugins/statusline/colors")
  local b = vim.b
  local fn = vim.fn

  local c = color[u.status_color]

  local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == "UNIX" then
      icon = " "
    elseif os == "MAC" then
      icon = " "
    else
      icon = " "
    end
    return icon .. os
  end

  local M = {
    bg = "#2c323c",
    fg = "none",
    yellow = "#e5c07b",
    cyan = "#8abeb7",
    darkblue = "#528bff",
    green = "#98c379",
    orange = "#d19a66",
    violet = "#b294bb",
    magenta = "#ff80ff",
    blue = "#61afef",
    red = "#e88388",
  }

  local components = {
    left = {active = {}, inactive = {}},
    mid = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}},
  }

  components.left.active[1] = {provider = "▊  ", hl = {fg = "skyblue"}}

  components.left.active[2] = {
    provider = "vi_mode",
    hl = function()
      local val = {}

      val.name = vi_mode_utils.get_mode_highlight_name()
      val.fg = vi_mode_utils.get_mode_color()
      val.style = "bold"

      return val
    end,
    right_sep = " ",
  }

  components.left.active[3] = {
    provider = "file_info",
    hl = {fg = "white", bg = "oceanblue", style = "bold"},
    left_sep = {" ", "slant_left_2", {str = " ", hl = {bg = "oceanblue", fg = "NONE"}}},
    right_sep = {"slant_right_2", " "},
  }

  components.left.active[4] = {
    provider = "file_size",
    enabled = function()
      return fn.getfsize(fn.expand("%:p")) > 0
    end,
    right_sep = {" ", {str = "slant_left_2_thin", hl = {fg = "fg", bg = "bg"}}, " "},
  }

  components.left.active[5] = {
    provider = "position",
    right_sep = {" ", {str = "slant_right_2_thin", hl = {fg = "fg", bg = "bg"}}},
  }

  components.left.active[6] = {
    provider = "diagnostic_errors",
    enabled = function()
      return lsp.diagnostics_exist("Error")
    end,
    hl = {fg = "red"},
  }

  components.left.active[7] = {
    provider = "diagnostic_warnings",
    enabled = function()
      return lsp.diagnostics_exist("Warning")
    end,
    hl = {fg = "yellow"},
  }

  components.left.active[8] = {
    provider = "diagnostic_hints",
    enabled = function()
      return lsp.diagnostics_exist("Hint")
    end,
    hl = {fg = "cyan"},
  }

  components.left.active[9] = {
    provider = "diagnostic_info",
    enabled = function()
      return lsp.diagnostics_exist("Information")
    end,
    hl = {fg = "skyblue"},
  }

  components.right.active[1] = {
    provider = "git_branch",
    hl = {fg = "white", bg = "black", style = "bold"},
    right_sep = function()
      local val = {hl = {fg = "NONE", bg = "black"}}
      if b.gitsigns_status_dict then
        val.str = " "
      else
        val.str = ""
      end

      return val
    end,
  }

  components.right.active[2] = {provider = "git_diff_added", hl = {fg = "green", bg = "black"}}

  components.right.active[3] = {provider = "git_diff_changed", hl = {fg = "orange", bg = "black"}}

  components.right.active[4] = {
    provider = "git_diff_removed",
    hl = {fg = "red", bg = "black"},
    right_sep = function()
      local val = {hl = {fg = "NONE", bg = "black"}}
      if b.gitsigns_status_dict then
        val.str = " "
      else
        val.str = ""
      end

      return val
    end,
  }

  components.right.active[5] = {
    provider = "file_type",
    file = {
      info = {provider = M.get_current_ufn, hl = {fg = c.blue, style = "bold"}, left_sep = " "},
      encoding = {provider = "file_encoding", left_sep = " ", hl = {fg = c.violet, style = "bold"}},
      type = {provider = "file_type"},
      os = {provider = file_osinfo, left_sep = " ", hl = {fg = c.violet, style = "bold"}},
    },
  }

  components.right.active[6] = {
    provider = "line_percentage",
    hl = {style = "bold"},
    left_sep = "  ",
    right_sep = " ",
  }

  components.right.active[7] = {
    provider = "scroll_bar",
    hl = {fg = "skyblue", style = "bold"},
    right_sep = {str = " ", hl = {fg = "NONE", bg = "NONE"}},
  }

  components.right.active[8] = {provider = " ▊", hl = {fg = "skyblue"}}
  return components
end

local plugin = {}

function plugin.load()
  local colorsets = get_colors()

  require("feline").setup({
    default_fg = "#909090",
    default_bg = "#0F1216",
    properties = properties,
    separators = separators,
    colors = colorsets.colors,
    vi_mode_colors = colorsets.vi_mode_colors,
    components = get_components(),
  })

end

function plugin.setup(use)
  use {"famiu/feline.nvim", config = plugin.load}
end

return plugin
