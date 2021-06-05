local plugin = {}

-- :TSPlaygroundToggle
-- :TSHighlightCapturesUnderCursor

function plugin.load()
  local config = require("config").Treesitter
  local tsconfig = require "nvim-treesitter.configs"
  tsconfig.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",
    textobjects = {enable = true},
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?"
      }
    },
    highlight = {
      enable = {enable = config.highlight},
      use_languagetree = true,
      additional_vim_regex_highlighting = true
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
        -- visual modes
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm"
      }
    }
  }
end

function plugin.setup(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = plugin.load,
    requires = {
      "p00f/nvim-ts-rainbow",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/playground"
    }
  }
end

return plugin
