local map = require("utils.core").map
local config = require("config").Opts
local tree_cb = require "nvim-tree.config".nvim_tree_callback

local g = vim.g

g.nvim_tree_side = config.explorer_side
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
g.nvim_tree_width = 40
g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_window_picker_exclude = {
  filetype = {"packer", "qf"},
  buftype = {"terminal"}
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  lsp = {hint = "", info = "", warning = "", error = ""},
  git = {unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★", deleted = "", ignored = "◌"},
  folder = {default = "", open = "", empty = "", empty_open = "", symlink = "", symlink_open = ""}
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

-- require("nvim-tree").on_enter()

require("nvim-tree.events").on_nvim_tree_ready(
  function()
    vim.cmd("NvimTreeRefresh")
  end
)

-- g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
--   folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
-- },
