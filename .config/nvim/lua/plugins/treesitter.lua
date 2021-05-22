local config = require("config")

--local ensure_installed = config.Treesitter.parsers

local treesitter_config = {
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    -- disable = { "c", "rust", "javascript" },  -- list of language that will be disabled
  },
  indent = { enable = config.Treesitter.indent},
  rainbow = {enable = config.Treesitter.rainbow},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
}

local plugin = {}

function plugin.load()
  require "nvim-treesitter.configs".setup(treesitter_config)
end

function plugin.setup(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = plugin.load,
    requires = { "p00f/nvim-ts-rainbow" }
  }
end

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
return plugin
