
lua <<EOF
-- utils.lua
local M = {}

local function printf(...) print(string.format(...)) end
local sprintf = string.format

M.printf = printf
M.sprintf = sprintf

function M.get_cursor_pos() return {vim.fn.line('.'), vim.fn.col('.')} end

function M.debounce(func, timeout)
  local timer_id
  return function(...)
    if timer_id ~= nil then vim.fn.timer_stop(timer_id) end
    local args = {...}
    local function cb()
      func(args)
      timer_id = nil
    end
    timer_id = vim.fn.timer_start(timeout, cb)
  end
end

-- FIXME
function M.throttle(func, timeout)
  local timer_id
  local did_call = false
  return function(...)
    local args = {...}
    if timer_id == nil then
      func(args)
      local function cb()
        timer_id = nil
        if did_call then
          func(args)
          did_call = false
        end
      end
      timer_id = vim.fn.timer_start(timeout, cb)
    else
      did_call = true
    end
  end
end

function M.format_formatprg()
  local opt_exists, formatprg = pcall(function() return vim.bo.formatprg end)
  if opt_exists and #formatprg > 0 then
    local view = vim.fn.winsaveview()
    vim.api.nvim_command('normal gggqG')
    vim.fn.winrestview(view)
    return true
  else
    return false
  end
end

-- Convert UTF-8 hex code to character
function M.u(code)
  if type(code) == 'string' then code = tonumber('0x' .. code) end
  local c = string.char
  if code <= 0x7f then return c(code) end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

function _G.dump(...)
  local args = {...}
  if #args == 1 then
    print(vim.inspect(args[1]))
  else
    print(vim.inspect(args))
  end
end

function M.load(path)
  local ok, mod = pcall(require, path)
  if not ok then
    printf('Error loading module `%s`', path)
    print(mod)
  else
    local loadfunc
    if type(mod) == 'function' then
      loadfunc = mod
    elseif mod.setup ~= nil then
      loadfunc = mod.setup
    end
    local ok, err = pcall(loadfunc)
    if not ok then
      printf('Error loading module `%s`', path)
      print(err)
    end
  end
end

-- Get information about highlight group
function M.hl_by_name(hl_group)
  local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
  if hl.foreground ~= nil then hl.fg = string.format('#%x', hl.foreground) end
  if hl.background ~= nil then hl.bg = string.format('#%x', hl.background) end
  return hl
end

-- Define a new highlight group
-- TODO: rewrite to `nvim_set_hl()` when API will be stable
function M.highlight(cfg)
  local fg, bg = cfg.fg or cfg[2], cfg.bg or cfg[3]
  local _gui, _guisp = cfg.gui or cfg[4], cfg.guisp or cfg[5]
  local guifg = fg and ' guifg=' .. fg or ''
  local guibg = bg and ' guibg=' .. bg or ''
  local gui = _gui and ' gui=' .. _gui or ''
  local guisp = _guisp and ' guisp=' .. _guisp or ''
  vim.cmd('highlight ' .. cfg[1] .. guifg .. guibg .. gui .. guisp)
end

-- function M.highlight(hl_group, fg, bg, gui)
--   local guifg = fg and ' guifg=' .. fg or ''
--   local guibg = bg and ' guibg=' .. bg or ''
--   local gui = gui and ' gui=' .. gui or ''
--   vim.cmd('highlight ' .. hl_group .. guibg .. guifg .. gui)
-- end

-- colors.lua
--
local ayu_dark, ayu_mirage = (function()
  local ayu_colors = {
    bg = {dark = '#0F1419', light = '#FAFAFA', mirage = '#212733'},
    comment = {dark = '#5C6773', light = '#ABB0B6', mirage = '#5C6773'},
    markup = {dark = '#F07178', light = '#F07178', mirage = '#F07178'},
    constant = {dark = '#FFEE99', light = '#A37ACC', mirage = '#D4BFFF'},
    operator = {dark = '#E7C547', light = '#E7C547', mirage = '#80D4FF'},
    tag = {dark = '#36A3D9', light = '#36A3D9', mirage = '#5CCFE6'},
    regexp = {dark = '#95E6CB', light = '#4CBF99', mirage = '#95E6CB'},
    string = {dark = '#B8CC52', light = '#86B300', mirage = '#BBE67E'},
    _function = {dark = '#FFB454', light = '#F29718', mirage = '#FFD57F'},
    special = {dark = '#E6B673', light = '#E6B673', mirage = '#FFC44C'},
    keyword = {dark = '#FF7733', light = '#FF7733', mirage = '#FFAE57'},
    error = {dark = '#FF3333', light = '#FF3333', mirage = '#FF3333'},
    accent = {dark = '#F29718', light = '#FF6A00', mirage = '#FFCC66'},
    panel = {dark = '#14191F', light = '#FFFFFF', mirage = '#272D38'},
    guide = {dark = '#2D3640', light = '#D9D8D7', mirage = '#3D4751'},
    line = {dark = '#151A1E', light = '#F3F3F3', mirage = '#242B38'},
    selection = {dark = '#253340', light = '#F0EEE4', mirage = '#343F4C'},
    fg = {dark = '#E6E1CF', light = '#5C6773', mirage = '#D9D7CE'},
    fg_idle = {dark = '#3E4B59', light = '#828C99', mirage = '#607080'},
  }

  local ayu_mappings = {
    bg = ayu_colors.selection,
    fg = ayu_colors.fg,
    normal = ayu_colors.string,
    insert = ayu_colors.tag,
    replace = ayu_colors.markup,
    visual = ayu_colors.special,
    command = ayu_colors.keyword,
    terminal = ayu_colors.regexp,
    lsp_active = ayu_colors.string,
    lsp_inactive = ayu_colors.fg_idle,
    illuminate = {dar = '#3E4B59', mirage = '#3E4B59'},
  }

  local ayu_dark, ayu_mirage = {}, {}
  for k, v in pairs(ayu_mappings) do
    ayu_dark[k] = v.dark
    ayu_mirage[k] = v.mirage
  end
  return ayu_dark, ayu_mirage
end)()

-- local ayu_dark = {
--   bg = '#0F1419',
--   fg = '#E6E1CF',
--   normal = '#B8CC52',
--   insert = '#36A3D9',
--   replace = '#F07178',
--   visual = '#E6B673',
--   command = '#FF7733',
--   terminal = '#95E6CB',
-- }

-- local ayu_mirage = {
--   bg = '#0F1419',
--   fg = '#E6E1CF',
--   normal = '#B8CC52',
--   insert = '#36A3D9',
--   replace = '#F07178',
--   visual = '#E6B673',
--   command = '#FF7733',
--   terminal = '#95E6CB',
-- }

-- -- Gruvbox
-- local colors = {
--   dark0_hard = '#1d2021',
--   dark0 = '#282828',
--   dark0_soft = '#32302f',
--   dark1 = '#3c3836',
--   dark2 = '#504945',
--   dark3 = '#665c54',
--   dark4 = '#7c6f64',
--   dark4_256 = '#7c6f64',
--   gray_245 = '#928374',
--   gray_244 = '#928374',
--   light0_hard = '#f9f5d7',
--   light0 = '#fbf1c7',
--   light0_soft = '#f2e5bc',
--   light1 = '#ebdbb2',
--   light2 = '#d5c4a1',
--   light3 = '#bdae93',
--   light4 = '#a89984',
--   light4_256 = '#a89984',
--   bright_red = '#fb4934',
--   bright_green = '#b8bb26',
--   bright_yellow = '#fabd2f',
--   bright_blue = '#83a598',
--   bright_purple = '#d3869b',
--   bright_aqua = '#8ec07c',
--   bright_orange = '#fe8019',
--   neutral_red = '#cc241d',
--   neutral_green = '#98971a',
--   neutral_yellow = '#d79921',
--   neutral_blue = '#458588',
--   neutral_purple = '#b16286',
--   neutral_aqua = '#689d6a',
--   neutral_orange = '#d65d0e',
--   faded_red = '#9d0006',
--   faded_green = '#79740e',
--   faded_yellow = '#b57614',
--   faded_blue = '#076678',
--   faded_purple = '#8f3f71',
--   faded_aqua = '#427b58',
--   faded_orange = '#af3a03',
--   none = 'NONE',
-- }
-- colors.bg = vim.fn.synIDattr(vim.fn.hlID('StatusLine'), 'bg') -- Default background
-- colors.fg = colors.light0 -- Default foreground

local gl = require 'galaxyline'
local fileinfo = require 'galaxyline.provider_fileinfo'
local devicons = require 'nvim-web-devicons'
-- local utils = require 'utils'

local cl = ayu_dark
local gls = gl.section
local u = M.u

local mode_map = {
  ['n'] = {'NORMAL', cl.normal},
  ['i'] = {'INSERT', cl.insert},
  ['R'] = {'REPLACE', cl.replace},
  ['v'] = {'VISUAL', cl.visual},
  ['V'] = {'V-LINE', cl.visual},
  ['c'] = {'COMMAND', cl.command},
  ['s'] = {'SELECT', cl.visual},
  ['S'] = {'S-LINE', cl.visual},
  ['t'] = {'TERMINAL', cl.terminal},
  [''] = {'V-BLOCK', cl.visual},
  [''] = {'S-BLOCK', cl.visual},
  ['Rv'] = {'VIRTUAL'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = u '2590',
  left_filled = u '258c',
  -- right_filled = u 'e0b2',
  -- left_filled = u 'e0b0',
  right = u '2503',
  left = u '2503',
  -- right = u 'e0b3',
  -- left = u 'e0b1',
}

local icons = {
  locker = u 'f023',
  unsaved = u 'f693',
  dos = u 'e70f',
  unix = u 'f17c',
  mac = u 'f179',
  lsp_warn = u 'f071',
  lsp_error = u 'f46e',
}

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or cl.none end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand '%:t') ~= 1 then return true end
  return false
end

local function diagnostic_exists()
  return vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function wide_enough()
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > 80 then return true end
  return false
end

gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

gls.left = {
  {
    ViMode = {
      provider = function()
        local modehl = mode_hl()
        highlight('GalaxyViMode', cl.bg, modehl, 'bold')
        highlight('GalaxyViModeInv', modehl, cl.bg, 'bold')
        return string.format('  %s ', mode_label())
      end,
      separator = sep.left_filled,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    FileIcon = {
      provider = function()
        local fname, ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
        local icon, iconhl = devicons.get_icon(fname, ext)
        if icon == nil then return '' end
        local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
        highlight('GalaxyFileIcon', fg, cl.bg)
        return ' ' .. icon .. ' '
      end,
      condition = buffer_not_empty,
    },
    FileName = {
      provider = function()
        if not buffer_not_empty() then return '' end
        local fname
        if wide_enough() then
          fname = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
        else
          fname = vim.fn.expand '%:t'
        end
        if #fname == 0 then return '' end
        if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
        if vim.bo.modified then fname = fname .. ' ' .. icons.unsaved end
        return ' ' .. fname .. ' '
      end,
      highlight = {cl.fg, cl.bg},
      separator = sep.left,
      separator_highlight = 'GalaxyViModeInv',
    },
  },
}

gls.right = {
  {
    LspStatus = {
      provider = function()
        local connected = not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
        if connected then
          return ' ' .. u 'f817' .. ' '
        else
          return ''
        end
      end,
      highlight = {cl.lsp_active, cl.bg},
      separator = sep.right,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    DiagnosticWarn = {
      provider = function()
        local n = vim.lsp.diagnostic.get_count(0, 'Warning')
        if n == 0 then return '' end
        return string.format(' %s %d ', icons.lsp_warn, n)
      end,
      highlight = {'yellow', cl.bg},
    },
    DiagnosticError = {
      provider = function()
        local n = vim.lsp.diagnostic.get_count(0, 'Error')
        if n == 0 then return '' end
        return string.format(' %s %d ', icons.lsp_error, n)
      end,
      highlight = {'red', cl.bg},
    },
  }, {
    FileType = {
      provider = function()
        if not buffer_not_empty() then return '' end
        local icon = icons[vim.bo.fileformat] or ''
        return string.format(' %s %s ', icon, vim.bo.filetype)
      end,
      condition = buffer_not_empty,
      highlight = {cl.fg, cl.bg},
      separator = sep.right,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    PositionInfo = {
      provider = {
        function()
          return string.format('%s:%s', vim.fn.line('.'), vim.fn.col('.'))
        end,
      },
      highlight = 'GalaxyViMode',
      condition = buffer_not_empty,
      separator = sep.right_filled,
      separator_highlight = 'GalaxyViModeInv',
    },
    PercentInfo = {
      provider = fileinfo.current_line_percent,
      highlight = 'GalaxyViMode',
      condition = buffer_not_empty,
      separator = sep.right,
      separator_highlight = 'GalaxyViMode',
    },
  },
}

for k, v in pairs(gls.left) do gls.short_line_left[k] = v end
table.remove(gls.short_line_left, 1)

for k, v in pairs(gls.right) do gls.short_line_right[k] = v end
table.remove(gls.short_line_right)
table.remove(gls.short_line_right)
EOF

" vim:ft=lua
