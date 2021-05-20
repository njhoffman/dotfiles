local config = require("config")
local Completion = config.Completion

local plugin = {}

vim.o.completeopt = "menuone,noselect"

local compe_config = {
  enabled = Completion.enabled,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = Completion.path,
    buffer = Completion.buffer,
    calc = Completion.calc,
    vsnip = Completion.snippets,
    nvim_lsp = Completion.lsp,
    spell = Completion.spell,
    emoji = Completion.emoji,
    nvim_lua = {menu = "[]"}
  }
}

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

function init_mapping()
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

  -- u.map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
  -- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-l>", [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']], {expr = true})
  vim.api.nvim_set_keymap("s", "<S-l>", [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']], {expr = true})
  vim.api.nvim_set_keymap("i", "<S-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']], {expr = true})
end

-- " inoremap <silent><expr> <C-Space> compe#complete()
-- " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

-- " let g:compe = {}
-- " let g:compe.enabled = v:true
-- " let g:compe.autocomplete = v:true
-- " let g:compe.debug = v:false
-- " let g:compe.min_length = 1
-- " let g:compe.preselect = 'enable'
-- " let g:compe.throttle_time = 80
-- " let g:compe.source_timeout = 200
-- " let g:compe.incomplete_delay = 400
-- " let g:compe.max_abbr_width = 100
-- " let g:compe.max_kind_width = 100
-- " let g:compe.max_menu_width = 100
-- " let g:compe.documentation = v:true
-- "
-- " let g:compe.source = {}
-- " let g:compe.source.path = v:true
-- " let g:compe.source.buffer = v:true
-- " let g:compe.source.calc = v:true
-- " let g:compe.source.nvim_lsp = v:true
-- " let g:compe.source.nvim_lua = v:true
-- " let g:compe.source.vsnip = v:true
-- " let g:compe.source.ultisnips = v:true

-- set completeopt=menuone,noselect
-- "
-- vim.api.nvim_set_keymap("s", "<S-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']], {expr = true})

function plugin.setup(use)
  use 'hrsh7th/nvim-compe'
  require('compe').setup(compe_config)
  init_mapping()
end

return plugin
