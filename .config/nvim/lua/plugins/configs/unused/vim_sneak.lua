local plugin = {}

-- Sneak is invoked with s followed by exactly two characters:
-- s{char}{char}
-- Type sab to move the cursor immediately to the next instance of the text "ab".
-- Additional matches, if any, are highlighted until the cursor is moved.
-- Type ; to go to the next match (or s again, if s_next is enabled; see :help sneak).
-- Type 3; to skip to the third match from the current position.
-- Type ctrl-o or `` to go back to the starting point.
-- This is a built-in Vim motion; Sneak adds to Vim's jumplist only on s invocation—not repeats—so you can abandon a trail of ; or , by a single ctrl-o or ``.
-- Type s<Enter> at any time to repeat the last Sneak-search.
-- Type S to search backwards.
-- Sneak can be limited to a vertical scope by prefixing s with a count.

-- Type 5sxy to go immediately to the next instance of "xy" within 5 columns of the cursor.
-- Sneak is invoked with operators via z (because s is taken by surround.vim).

-- Type 3dzqt to delete up to the third instance of "qt".
-- Type . to repeat the 3dzqt operation.
-- Type 2. to repeat twice.
-- Type d; to delete up to the next match.
-- Type 4d; to delete up to the fourth next match.
-- Type yszxy] to surround in brackets up to xy.
-- Type . to repeat the surround operation.
-- Type gUz\} to upper-case the text from the cursor until the next instance of the literal text \}
-- Type . to repeat the gUz\} operation.

function set_mapping()
  -- 2-character Sneak (default)
  vim.cmd([[nmap ? <Plug>Sneak_s]])
  vim.cmd([[nmap ? <Plug>Sneak_S]])
  -- visual-mode
  vim.cmd([[xmap ? <Plug>Sneak_s]])
  vim.cmd([[xmap ? <Plug>Sneak_S]])
  -- operator-pending-mode
  vim.cmd([[omap ? <Plug>Sneak_s]])
  vim.cmd([[omap ? <Plug>Sneak_S]])

  -- repeat motion
  vim.cmd([[map ? <Plug>Sneak_;]])
  vim.cmd([[map ? <Plug>Sneak_,]])

  -- 1-character enhanced 'f'
  vim.cmd([[nmap ? <Plug>Sneak_f]])
  vim.cmd([[nmap ? <Plug>Sneak_F]])
  -- visual-mode
  vim.cmd([[xmap ? <Plug>Sneak_f]])
  vim.cmd([[xmap ? <Plug>Sneak_F]])
  -- operator-pending-mode
  vim.cmd([[omap ? <Plug>Sneak_f]])
  vim.cmd([[omap ? <Plug>Sneak_F]])

  -- 1-character enhanced 't'
  vim.cmd([[nmap ? <Plug>Sneak_t]])
  vim.cmd([[nmap ? <Plug>Sneak_T]])
  -- visual-mode
  vim.cmd([[xmap ? <Plug>Sneak_t]])
  vim.cmd([[xmap ? <Plug>Sneak_T]])
  -- operator-pending-mode
  vim.cmd([[omap ? <Plug>Sneak_t]])
  vim.cmd([[omap ? <Plug>Sneak_T]])

  -- label-mode
  vim.cmd([[nmap ? <Plug>SneakLabel_s]])
  vim.cmd([[nmap ? <Plug>SneakLabel_S]])

  -- TODO: figure out right way to unmap these keys
  -- vim.cmd([[unmap s]])
  -- vim.cmd([[unmap S]])
  -- vim.cmd([[unmap ?]])
  -- vim.cmd([[unmap ;]])
  -- vim.cmd([[unmap \]])
  --
  -- vim.api.nvim_set_keymap("n", "f", "<Plug>Sneak_f", {noremap = false, silent = false})
  -- vim.api.nvim_set_keymap("n", "F", "<Plug>Sneak_F", {noremap = false, silent = false})
  -- vim.api.nvim_set_keymap("n", "t", "<Plug>Sneak_t", {noremap = false, silent = false})
  -- vim.api.nvim_set_keymap("n", "T", "<Plug>Sneak_T", {noremap = false, silent = false})
end

function plugin.setup(use)
  use {"justinmk/vim-sneak"} --, config = set_mapping}
  set_mapping()
end

return plugin
