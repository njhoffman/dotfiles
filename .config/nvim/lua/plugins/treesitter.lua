local plugin = {}

-- :TSPlaygroundToggle
-- :TSHighlightCapturesUnderCursor
function plugin.load()
  local config = require("config").Treesitter
  require("nvim-ts-autotag")

  local tsconfig = require "nvim-treesitter.configs"
  tsconfig.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = "all",
    ensure_installed = require("settings-parsers"),
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
    matchup = {
      enable = true -- mandatory, false will disable the whole extension
      -- disable = {"c", "ruby"} -- optional, list of language that will be disabled
    },
    autotag = {enable = true},
    indent = {enable = config.indent},
    -- textobjects = {enable = true},
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
        }
      },
      swap = {
        enable = true,
        swap_next = {["<leader>a"] = "@parameter.inner"},
        swap_previous = {["<leader>A"] = "@parameter.inner"}
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {["]f"] = "@function.outer", ["]c"] = "@class.outer"},
        goto_previous_start = {["[f"] = "@function.outer", ["[c"] = "@class.outer"}
      }
    },
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
      "windwp/nvim-ts-autotag",
      {
        "andymass/vim-matchup",
        event = "BufEnter",
        config = function()
          vim.g.matchup_matchparen_deferred = 1
          vim.g.matchup_matchparen_offscreen = {method = "popup"}
        end
      },
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/playground"
    }
  }
end
return plugin

-- -------------------- TEXT OBJECTS --------------------------
-- for _, ch in ipairs({
--   '<space>', '!', '#', '$', '%', '&', '*', '+', ',', '-', '.',
--   '/', ':', ';', '=', '?', '@', '<bslash>', '^', '_', '~', '<bar>',
-- }) do
--   map('x', fmt('i%s', ch), fmt(':<C-u>normal! T%svt%s<CR>', ch, ch), {silent = true})
--   map('o', fmt('i%s', ch), fmt(':<C-u>normal vi%s<CR>', ch), {silent = true})
--   map('x', fmt('a%s', ch), fmt(':<C-u>normal! F%svf%s<CR>', ch, ch), {silent = true})
--   map('o', fmt('a%s', ch), fmt(':<C-u>normal va%s<CR>', ch), {silent = true})
-- end
