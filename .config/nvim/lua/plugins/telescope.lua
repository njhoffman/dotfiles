local plugin = {}

function plugin.config()
  local actions = require('telescope.actions')
  local sorters = require('telescope.sorters')
  local previewers = require('telescope.previewers')

  local telescope_config = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
        n = {
          ["<esc>"] = actions.close,
        },
      },
      vimgrep_arguments = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_position = "bottom",
      prompt_prefix = "> ",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_defaults = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter = sorters.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter =  sorters.get_generic_fuzzy_sorter,
      shorten_path = true,
      winblend = 0,
      width = 0.75,
      preview_cutoff = 120,
      results_height = 1,
      results_width = 0.8,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = previewers.buffer_previewer_maker
    }
  }
  return telescope_config
end

function plugin.load()
  local telescope_config = plugin.config()
  require('telescope').setup(telescope_config)
end


function plugin.setup(use)
  use {
    "nvim-telescope/telescope-fzy-native.nvim",
    requires = "nvim-telescope/telescope.nvim",
    config = plugin.load
  }
end

return plugin
--  telescope mappings
--  nnoremap <leader><space> :Telescope git_files<CR>
--  nnoremap <leader>ff :Telescope live_grep<CR>
--  nnoremap <leader>FF :Telescope find_files<CR>
--  nnoremap <leader>fg :Telescope git_branches<CR>
--  nnoremap <leader>fb :Telescope buffers<CR>
