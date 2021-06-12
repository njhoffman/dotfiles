vim.g.fzf_command_prefix = ""

-- vim.cmd([[let g:fzf_action = {  'ctrl-q': function('build_quickfix_list'), 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }]])
vim.cmd([[let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }]])

-- Customize fzf colors to match your color scheme
vim.g.fzf_colors = {
  fg = {"fg", "Normal"},
  bg = {"bg", "Normal"},
  hl = {"fg", "Comment"},
  ["fg+"] = {"fg", "CursorLine", "CursorColumn", "Normal"},
  ["bg+"] = {"bg", "CursorLine", "CursorColumn"},
  ["hl+"] = {"fg", "Statement"},
  info = {"fg", "PreProc"},
  border = {"fg", "Comment"},
  prompt = {"fg", "Conditional"},
  pointer = {"fg", "Exception"},
  marker = {"fg", "Keyword"},
  spinner = {"fg", "Label"},
  header = {"fg", "Comment"}
}

-- [Buffers] Jump to the existing window if possible
vim.g.fzf_buffers_jump = 1

-- [B]Commits] Customize the options used by 'git log':
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

-- [Tags] Command to generate tags file
-- let g:fzf_tags_command = 'ctags -R'

-- [Commands] --expect expression for directly executing the command
vim.g.fzf_commands_expect = "alt-enter,ctrl-x"

-- Enable per-command history.
vim.g.fzf_history_dir = "~/.local/share/fzf-history"

-- let s:fzf_color = '--color="bg:#000000,bg+:#002222,border:#006B6B,spinner:#98BC99,header:#55FFFF" '

-- switch between single line and multi-line statements

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
