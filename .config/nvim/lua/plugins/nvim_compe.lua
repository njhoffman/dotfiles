local config = require("config")

local Completion = config.Completion

local compe_config = {
  enabled = Completion.enabled,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = "always",
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
    nvim_lua = {menu = "[]"},
  },
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
  "   (TypeParameter)",
}

function set_config()
  local u = require("utils.core")
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  vim.o.completeopt = "menuone,noselect"

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

  u.map("i", "<CR>", "compe#confirm('<CR>')")
  u.map("i", "<C-Space>", "compe#complete()")
  u.map("i", "<C-f>", "compe#scroll({ 'delta': +4 })")
  u.map("i", "<C-b>", "compe#scroll({ 'delta': -4 })")

  -- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-l>",
                          [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']],
                          {expr = true})
  vim.api.nvim_set_keymap("s", "<S-l>",
                          [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<S-l>']],
                          {expr = true})
  vim.api.nvim_set_keymap("i", "<S-j>",
                          [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']],
                          {expr = true})
end

local plugin = {}

function plugin.load()
  require("compe").setup(compe_config)
  set_config()
end

function plugin.setup(use)
  use {"hrsh7th/nvim-compe", config = plugin.load}
end

plugin.init = set_config

return plugin

-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })

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
-- vim.api.nvim_set_keymap("s", "<S-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<S-j>']], {expr = true})

-- 6   - /home/nicholas/.local/share/nvim/site/plugged/ack.vim/      │~
--   1 - /home/nicholas/.local/share/nvim/site/plugged/asyncrun.vim/ │~
--   2 - /home/nicholas/.local/share/nvim/site/plugged/asynctasks.vim│~
--   3 - /home/nicholas/.local/share/nvim/site/plugged/bclose.vim/   │~
--   4 - /home/nicholas/.local/share/nvim/site/plugged/bufexplorer/  │~
--   5 - /home/nicholas/.local/share/nvim/site/plugged/bufmru.vim/   │~
--   6 - /home/nicholas/.local/share/nvim/site/plugged/codi.vim/     │~
--   7 - /home/nicholas/.local/share/nvim/site/plugged/editorconfig-v│~
--   8 - /home/nicholas/.local/share/nvim/site/plugged/far.vim/      │~
--   9 - /home/nicholas/.local/share/nvim/site/plugged/fzf-floaterm/ │~
--  10 - /home/nicholas/.local/share/nvim/site/plugged/notifications.│~
--  11 - /home/nicholas/.local/share/nvim/site/plugged/nvim-reload/  │~
--  12 - /home/nicholas/.local/share/nvim/site/plugged/ranger.vim/   │~
--  13 - /home/nicholas/.local/share/nvim/site/plugged/sidepanel.vim/│~
--  14 - /home/nicholas/.local/share/nvim/site/plugged/startuptime.vi│~
--  15 - /home/nicholas/.local/share/nvim/site/plugged/suda.vim/     │~
--  16 - /home/nicholas/.local/share/nvim/site/plugged/ultisnips/    │~
--  17 - /home/nicholas/.local/share/nvim/site/plugged/vim-action-ag/│~
--  18 - /home/nicholas/.local/share/nvim/site/plugged/vim-browser-se│~
--  19 - /home/nicholas/.local/share/nvim/site/plugged/vim-bufmru/   │~
--  20 - /home/nicholas/.local/share/nvim/site/plugged/vim-easyclip/ │~
--  21 - /home/nicholas/.local/share/nvim/site/plugged/vim-endwise/  │~
--  22 - /home/nicholas/.local/share/nvim/site/plugged/vim-es2015-sni│~
--  23 - /home/nicholas/.local/share/nvim/site/plugged/vim-eunuch/   │~
--  24 - /home/nicholas/.local/share/nvim/site/plugged/vim-floaterm-r│~
--  25 - /home/nicholas/.local/share/nvim/site/plugged/vim-floaterm/ │~
--  26 - /home/nicholas/.local/share/nvim/site/plugged/vim-fugitive/ │~
--  27 - /home/nicholas/.local/share/nvim/site/plugged/vim-highlighte│~
--  28 - /home/nicholas/.local/share/nvim/site/plugged/vim-js-arrow-f│~
--  29 - /home/nicholas/.local/share/nvim/site/plugged/vim-matchup/  │~
--  30 - /home/nicholas/.local/share/nvim/site/plugged/vim-node/     │~
--  31 - /home/nicholas/.local/share/nvim/site/plugged/vim-obsession/│~
--  32 - /home/nicholas/.local/share/nvim/site/plugged/vim-over/     │~
--  33 - /home/nicholas/.local/share/nvim/site/plugged/vim-package-js│~
--  34 - /home/nicholas/.local/share/nvim/site/plugged/vim-pasta/    │~
--  35 - /home/nicholas/.local/share/nvim/site/plugged/vim-profiler/ │~
--  36 - /home/nicholas/.local/share/nvim/site/plugged/vim-prosession│~
--  37 - /home/nicholas/.local/share/nvim/site/plugged/vim-qf-preview│~
--  38 - /home/nicholas/.local/share/nvim/site/plugged/vim-qf/       │~
--  39 - /home/nicholas/.local/share/nvim/site/plugged/vim-rabbit-ui/│~
--  40 - /home/nicholas/.local/share/nvim/site/plugged/vim-radical/  │~
--  41 - /home/nicholas/.local/share/nvim/site/plugged/vim-react-snip│~
--  42 - /home/nicholas/.local/share/nvim/site/plugged/vim-renamer/  │~
--  43 - /home/nicholas/.local/share/nvim/site/plugged/vim-repeat/   │~
--  44 - /home/nicholas/.local/share/nvim/site/plugged/vim-ripple/   │~
--  45 - /home/nicholas/.local/share/nvim/site/plugged/vim-rooter/   │~
--  46 - /home/nicholas/.local/share/nvim/site/plugged/vim-sandwich/ │~
--  47 - /home/nicholas/.local/share/nvim/site/plugged/vim-sayonara/ │~
--  48 - /home/nicholas/.local/share/nvim/site/plugged/vim-slime/    │~
--  49 - /home/nicholas/.local/share/nvim/site/plugged/vim-speeddatin│~
--  50 - /home/nicholas/.local/share/nvim/site/plugged/vim-superman/ │~
--  51 - /home/nicholas/.local/share/nvim/site/plugged/vim-table-mode│~
--  52 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux-clipb│~
--  53 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux-navig│~
--  54 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux/     │~
--  55 - /home/nicholas/.local/share/nvim/site/plugged/vim-visual-mul│~
--  56 - /home/nicholas/.local/share/nvim/site/plugged/vim-wakatime/ │~
--  57 - /home/nicholas/.local/share/nvim/site/plugged/vim-wordmotion│~
--  58 - /home/nicholas/.local/share/nvim/site/plugged/vimux/        │~
--  59 - /home/nicholas/.local/share/nvim/site/plugged/vimwiki/      │~
--  60 - /home/nicholas/.local/share/nvim/site/plugged/vista.vim/    │~
--  61 - /home/nicholas/.local/share/nvim/site/plugged/yankround.vim/│~
