local plugin = {}
local map = require("utils.core").map

-- g<C-n>

function plugin.load()
  vim.g.multi_cursor_use_default_mapping = 0
  vim.g.multi_cursor_start_word_key = "<C-n>"
  vim.g.multi_cursor_select_all_word_key = "<A-n>"
  vim.g.multi_cursor_start_key = "g<C-n>"
  vim.g.multi_cursor_select_all_key = "g<A-n>"
  vim.g.multi_cursor_next_key = "<C-n>"
  vim.g.multi_cursor_prev_key = "<C-p>"
  vim.g.multi_cursor_skip_key = "<C-x>"
  vim.g.multi_cursor_quit_key = "<Esc>"
end

function plugin.setup(use)
  use {"terryma/vim-multiple-cursors", config = plugin.load}
end

return plugin

--[[ g:multi_cursor_support_imap (Default: 1)
If set to 0, insert mappings won't be supported in Insert mode anymore.

g:multi_cursor_exit_from_visual_mode (Default: 0)
If set to 1, then pressing g:multi_cursor_quit_key in Visual mode will quit and delete all existing cursors, just skipping normal mode with multiple cursors.

g:multi_cursor_exit_from_insert_mode (Default: 0)
If set to 1, then pressing g:multi_cursor_quit_key in Insert mode will quit and delete all existing cursors, just skipping normal mode with multiple cursors.

g:multi_cursor_normal_maps (Default: see below)
{'@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, '!': 1, '"': 1, 'c': 1, 'd': 1, 'f': 1, 'g': 1, 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, '<': 1, '=': 1, '>': 1} ]]

-- Any key in this map (values are ignored) will cause multi-cursor Normal mode to pause for map completion just like normal vim. Otherwise keys mapped in normal mode will "fail to replay" when multiple cursors are active. For example: {'d':1} makes normal-mode command dw work in multi-cursor mode.
-- The default list contents should work for anybody, unless they have remapped a key from an operator-pending command to a non-operator-pending command or vice versa.
-- These keys must be manually listed because vim doesn't provide a way to automatically see which keys start mappings, and trying to run motion commands such as j as if they were operator-pending commands can break things.
-- g:multi_cursor_visual_maps (Default: see below)
-- {'T': 1, 'a': 1, 't': 1, 'F': 1, 'f': 1, 'i': 1}
-- Same principle as g:multi_cursor_normal_maps

-- Interactions with other plugins
-- Multiple_cursors_before/Multiple_cursors_after (Default: nothing)
-- Other plugins may be incompatible in insert mode. That is why we provide hooks to disable those plug-ins when vim-multiple-cursors is active:
-- For example, if you are using Neocomplete, add this to your vimrc to prevent conflict:
-- function! Multiple_cursors_before()
--   if exists(':NeoCompleteLock')==2
--     exe 'NeoCompleteLock'
--   endif
-- endfunction

-- function! Multiple_cursors_after()
--   if exists(':NeoCompleteUnlock')==2
--     exe 'NeoCompleteUnlock'
--   endif
-- endfunction
-- Plugins themselves can register User autocommands on MultipleCursorsPre and MultipleCursorsPost for automatic integration.
-- Highlight
-- The plugin uses the highlight group multiple_cursors_cursor and multiple_cursors_visual to highlight the virtual cursors and their visual selections respectively. You can customize them by putting something similar like the following in your vimrc:
-- " Default highlighting (see help :highlight and help :highlight-link)
-- highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
-- highlight link multiple_cursors_visual Visual

-- start: <C-n> start multicursor and add a virtual cursor + selection on the match
-- next: <C-n> add a new virtual cursor + selection on the next match
-- skip: <C-x> skip the next match
-- prev: <C-p> remove current virtual cursor + selection and go back on previous match
-- select all: <A-n> start multicursor and directly select all matches
-- You can now change the virtual cursors + selection with visual mode commands. For instance: c, s, I, A work without any issues. You could also go to normal mode by pressing v and use normal commands there.

-- At any time, you can press <Esc> to exit back to regular Vim.

-- NOTE: start with g<C-n> to match without boundaries (behaves like g* instead of *)

-- visual mode when multiple lines are selected
-- start: <C-n> add virtual cursors on each line
-- You can now change the virtual cursors with normal mode commands. For instance: ciw.

-- command
-- The command MultipleCursorsFind accepts a range and a pattern (regexp), it creates a visual cursor at the end of each match. If no range is passed in, then it defaults to the entire buffer.
