local plugin = {}

function plugin.load()
  vim.api.nvim_buf_set_keymap(0, "n", "<Tab>", "j", {nowait = true, noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<S-Tab>", "k", {nowait = true, noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<C-n>", "j", {nowait = true, noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<C-p>", "k", {nowait = true, noremap = true, silent = true})
end

function plugin.setup(use)
  use {"matbme/JABS.nvim"}
  plugin.load()
end

return plugin
