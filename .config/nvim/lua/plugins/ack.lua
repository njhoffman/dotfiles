-- search within files grep-like
local plugin = {}
local map = require("utils.core").map

function set_config()
  -- let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
  vim.g.ackprg = "ag --nogroup --column --vimgrep -S --hidden -u"
  -- Auto close the Quickfix list after pressing '<enter>' on a list item
  vim.g.ack_autoclose = 1
  -- Any empty ack search will search for the work the cursor is on
  vim.g.ack_use_cword_for_empty_search = 1
  -- Don't jump to first match
  -- vim.cmd("cnoreabbrev Ack Ack!")
end

-- gag => searhc selected text
-- gagw => search the word
-- gawi' => search the word in quotes

function plugin.load()
  -- set_config()
  -- set_mapping()
end

function plugin.setup(use)
  use {"Chun-Yang/vim-action-ag", requires = {"mileszs/ack.vim"}, config = plugin.load}
end

return plugin
