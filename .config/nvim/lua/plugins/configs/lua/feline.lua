-- Remove all inactive statusline components
-- This table is equal to the default separators table
local u = require("utils/statusline")
local cc = require("plugins/statusline/colors")[u.status_color].colors

local separators = {
  vertical_bar = "┃",
  vertical_bar_thin = "│",
  left = "",
  right = "",
  block = "█",
  left_filled = "  ",
  right_filled = "  ",
  slant_left = " ",
  slant_left_thin = " ",
  slant_right = " ",
  slant_right_thin = " ",
  slant_left_2 = " ",
  slant_left_2_thin = "  ",
  slant_right_2 = "",
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
    buftypes = { "terminal" },
    filetypes = {
      "NvimTree",
      "dbui",
      "packer",
      "startify",
      "fugitive",
      "fugitiveblame",
      "dashboard",
    },
  },
}

local colors = {
  fore = cc.fore,
  back = cc.back,
  dark = cc.dark,
  white = cc.white,
  skyblue = cc.skyblue,
  cyan = "#22ccff",
  green = cc.green,
  oceanblue = cc.oceanblue,
  magenta = cc.magenta,
  orange = cc.orange,
  red = cc.red,
  violet = cc.violet,
  yellow = cc.yellow,
}

local vi_mode_text = {
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

local mode_alias = {
  n = "NORMAL",
  no = "OP",
  nov = "OP",
  noV = "OP",
  ["no"] = "OP",
  niI = "NORMAL",
  niR = "NORMAL",
  niV = "NORMAL",
  v = "VISUAL",
  V = "VISUAL",
  [""] = "BLOCK",
  s = "SELECT",
  S = "SELECT",
  [""] = "BLOCK",
  i = "INSERT",
  ic = "INSERT",
  ix = "INSERT",
  R = "REPLACE",
  Rc = "REPLACE",
  Rv = "V-REPLACE",
  Rx = "REPLACE",
  c = "COMMAND",
  cv = "COMMAND",
  ce = "COMMAND",
  r = "ENTER",
  rm = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  t = "TERM",
  ["null"] = "NONE",
}

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

local vi_mode_colors = {
  -- NORMAL = 'green',
  -- INSERT = 'red',
  -- VISUAL = 'skyblue',
  -- OP = 'green',
  -- BLOCK = 'skyblue',
  -- REPLACE = 'violet',
  -- ['V-REPLACE'] = 'violet',
  -- ENTER = 'cyan',
  -- MORE = 'cyan',
  -- SELECT = 'orange',
  -- COMMAND = 'green',
  -- SHELL = 'green',
  -- TERM = 'green',
  -- NONE = 'yellow'
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

M.mode_colors = vi_mode_colors

M.mode_colors = {
  NORMAL = "#00aa44",
  INSERT = "#0077ff",
  VISUAL = "#9922ff",
  OP = colors.green,
  BLOCK = colors.skyblue,
  REPLACE = "#ff0022",
  ["V-REPLACE"] = "#ff0022",
  ENTER = colors.cyan,
  MORE = colors.cyan,
  SELECT = colors.orange,
  COMMAND = "#aa8844",
  SHELL = colors.green,
  TERM = colors.green,
  NONE = colors.yellow,
}

-- Functions for statusline
function M.get_vim_mode() return mode_alias[vim.fn.mode()] end
function M.get_mode_color() return M.mode_colors[M.get_vim_mode()] end

-- String to title case
local function title_case(str)
  return string.gsub(string.lower(str), "%a", string.upper, 1)
end

function M.get_mode_highlight_name() return
    "Vim" .. title_case(M.get_vim_mode()) end

function M.vi_mode(component)
  if component.icon then
    if component.icon == "" then
      return M.get_vim_mode()
    else
      return component.icon
    end
  else
    return ""
  end
end

function M.get_components()
  local lsp = require("feline/providers/lsp")
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

  local components = {
    left = { active = {}, inactive = {} },
    mid = { active = {}, inactive = {} },
    right = { active = {}, inactive = {} },
  }

  components.left.active[1] = { provider = "▊  ", hl = { fg = "cyan" } }

  components.left.active[2] = {
    provider = "vi_mode",
    hl = function()
      local val = {}
      val.name = M.get_mode_highlight_name()
      val.fg = M.get_mode_color()
      val.style = "bold"
      return val
    end,
    right_sep = "  ",
  }

  -- components.left.active[3] = {
  --   provider = "file_info",
  --   hl = {fg = "white", bg = "oceanblue", style = "bold"},
  --   left_sep = {" ", "slant_left_2", {str = " ", hl = {bg = "oceanblue", fg = "NONE"}}},
  --   right_sep = {"slant_right_2", " "}
  -- }

  local project_path = nil
  local last_buffer = nil
  local project_name = nil

  function Get_project_path()
    if vim.fn.bufnr() ~= last_buffer then
      project_path = nil
      project_name = nil
      last_buffer = nil
    end
    if project_name == nil or project_name == "" then
      project_path = vim.fn.FindRootDirectory()
      if project_path == nil or project_path == "" then
        project_name = string.gsub(vim.fn.getcwd(), os.getenv("HOME"), "~")
      else
        project_path, project_name = string.match(project_path, "(.*)%/(.*)")
      end
      last_buffer = vim.fn.bufnr()
    end
  end

  components.left.active[3] = {
    provider = function()
      Get_project_path()
      return project_name or ""
    end,
    hl = function()
      if project_path == nil or project_path == "" then
        return { fg = "white", bg = "#333333" }
      end
      return { fg = "white", bg = "#440088" }
    end,
    -- left_sep = {str = "slant_left", hl = {fg = "#224488", bg = "NONE"}},
    left_sep = function()

      local val = {
        str = "slant_left",
        fg = "white",
        bg = "#224488",
        style = "bold",
      }
      if project_path == nil then val.bg = "#333333" end
      return val
    end,
    right_sep = { "slant_right_2" },
  }

  components.left.active[4] = {
    provider = "file_info",
    hl = { fg = "white", bg = "dodgerblue3", style = "bold" },
    left_sep = { "slant_left", { hl = { bg = "NONE", fg = "dodgerblue3" } } },
    right_sep = { "slant_right_2", "  " },
  }

  components.left.active[5] = {
    provider = "file_size",
    left_sep = { " ", { hl = { bg = "NONE", fg = "dodgerblue3" } } },
    enabled = function() return fn.getfsize(fn.expand("%:p")) > 0 end,
    right_sep = {
      "",
      { str = "slant_left_2_thin", hl = { fg = "fg", bg = "bg" } },
      " ",
    },
  }

  components.left.active[6] = {
    provider = "position",
    right_sep = {
      " ",
      { str = "slant_right_2_thin", hl = { fg = "fg", bg = "bg" } },
    },
  }

  components.left.active[7] = {
    provider = "diagnostic_errors",
    enabled = function() return lsp.diagnostics_exist("Error") end,
    hl = { fg = "red" },
  }

  components.left.active[8] = {
    provider = "diagnostic_warnings",
    enabled = function() return lsp.diagnostics_exist("Warning") end,
    hl = { fg = "yellow" },
  }

  components.left.active[9] = {
    provider = "diagnostic_hints",
    enabled = function() return lsp.diagnostics_exist("Hint") end,
    -- hl = {fg = "cyan"}
    hl = { fg = "dodgerblue" },
  }

  components.left.active[10] = {
    provider = "diagnostic_info",
    enabled = function() return lsp.diagnostics_exist("Information") end,
    hl = { fg = "cyan" },
  }

  components.right.active[1] = {
    provider = "git_branch",
    hl = { fg = "white", bg = "black", style = "bold" },
    right_sep = function()
      local val = { hl = { fg = "NONE", bg = "black" } }
      if b.gitsigns_status_dict then
        val.str = " "
      else
        val.str = ""
      end

      return val
    end,
  }

  components.right.active[2] = {
    provider = "git_diff_added",
    hl = { fg = "green", bg = "black" },
  }

  components.right.active[3] = {
    provider = "git_diff_changed",
    hl = { fg = "orange", bg = "black" },
  }

  components.right.active[4] = {
    provider = "git_diff_removed",
    hl = { fg = "red", bg = "black" },
    right_sep = function()
      local val = { hl = { fg = "NONE", bg = "black" } }
      if b.gitsigns_status_dict then
        val.str = " "
      else
        val.str = ""
      end

      return val
    end,
  }

  components.right.active[5] = {
    provider = function() return vim.bo.filetype:lower() end,
    -- provider = "file_type",
    file = {
      info = {
        provider = M.get_current_ufn,
        hl = { fg = c.blue, style = "bold" },
        left_sep = " ",
      },
      encoding = {
        provider = "file_encoding",
        left_sep = " ",
        hl = { fg = c.violet, style = "bold" },
      },
      type = { provider = "file_type" },
      os = {
        provider = file_osinfo,
        left_sep = " ",
        hl = { fg = c.violet, style = "bold" },
      },
    },
  }

  -- lsp_status:        

  components.right.active[6] = {
    provider = "line_percentage",
    hl = { style = "bold" },
    left_sep = "  ",
    right_sep = " ",
  }

  components.right.active[7] = {
    provider = "scroll_bar",
    hl = { fg = "cyan", style = "bold" },
    right_sep = { str = " ", hl = { fg = "NONE", bg = "NONE" } },
  }
  return components
end

require("feline").setup({
  default_fg = "#909090",
  default_bg = "#0F1216",
  properties = properties,
  separators = separators,
  colors = colors,
  vi_mode_colors = M.mode_colors,
  components = M.get_components(),
})

--[[ nf-fa-sort_amount_asc                                     
nf-fa-sort_amount_desc                                    
nf-fa-spinner                                             
nf-fa-star                                                 ]]
