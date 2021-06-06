plugin = {}

function set_config()
  local map = require("utils.core").map
  local config = require("config").Opts
  local tree_cb = require "nvim-tree.config".nvim_tree_callback
  local g = vim.g
  g.nvim_tree_auto_close = 1
  g.nvim_tree_auto_open = 1
  g.nvim_tree_disable_keybindings = 0
  g.nvim_tree_disable_netrw = 1
  g.nvim_tree_follow = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_hijack_netrw = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_lsp_diagnostics = 1
  g.nvim_tree_quit_on_open = 1
  g.nvim_tree_tab_open = 0
  g.nvim_tree_side = config.explorer_side
  g.nvim_tree_auto_ignore_ft = "startify"
  g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
  }

  g.nvim_tree_bindings = {
    -- custom mapping
    ["p"] = tree_cb("preview"),
    ["<Leader>p"] = tree_cb("paste"),
    ["<Leader>d"] = tree_cb("toggle_dotfiles"),
    ["<Leader>i"] = tree_cb("toggle_ignored"),
    -- default mappings
    ["<CR>"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["<C-v>"] = tree_cb("vsplit"),
    ["<C-x>"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["<"] = tree_cb("prev_sibling"),
    [">"] = tree_cb("next_sibling"),
    ["<BS>"] = tree_cb("close_node"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    -- ["I"]              = tree_cb("toggle_ignored"),
    -- ["H"]              = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    -- ["p"]              = tree_cb("paste"),
    ["y"] = tree_cb("copy_name"),
    ["Y"] = tree_cb("copy_path"),
    ["gy"] = tree_cb("copy_absolute_path"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
  }
end

function plugin.load()
  require("nvim-tree").on_enter()
  require("nvim-tree.events").on_nvim_tree_ready(
    function()
      vim.cmd("NvimTreeRefresh")
    end
  )
  set_config()
end

function plugin.setup(use)
  use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = plugin.load}
end

return plugin

-- let g:nvim_tree_side = 'right' "left by default
-- let g:nvim_tree_width = 40 "30 by default
-- let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
-- let g:nvim_tree_gitignore = 1 "0 by default
-- let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
-- let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
-- let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
-- let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
-- let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
-- let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
-- let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
-- let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
-- let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
-- let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
-- let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
-- let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
-- let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
-- let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
-- let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
-- let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
-- let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
-- let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
-- let g:nvim_tree_window_picker_exclude = {
--     \   'filetype': [
--     \     'packer',
--     \     'qf'
--     \   ],
--     \   'buftype': [
--     \     'terminal'
--     \   ]
--     \ }
-- " Dictionary of buffer option names mapped to a list of option values that
-- " indicates to the window picker that the buffer's window should not be
-- " selectable.
-- let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
-- let g:nvim_tree_show_icons = {
--     \ 'git': 1,
--     \ 'folders': 0,
--     \ 'files': 0,
--     \ }
-- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- "1 by default, notice that if 'files' is 1, it will only display
-- "if nvim-web-devicons is installed and on your runtimepath

-- " default will show icon by default if no icon is provided
-- " default shows no icon by default
-- let g:nvim_tree_icons = {
--     \ 'default': '',
--     \ 'symlink': '',
--     \ 'git': {
--     \   'unstaged': "✗",
--     \   'staged': "✓",
--     \   'unmerged': "",
--     \   'renamed': "➜",
--     \   'untracked': "★",
--     \   'deleted': "",
--     \   'ignored': "◌"
--     \   },
--     \ 'folder': {
--     \   'default': "",
--     \   'open': "",
--     \   'empty': "",
--     \   'empty_open': "",
--     \   'symlink': "",
--     \   'symlink_open': "",
--     \   },
--     \   'lsp': {
--     \     'hint': "",
--     \     'info': "",
--     \     'warning': "",
--     \     'error': "",
--     \   }
--     \ }

-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>
-- " NvimTreeOpen and NvimTreeClose are also available if you need them

-- set termguicolors " this variable must be enabled for colors to be applied properly

-- " a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue
