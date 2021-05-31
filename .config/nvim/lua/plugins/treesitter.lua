
local plugin = {}

function plugin.load()
  local config = require("config").Treesitter
  local tsconfig = require"nvim-treesitter.configs"
  tsconfig.setup {
    ensure_installed = config.parsers,
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = true,
      -- disable = { "c", "rust", "javascript" },
    },
    refactor = {
      smart_rename = {enable = true, keymaps = {smart_rename = "grr"}},
      highlight_definitions = {enable = true}
      -- highlight_current_scope = { enable = true }
    },
    indent = {enable = config.indent},
    rainbow = {enable = config.rainbow},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }
end

function plugin.setup(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = plugin.load,
    requires = {"p00f/nvim-ts-rainbow", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter-refactor"},
  }
end

return plugin
