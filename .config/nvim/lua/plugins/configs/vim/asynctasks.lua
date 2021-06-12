-- ln ~/.vim/bundle/asynctasks.vim/bin/asynctask ~/bin/asynctask

-- :AsyncTask file-build
-- :AsyncTaskEdit(!) to edit (global) files
-- :AsyncTaskList(!)
-- :AsyncTaskMacro to list global macros
-- :AsyncTaskProfile release or  let g:asynctasks_profile = 'release'
-- :AsyncTaskProfile debug release
vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = {".git", ".svn", ".root", ".project", ".hg"}
vim.g.asynctasks_term_pos = "bottom" -- vim, quickfix, tab, top, bottom, left, right, external
vim.g.asynctasks_term_rows = 10 -- set height for the horizontal terminal split
vim.g.asynctasks_term_cols = 80 -- set width for vertical terminal split
vim.g.asynctasks_config_name = ".vimtasks"
vim.g.asynctasks_extra_config = {
  "~/.config/asynctask/shared.ini",
  "~/.config/asynctask/vimtasks.ini"
}
-- The g:asynctasks_term_cols option
-- Internal terminal width when using vertical split.

-- The g:asynctasks_term_rows option
-- Internal terminal height when using horizontal split.

-- The g:asynctasks_term_focus option
-- Set to zero to keep focus when using an internal terminal in a new split.

-- The g:asynctasks_term_reuse option
-- Set to 1 to reuse internal terminal when open it in a new tab.

-- The g:asynctasks_term_hidden option
-- If it is set to 1, the internal terminal buffers will set bufhidden to hide.

-- The g:asynctasks_term_listed option
-- Set to zero to hide terminal buffer from buffer list (set nolisted).

-- The g:asynctasks_confirm option
-- Set to zero to skip filename confirmation in :AsyncTaskEdit.

-- Command :AsyncTaskEdit accept a template file name, the content of template will be used if you are creating a new task config file:
-- The g:asynctasks_template option

-- [*]
-- foo=100
-- [test]
-- let g:asynctasks_environ = {'foo': '100', 'bar': '200' }
-- command=echo foo is $(VIM:foo) !!
