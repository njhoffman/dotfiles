local config = require("config").Treesitter
require("nvim-ts-autotag")

local tsconfig = require "nvim-treesitter.configs"

tsconfig.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",
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
      show_help = "?",
    },
  },
  highlight = {
    enable = { enable = config.highlight },
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = { "javascript" },
  },
  refactor = {
    smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- disable = {"c", "ruby"} -- optional, list of language that will be disabled
  },
  autotag = { enable = true },
  indent = { enable = config.indent },
  -- textobjects = {enable = true},
  textobjects = {
    select = {
      lookahead = true,
      enable = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>a"] = "@parameter.inner" },
      swap_previous = { ["<leader>A"] = "@parameter.inner" },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
      goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = { ["gp"] = "@function.outer", ["gP"] = "@class.outer" },
    },
  },
  rainbow = { enable = config.rainbow },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      -- visual modes
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require"treesitter-context.config".setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

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

-- text objects:
-- @block.inner/outer
-- @call.inner/outer
-- @class.inner/outer
-- @comment.outer
-- @conditional.inner/outer
-- @frame.inner/outer
-- @function.inner/outer
-- @loop.inner/outer
-- @parameter.inner/outer
-- @scopename.inner
-- @statement.outer
