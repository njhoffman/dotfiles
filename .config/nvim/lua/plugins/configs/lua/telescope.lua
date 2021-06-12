local plugin = {}
local actions = require("telescope.actions")
local map = require("utils.core").map

-- local center_list =
--   require "telescope.themes".get_dropdown(
--   {
--     width = 0.5,
--     results_title = false,
--     results_height = 20,
--     previewer = false,
--     color_devicons = true
--   }
-- )

-- local with_preview =
--   require "telescope.themes".get_dropdown(
--   {
--     results_title = false,
--     results_height = 20,
--     shorten_path = true,
--     prompt_position = "top",
--     layout_strategy = "horizontal",
--     width = 0.75,
--     vimgrep_arguments = {
--       "rg",
--       "--hidden",
--       "--with-filename",
--       "--line-number",
--       "--no-heading",
--       "--column",
--       "--color=never"
--     }
--   }
-- )
-- Dropdown list theme using a builtin theme definitions :
local center_list =
  require "telescope.themes".get_dropdown(
  {
    winblend = 10,
    width = 0.5,
    prompt = " ",
    results_height = 15,
    previewer = false
  }
)

-- Settings for with preview option
local with_preview = {
  winblend = 10,
  show_line = false,
  results_title = false,
  preview_title = false,
  layout_config = {
    preview_width = 0.5
  }
}
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local actions = require("telescope.actions")
local telescope = require("telescope")

-- require("telescope.builtin").buffers(
--   {
--     entry_maker = require "vimrc.telescope.my_make_entry".gen_from_buffer_like_leaderf()
--   }
-- )

-- Fuzzy find over current tasks
-- telescope.load_extension("frecency")
-- telescope.load_extension('ultisnips')
-- telescope.load_extension('octo')
telescope.load_extension("session-lens")
telescope.load_extension("dap")
telescope.load_extension("fzy_native")
telescope.load_extension("project")
telescope.load_extension("asynctasks")
-- telescope.extensions.asynctasks.all()

-- require('telescope').extensions.project.project{ display_type = 'full'}
-- require("telescope").extensions.packer.plugins()
-- telescope.extensions.asynctasks.all()

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    find_command = {
      "rg",
      "--ignore",
      "--hidden",
      "--files prompt_prefix=🔍"
    },
    prompt_position = "top",
    prompt_prefix = "λ ",
    selection_caret = "|> ",
    selection_strategy = "reset", -- follow, reset, row
    sorting_strategy = "ascending",
    layout_strategy = "flex", -- flex, horizontal, veritical, center
    scroll_strategy = "cycle",
    width = 0.5,
    shorten_path = true,
    color_devicons = true,
    winblend = 15,
    horizontal = {
      width_padding = 0.1,
      height_padding = 0.1,
      preview_width = 0.6
      -- mirror = false,
    },
    vertical = {
      width_padding = 0.05,
      height_padding = 1,
      preview_height = 0.5
      -- mirror = true,
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist
        -- ["<C-h>"] = actions.goto_file_selection_split,
        -- ["<C-v>"] = actions.goto_file_selection_vsplit
      },
      n = {
        ["<esc>"] = actions.close
      }
    },
    file_sorter = sorters.get_fzy_sorter,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
  }
}
-- set_mappings()

_G.FindFile = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = "Find in project (CTRL-P)"
  opts.find_command = {"rg", "--hidden", "--files"}
  require("telescope.builtin").find_files(opts)
end

_G.FindBuffer = function()
  local my_make_entry = require("rc.telescope.my_make_entry")
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = "Find in open buffers"
  opts.find_command = {"rg", "--hidden", "--files", "--color=never"}
  opts.entry_maker = my_make_entry.gen_from_buffer_like_leaderf()
  require("telescope.builtin").buffers(opts)
end

_G.FindString = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.input("Grep for > ")
  opts.prompt_title = "Filter results"
  require("telescope.builtin").grep_string(opts)
end

_G.FindLive = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = "Live search"
  require("telescope.builtin").live_grep(opts)
end

_G.FindDot = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_title = "Find in dotfiles"
  opts.cwd = "$HOME/Projects/dotfiles/"
  opts.results_height = 10
  require("telescope.builtin").find_files(opts)
end

_G.FindGit = function()
  require("telescope.builtin").git_branches(
    {
      attach_mappings = function(_, map)
        map("i", "<c-d>", actions.git_delete_branch)
        map("n", "<c-d>", actions.git_delete_branch)
        return true
      end
    }
  )
end
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

-- Telescope projects
-- d: delete currently selected project
-- r: rename currently selected project
-- c: create a project (defaults to your git root if used inside a git project, otherwise it will use your current working directory)
-- s: search inside files within your project
-- b: browse inside files within your project
-- w: change to the selected project's directory without opening it
-- r: find a recently opened file within your project
-- f: find a file within your project (this works the same as <CR>)

-- Available options:
-- Options can be added when requiring telescope project, as shown below:
-- lua require'telescope'.extensions.project.project{ display_type = 'full' }

-- display_type:
-- 'full' (Show the title and the path of the project)
-- 'minimal' (Default. Show the title of the project only)
--

-- fzf-native
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
-- packer.nvim

-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- Telescope Setup and Configuration:

-- require('telescope').setup {
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = false, -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                        -- the default case_mode is "smart_case"
--     }
--   }
-- }
-- -- To get fzf loaded and working with telescope, you need to call
-- -- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
-- Developer Interface
-- This section is only addressed towards developers who plan to use the library (c or lua bindings). This section is not addressed towards users of the telescope extension.

-- (Disclaimer: Interface is not yet stable. The library is still in development)

-- C Interface

-- fzf_slab_t *slab = fzf_make_default_slab();
-- /* fzf_case_mode enum : case_smart = 0, case_ignore, case_respect
--  * normalize bool     : always set to false because its not implemented yet.
--  *                      This is reserved for future use
--  * pattern char*      : pattern you want to match. e.g. "src | lua !.c$
--  * fuzzy bool         : enable or disable fuzzy matching
--  */
-- fzf_pattern_t *pattern = fzf_parse_pattern(case_smart, false, "src | lua !.c$", true);

-- /* you can get the score/position for as many items as you want */
-- int score = fzf_get_score(line, pattern, slab);
-- fzf_position_t *pos = fzf_get_positions(line, pattern, slab);

-- fzf_free_positions(pos);
-- fzf_free_pattern(pattern);
-- fzf_free_slab(slab);
-- Lua Interface

-- local fzf = require('fzf_lib')

-- local slab = fzf.allocate_slab()
-- -- pattern: string
-- -- case_mode: number with 0 = smart_case, 1 = ignore_case, 2 = respect_case
-- -- fuzzy: enable or disable fuzzy matching. default true
-- local pattern_obj = fzf.parse_pattern(pattern, case_mode, fuzzy)

-- -- you can get the score/position for as many items as you want
-- -- line: string
-- -- score: number
-- local score = fzf.get_score(line, pattern_obj, slab)

-- -- table (does not have to be freed)
-- local pos = fzf.get_pos(line, pattern_obj, slab)

-- fzf.free_pattern(pattern_obj)
-- fzf.free_slab(slab)

-- require('completion').on_attach()

-- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- -- Set some keybinds conditional on server capabilities
-- if client.resolved_capabilities.document_formatting then
--     buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- elseif client.resolved_capabilities.document_range_formatting then
--     buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

-- end
--
-- -- new lsp instructions
-- https://alpha2phi.medium.com/neovim-lsp-and-dap-using-lua-3fb24610ac9f
