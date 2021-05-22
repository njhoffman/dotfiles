
-- search within files grep-like

local plugin = {}


function plugin.config()
  -- let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'
  -- hi! IncSearch      xxx cterm=reverse gui=reverse
  -- hi! Search         xxx ctermfg=0 ctermbg=11 guifg=#afffff
  -- hi! EasyMotionIncSearchDefault xxx cterm=bold ctermfg=40 gui=bold guifg=#7fbf00
  -- Use ripgrep for searching ⚡️
  -- Options include:
  -- --vimgrep -> Needed to parse the rg response properly for ack.vim
  -- --type-not sql -> Avoid huge sql file dumps as it slows down the search
  -- --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
  -- let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
  vim.g.ackprg = 'ag --nogroup --column --vimgrep -S --hidden -u'
  -- Auto close the Quickfix list after pressing '<enter>' on a list item
  vim.g.ack_autoclose = 1
  -- Any empty ack search will search for the work the cursor is on
  vim.g.ack_use_cword_for_empty_search = 1
  -- Don't jump to first match
  vim.cmd('cnoreabbrev Ack Ack!')
end

function plugin.mapping()
  -- Maps <leader>/ so we're ready to type the search keyword
  -- nnoremap <Leader>/ :Ack!<Space>
  -- }}}

  -- Navigate quickfix list with ease
  -- nnoremap <silent> [q :cprevious<CR>
  -- nnoremap <silent> ]q :cnext<CR>
  -- gag => searhc selected text
  -- gagw => search the word
  -- gawi' => search the word in quotes

  -- nmap * <Plug>AgActionWord => use * to search current word in normal mode
  -- vmap * <Plug>AgActionVisual => use * to search selected text in visual mode
end

function plugin.load()
  plugin.config()
  plugin.mapping()
end

function plugin.setup(use)
  use {
    'Chun-Yang/vim-action-ag',
    requires = { 'mileszs/ack.vim' },
    config = plugin.load
  }
end

return plugin
