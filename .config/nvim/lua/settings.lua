
-- local treeParsers = require('settings-parsers')

local settings = {}

settings.Opts = {
  preserve_cursor = true,
  highlight_yank  = true,
  relativenumber  = true,
  cursorline      = true,
  listchars       = true,
  wrap            = false,
  timeoutlen      = 200,
  updatetime      = 300,
  scrolloff       = 10,
  explorer_side   = "right",
  log_path        = '~/.local/log/nvim.log',
  log_stdout       = false,
}

settings.Theming = {
  colorscheme = 'nord',
  diagnostic_colors = {
    Error       = "#db4b4b",
    Warning     = "#e0af68",
    Information = "#0db9d7",
    Hint        = "#10B981",
  }
}

settings.DAP = {
  enabled      = true,
  log_level    = 'trace',
  log_path     = '~/.local/log/nvim-dap.log',
  virtual_text = true,
  python       = true,
  go           = true,
  javascript   = true
}

-- -- trace, debug, info, warn, error
-- vim.lsp.set_log_level("info")
settings.LSP = {
  enabled          = true,
  -- TODO: efm or other lsp format boolean
  log_level        = 'info',
  underline        = false,
  update_in_insert = false,
  signs            = true,
  highlight_word   = false,
  hover_diagnostic = 'popup', -- false, virtual, popup
  virtual_text     = false,
  -- virtual_text = {
  --   show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
  --   diagnostic_delay = 500,
  --   spacing = 2,
  --   severity_limit = "Warning",
  --   prefix = '●'
  -- },
  ---------------
  -- Autostart --
  ---------------
  angular     = false,
  bash        = true,
  cmake       = false,
  cpp         = true,
  csharp      = true,
  css         = true,
  dockerfile  = true,
  elixir      = false,
  elm         = true,
  go          = true,
  graphql     = true,
  html        = true,
  java        = true,
  json        = true,
  kotlin      = false,
  latex       = false,
  lua         = true,
  php         = true,
  python      = true,
  ruby        = true,
  rust        = true,
  svelte      = false,
  tailwindcss = true,
  terraform   = true,
  typescript  = true,
  vim         = true,
  vue         = false,
  yaml        = true,
  --non-language specific
  deno         = false,
  diagnosticls = false,
  efm          = true,
  rome         = false
}

settings.Completion = {
  enabled   = true,
  autopairs = true,
  items     = 10,
  ---------------------------
  -- Sources of Completion --
  ---------------------------
  snippets = true,
  lsp      = true,
  buffer   = true,
  path     = true,
  calc     = true,
  spell    = false,
  emoji    = true
}

settings.Formatting = {
  -- if format_on_save is enable it will always trim trailing white spaces
  format_on_save      = true,
  trim_trailing_space = true,
  indent_size         = 2
}

settings.Treesitter = {
  enabled   = true,
  rainbow   = false,
  indent    = true,
  highlight = false,
  -------------
  -- Parsers --
  -------------
  -- parsers = treeParsers
}

------------------------------ GENERAL SETTINGS -------------------------------
Term = {}
Term.shell = vim.o.shell -- or a string with the path to a shell binary
Term.size = 10
Term.shade = true
Term.direction = 'horizontal' -- horizontal, vertical, window, or float
Term.floatBorder = 'shadow' -- single, double, shadow, or curved

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-------------------------- LANGAGE SPECIFIC SETTINGS --------------------------
-- See lua/lsp/efm/<language>.lua to add formatters or linters
-- Add languages in lua/lsp/efm/init.lua

Python = {}
Python.useKite = false
Python.formatter = 'black'
Python.isort = false
Python.linter = nil -- add an additional linter for more coverage than pyright

Lua = {}
Lua.formatter = 'lua-format'
Lua.formatLineLength = 120

JS_TS = {}
JS_TS.formatter = 'prettier'
JS_TS.linter = 'eslint'

Shell = {}
Shell.formatter = 'shfmt'
Shell.linter = 'shellcheck'

Markdown = {}
-- true: refresh on edit
-- false: refresh on save
Markdown.liveRefresh = false

-------------------------- DEBUGGER SETTINGS --------------------------
Debugger = {}
Debugger.pythonPath = '/usr/bin/python' -- path to python with debugpy installed
Debugger.useExternalTerminal = false
Debugger.externalTerminal = nil -- path to terminal

return settings
