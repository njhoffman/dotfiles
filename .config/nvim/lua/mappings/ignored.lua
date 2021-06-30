-- Ignore{
local ignored_map = {
  ["<leader>cic"] = "which_key_ignore",
  -- ["<leader>ci"] = "which_key_ignore",
  ["<leader>1"] = "which_key_ignore",
  ["<leader>2"] = "which_key_ignore",
  ["<leader>3"] = "which_key_ignore",
  ["<leader>4"] = "which_key_ignore",
  ["<leader>5"] = "which_key_ignore",
  ["<leader>6"] = "which_key_ignore",
  ["<leader>7"] = "which_key_ignore",
  ["<leader>8"] = "which_key_ignore",
  ["<leader>9"] = "which_key_ignore",
  ["<leader>cd"] = "which_key_ignore",
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require("which-key").register(ignored_map, opts)
