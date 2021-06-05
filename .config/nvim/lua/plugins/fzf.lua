local plugin = {}

function set_mappings()
  -- <plug>(fzf-maps-n)	Normal mode mappings
  -- <plug>(fzf-maps-i)	Insert mode mappings
  -- <plug>(fzf-maps-x)	Visual mode mappings
  -- <plug>(fzf-maps-o)	Operator-pending mappings
  -- <plug>(fzf-complete-word)	cat /usr/share/dict/words
  -- <plug>(fzf-complete-path)	Path completion using find (file + dir)
  -- <plug>(fzf-complete-file)	File completion using find
  -- <plug>(fzf-complete-line)	Line completion (all open buffers)
  -- vim.cmd("map <silent> <A-/> :Helptags<CR>")
  -- vim.cmd("map <silent> <A-e> :Sessions<CR>")
  -- vim.cmd("map <silent> <A-j> :FzfPreviewJumpsRpc<CR>")
  -- vim.cmd("map <silent> <A-s> :Rg<CR>")
  -- vim.cmd("map <silent> <A-s> :FzfPreviewProjectGrepRpc<CR>")
  -- vim.cmd('map <silent> <A-v> :Vista!!<CR>')
  -- vim.cmd('map <silent> <A-y> :<C-u>Snippets<CR>')
end

function set_config()
  vim.g.fzf_command_prefix = ""
end

function plugin.load()
  set_config()
  set_mappings()
end

function plugin.setup(use)
  -- switch between single line and multi-line statements
  use {"junegunn/fzf.vim", requires = {"junegunn/fzf", dir = "~/.fzf", run = "./install --all"}}
  plugin.load()
end

return plugin

-- :Files [PATH]	Files (runs $FZF_DEFAULT_COMMAND if defined)
-- :GFiles [OPTS]	Git files (git ls-files)
-- :GFiles?	Git files (git status)
-- :Buffers	Open buffers
-- :Colors	Color schemes
-- :Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
-- :Rg [PATTERN]	rg search result (ALT-A to select all, ALT-D to deselect all)
-- :Lines [QUERY]	Lines in loaded buffers
-- :BLines [QUERY]	Lines in the current buffer
-- :Tags [QUERY]	Tags in the project (ctags -R)
-- :BTags [QUERY]	Tags in the current buffer
-- :Marks	Marks
-- :Windows	Windows
-- :Locate PATTERN	locate command output
-- :History	v:oldfiles and open buffers
-- :History:	Command history
-- :History/	Search history
-- :Snippets	Snippets (UltiSnips)
-- :Commits	Git commits (requires fugitive.vim)
-- :BCommits	Git commits for the current buffer
-- :Commands	Commands
-- :Maps	Normal mode mappings
-- :Helptags	Help tags 1
-- :Filetypes	File types
-- -- <plug>(fzf-complete-buffer-line)	Line completion (current buffer only)
