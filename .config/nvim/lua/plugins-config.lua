local config = require "config"

if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
  require("plugins.configs.lua.dapui")
  require("plugins.configs.lua.nvim-dap")
end

-- basic key mappings
require("plugins.configs.lua.surround")

-- project management
require("plugins.configs.lua.auto-session")
require("plugins.configs.lua.session-lens")
require("plugins.configs.vim.vim-rooter")

-- treesitter & syntax
require("plugins.configs.lua.treesitter")
require("plugins.configs.vim.syntax")

-- pickers
require("plugins.configs.vim.fzf")
require("plugins.configs.vim.fzf_preview")
require("plugins.configs.lua.jabs")
require("plugins.configs.lua.telescope")
require("plugins.configs.lua.nvim_web_devicons")

-- syntax
require("plugins.configs.vim.pandoc")
-- Don't highlight builtin functions/filters (default: 1)
vim.g.jq_highlight_builtin_functions = 0

-- Don't highlight module prefix, like NAME:: (default: 1)
vim.g.jq_highlight_module_prefix = 0

-- Don't highlight imported JSON file prefix, like $NAME:: (default: 1)
vim.g.jq_highlight_json_file_prefix = 0

-- Highlight objects like .foo (default: 0)
vim.g.jq_highlight_objects = 1

-- Highlight all function calls (default: 0)
-- This will highlight all words directly followed by an opening parenthesis
vim.g.jq_highlight_function_calls = 1

vim.g.vim_jsx_pretty_highlight_close_tag = 1
vim.g.vim_jsx_pretty_colorful_config = 1
vim.g.vim_jsx_pretty_disable_tsx = 0
vim.g.vim_jsx_pretty_disable_jsx = 0

-- Plug 'sheerun/vim-polyglot', { 'do': 'rm ~/.vim/plugged/vim-polyglot/after/indent/javascript.vim' }
-- plasticboy/vim-markdown fenced syntax blocks
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_fenced_languages = {
  "coffee",
  "css",
  "erb=eruby",
  "javascript",
  "js=javascript",
  "json=javascript",
  "python",
  "css",
  "sh",
  "bash=sh",
  "html",
  "zsh",
  "ruby",
  "sass",
  "xml",
}

vim.g.vim_markdown_no_extensions_in_markdown = 1

-- formatting
-- require("plugins.configs.lua.neoformat")
require("plugins.configs.lua.todo_comments")
require("plugins.configs.lua.kommentary")
require("plugins.configs.vim.easyalign")
require("plugins.configs.vim.splitjoin")
require("plugins.configs.vim.vim_multiple_cursors")

-- integrations
require("plugins.configs.lua.gitsigns")
-- require("plugins.configs.lua.neogit")
-- require("plugins.configs.vim.vimwiki")
require("plugins.configs.lua.neuron")
require("plugins.configs.vim.vimux")
require("plugins.configs.vim.asynctasks")
require("plugins.configs.vim.vim-ripple")

-- interfaces
require("plugins.configs.lua.nvim_bqf")
require("plugins.configs.lua.dashboard-nvim")
require("plugins.configs.lua.trouble")
require("plugins.configs.lua.nvim_tree")
require("plugins.configs.lua.nvim_toggleterm")
require("plugins.configs.lua.nvim_hlslens")
require("plugins.configs.lua.diffview")
require("plugins.configs.lua.which_key")
require("plugins.configs.lua.snap")

require("plugins.configs.vim.vim_yoink")
require("plugins.configs.vim.vim_mundo")
require("plugins.configs.vim.vim-floaterm")
require("plugins.configs.vim.float-preview")
-- require("plugins.configs.vim.scratch")

-- motion
require("plugins.configs.vim.vim_smoothie")
require("plugins.configs.vim.vim_wordmotion")
require("plugins.configs.vim.vim_matchup")
require("plugins.configs.lua.anywise-reg")

-- visual
require("plugins.configs.vim.vim_hexokinase")
require("plugins.configs.vim.vimade")
require("plugins.configs.vim.scrollbar")
require("plugins.configs.lua.truezen")
require("plugins.configs.vim.vim_plugin_AnsiEsc")

-- reload
require("plugins.configs.lua.nvim_reload")

-- themes

-- require("plugins.configs.lua.feline");
local components = require("feline.presets")["default"].components
local properties = require("feline.presets")["default"].properties

local function LspStatus()
  if #vim.lsp.buf_get_clients() > 0 then return require("lsp-status").status() end
  return ""
  -- return require("lsp-status").status_progress()
end

local function LspLightbulb()
  if #vim.lsp.buf_get_clients() > 0 then return require"nvim-lightbulb".get_status_text() end
  return ""
end

table.insert(components.right.active, 1, { provider = LspStatus, hl = { fg = "cyan", bg = "bg", style = "bold" } })
-- table.insert(components.right.active, { provider = LspStatus, hl = { fg = "cyan", bg = "bg", style = "bold" } })

-- table.insert(components.right.active, 1, {
--   provider = LspLightbulb, -- hl = { fg = "cyan", bg = "bg", style = "bold" },
-- })

table.insert(properties.force_inactive.filetypes, "dapui_scopes")
table.insert(properties.force_inactive.filetypes, "dapui_watches")
table.insert(properties.force_inactive.filetypes, "dapui_breakpoints")
table.insert(properties.force_inactive.filetypes, "dapui_stacks")
table.insert(properties.force_inactive.filetypes, "dap-repl")

-- properties = {
--   force_inactive = {
--     bufnames = {},
--     buftypes = { "terminal" },
--     filetypes = {
--       "NvimTree",
--       "dbui",
--       "packer",
--       "startify",
--       "fugitive",
--       "fugitiveblame",
--       "dashboard",
--     },
--   },
-- }

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

require("feline").setup({
  default_fg = "#909090",
  default_bg = "#0F1216",
  components = components,
  separators = separators,
})

vim.cmd("colorscheme nord-nick")
vim.cmd("source $HOME/.config/nvim/colors/barbar-colors.vim")

-- require("plugins.configs.lua.barbar")
