local config = require "config"

if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
  require("plugins.configs.lua.dap")
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

-- formatting
require("plugins.configs.lua.neoformat")
require("plugins.configs.lua.todo_comments")
require("plugins.configs.lua.kommentary")
require("plugins.configs.vim.easyalign")
require("plugins.configs.vim.splitjoin")
require("plugins.configs.vim.vim_multiple_cursors")

-- integrations
require("plugins.configs.lua.gitsigns")
require("plugins.configs.lua.neogit")
require("plugins.configs.lua.neuron")
-- require("plugins.configs.vim.vimwiki")
require("plugins.configs.vim.vimux")
require("plugins.configs.vim.asynctasks")
require("plugins.configs.vim.vim-ripple")

-- interfaces
require("plugins.configs.lua.nvim_bqf")
require("plugins.configs.lua.dashboard-nvim")
require("plugins.configs.lua.trouble")
require("plugins.configs.lua.nvim_tree")
require("plugins.configs.lua.nvim_toggleterm")
require("plugins.configs.lua.diffview")
require("plugins.configs.lua.which_key")
require("plugins.configs.vim.vim_yoink")
require("plugins.configs.vim.vim_mundo")

-- motion
require("plugins.configs.vim.vim_smoothie")
require("plugins.configs.vim.vim_wordmotion")
require("plugins.configs.vim.vim_matchup")

-- visual
require("plugins.configs.vim.vim_hexokinase")
require("plugins.configs.vim.vimade")
require("plugins.configs.lua.nvim_hlslens")
require("plugins.configs.vim.scrollbar")
require("plugins.configs.vim.vim_plugin_AnsiEsc")

-- reload
require("plugins.configs.lua.nvim_reload")
-- themes
require("plugins.configs.lua.barbar")
require("plugins.configs.lua.feline")
