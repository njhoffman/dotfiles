-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  " ﬌  (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

function set_config()
  vim.g.loaded_compe_treesitter = true
  vim.g.loaded_compe_snippets_nvim = true
  vim.g.loaded_compe_spell = true
  vim.g.loaded_compe_tags = true
  vim.g.loaded_compe_ultisnips = true
  vim.g.loaded_compe_vim_lsc = true
  vim.g.loaded_compe_vim_lsp = true
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

function set_mapping()
  local map = require("utils.core").map
  local opts = {noremap = true, silent = true, expr = true}
  -- map("i", "<C-Space>", [[compe#complete()]], opts)
  map("i", "<C-c>", [[compe#complete()]], opts)
  map("i", "<CR>", [[compe#confirm('<cr>')]], opts)
  map("i", "<C-e>", [[compe#close('<c-e>')]], opts)
  map("i", "<C-f>", "[[compe#scroll({ 'delta': +4 })]]", opts)
  map("i", "<C-b>", "[[compe#scroll({ 'delta': -4 })]]", opts)

  -- u.map("i", "<CR>", "compe#confirm('<CR>')")

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  -- set completeopt=menuone,noselect
  -- vim.api.nvim_set_keymap("s", "<S-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']], {expr = true})
  -- vim.api.nvim_set_keymap("i", "<S-l>",
  --                         [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']],
  --                         {expr = true})
  -- vim.api.nvim_set_keymap("s", "<S-l>",
  --                         [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']],
  --                         {expr = true})
  -- vim.api.nvim_set_keymap("i", "<S-j>",
  --                         [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']],
  --                         {expr = true})
end

local plugin = {}

function plugin.load()
  local config = require "config".Completion

  require("compe").setup {
    enabled = config.enabled,
    autocomplete = true,
    debug = false,
    min_length = 2,
    preselect = "enable", -- enable, always
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = config.path,
      buffer = config.buffer,
      calc = config.calc,
      vsnip = config.snippets,
      nvim_lsp = config.lsp,
      spell = config.spell,
      emoji = config.emoji,
      nvim_lua = {menu = "[]"}
    }
  }

  set_config()
  set_mapping()
end

-- local map = require('config.utils').map
-- local opts = {noremap = false, expr = true}
-- map('i', '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], opts)
-- map('s', '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], opts)
-- map('i', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)
-- map('s', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)

function plugin.setup(use)
  use {"hrsh7th/nvim-compe", config = plugin.load, event = "InsertEnter *"}
end

return plugin
