local plugin = {}

local map = require("utils.core").map

function set_mappings()
  map("n", "<leader>ff", ":Telescope find_files<CR>")
  map("n", "<leader>fo", ":Telescope oldfiles<CR>")
  map("n", "<leader>fg", ":Telescope live_grep<CR>")
  map("n", "<leader>fh", ":Telescope help_tags<CR>")
  map("n", "<leader>fc", ":Telescope colorscheme<CR>")
  map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
  map("n", "<leader>b", ":Telescope buffers<CR>")
end

function plugin.load()
  local actions = require("telescope.actions")
  local telescope = require("telescope")
  -- telescope.load_extension("frecency")
  -- telescope.load_extension('ultisnips')
  -- telescope.load_extension('octo')
  -- telescope.load_extension('project')
  telescope.load_extension("fzy_native")
  telescope.setup {
    defaults = {
      prompt_prefix = "λ ",
      selection_caret = "|> ",
      layout_strategy = "flex", -- flex, horizontal
      scroll_strategy = "cycle",
      winblend = 10,
      width = 0.5,
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
      }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    }
  }
  set_mappings()
end

function plugin.setup(use)
  use {
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim"},
    config = plugin.load
  }
end
-- use {'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim'}

return plugin

-- defaults = {
--   vimgrep_arguments = {
--     'rg',
--     '--color=never',
--     '--no-heading',
--     '--with-filename',
--     '--line-number',
--     '--column',
--     '--smart-case'
--   },
--   prompt_position = "bottom",
--   prompt_prefix = "> ",
--   selection_caret = "> ",
--   entry_prefix = "  ",
--   initial_mode = "insert",
--   selection_strategy = "reset",
--   sorting_strategy = "descending",
--   layout_strategy = "horizontal",
--   layout_defaults = {
--     horizontal = {
--       mirror = false,
--     },
--     vertical = {
--       mirror = false,
--     },
--   },
--   file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--   file_ignore_patterns = {},
--   generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--   shorten_path = true,
--   winblend = 0,
--   width = 0.75,
--   preview_cutoff = 120,
--   results_height = 1,
--   results_width = 0.8,
--   border = {},
--   borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--   color_devicons = true,
--   use_less = true,
--   set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--   file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--   grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--   qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

--   -- Developer configurations: Not meant for general override
--   buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
-- }

--  telescope mappings
--  nnoremap <leader><space> :Telescope git_files<CR>
--  nnoremap <leader>ff :Telescope live_grep<CR>
--  nnoremap <leader>FF :Telescope find_files<CR>
--  nnoremap <leader>fg :Telescope git_branches<CR>
--  nnoremap <leader>fb :Telescope buffers<CR>
