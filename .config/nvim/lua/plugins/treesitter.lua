if Treesitter.enabled == nil or Treesitter.enabled == true then
  require "nvim-treesitter.configs".setup {
    ensure_installed = Treesitter.parsers,
    highlight = {
      enable = true, -- false will disable the whole extension
      use_languagetree = true,
      additional_vim_regex_highlighting = true,
      -- disable = { "c", "rust", "javascript" },  -- list of language that will be disabled
    },
    -- disable = { "c", "rust", "javascript" },  -- list of language that will be disabled
    indent = { enable = Treesitter.indent},
    rainbow = {enable = Treesitter.rainbow},
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
end
