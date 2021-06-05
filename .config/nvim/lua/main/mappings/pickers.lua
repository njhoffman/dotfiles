local opts = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
}

local picker_maps = {
  ["<C-p>"] = {":<C-u>call GFilesFallback()<CR>", "project files"},
  ["<A-p>"] = {":<C-u>FzfPreviewDirectoryFiles<CR>", "directory files"},
  ["<A-o>"] = {":<C-u>FzfPreviewDirectoryFilesRpc ~<CR>", "home files"},
  ["<C-g>"] = {":<C-u>FzfPreviewGitActionsRpc<CR>", "git actions"},
  ["<A-g>"] = {":<C-u>FzfPreviewGitStatus<CR>", "git status"},
  ["<C-u>"] = {":<C-u>FzfPreviewFromResources old<CR>", "mru files"},
  ["<A-u>"] = {":<C-u>FzfPreviewCommandPaletteRpc<CR>", "commands"},
  ["<C-d>"] = {":<C-u>FzfPreviewGitCurrentLogsRpc<CR>", "git file log"},
  ["<A-d>"] = {":<C-u>FzfPreviewGitLogsRpc<CR>", "git log"},
  ["<C-e>"] = {":<C-u>FzfPreviewAllBuffersRpc<CR>", "buffers"},
  ["<A-e>"] = {":<C-u>Sessions<CR>", "sessions"},
  ["<A-j>"] = {":<C-u>FzfPreviewJumpsRpc<CR>", "jumps"},
  ["<A-/>"] = {":<C-u>Helptags<CR>", "jumps"},
  ["<A-m>"] = {":<C-u>FzfPreviewLocationListRpc<CR>", "location list"},
  -- ["<A-s>"] = {":<C-u>:Rg<CR>", "search (ag)"},
  -- ["<A-s>"] = {":<C-u>:FzfPreviewProjectGrepRpc<CR>", "search (grep)"},
  ["<A-s>"] = {":<C-u>:Ag<CR>", "search (ag)"}
}

require("which-key").register(picker_maps, opts)

-- local telescope_maps = {
-- t = {
-- autocommands
-- buffers
-- colorscheme
-- command_history
-- commands
-- current_buffer_fuzzy_find
-- current_buffer_tags
-- fd
-- file_browser
-- filetypes
-- find_files
-- help_pages
-- highlights
-- keymaps
-- live_grep
-- loclist
-- man_pages
-- marks
-- oldfiles
-- quickfix
-- registers
-- search_history
-- spell_suggest
-- tags
-- vim_options
--
-- lsp_references
-- lsp_document_symbols
-- lsp_worksplace_symbols
-- lsp_dynamic_worksplace_symbols
-- lsp_code_actions
-- lsp_range_code_actions
-- lsp_document_diagnostics
-- lsp_workspace_diagnostics
-- lsp_implementations
-- lsp_definitions
--
-- dap commands
-- dap configurations
-- dap list_breakpoints
-- dap frames
-- dap variaables
--
-- git commits
-- git_bcommits
-- git_branches
-- git_status
-- git_stash
--
-- treesitter
-- builtin
-- reloader
-- }
-- }

-- FzfPreview
-- " fzf-preview.ProjectFiles
-- " fzf-preview.GitFiles
-- " fzf-preview.DirectoryFiles
-- " fzf-preview.Buffers
-- " fzf-preview.AllBuffers
-- " fzf-preview.ProjectOldFiles
-- " fzf-preview.ProjectMruFiles
-- " fzf-preview.ProjectMrwFiles
-- " fzf-preview.ProjectGrep {word}
-- " fzf-preview.Ctags
-- " fzf-preview.BufferTags
-- " fzf-preview.OldFiles
-- " fzf-preview.MruFiles
-- " fzf-preview.MrwFiles
-- " fzf-preview.QuickFix
-- " fzf-preview.LocationList
-- " fzf-preview.Lines
-- " fzf-preview.BufferLines
-- " fzf-preview.Jumps
-- " fzf-preview.Changes
-- " fzf-preview.Marks
-- " fzf-preview.FromResources
--   (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
-- " fzf-preview.CommandPalette
-- " fzf-preview.GitActions
-- " fzf-preview.GitStatus
-- " fzf-preview.VistaCtags
-- " fzf-preview.VistaBufferCtags
-- " fzf-preview.Bookmarks
-- " fzf-preview.Yankround
-- " fzf-preview.BlamePR

-- FZF:
-- Jumps, Registers, Highlights, AsyncTaskFzf, Sessions, Dots
-- " :Files [PATH]	Files (runs $FZF_DEFAULT_COMMAND if defined)
-- " :GFiles [OPTS]	Git files (git ls-files)
-- " :GFiles?	Git files (git status)
-- " :Buffers	Open buffers
-- " :Colors	Color schemes
-- " :Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
-- " :Rg [PATTERN]	rg search result (ALT-A to select all, ALT-D to deselect all)
-- " :Lines [QUERY]	Lines in loaded buffers
-- " :BLines [QUERY]	Lines in the current buffer
-- " :Tags [QUERY]	Tags in the project (ctags -R)
-- " :BTags [QUERY]	Tags in the current buffer
-- " :Marks	Marks
-- " :Windows	Windows
-- " :Locate PATTERN	locate command output
-- " :History	v:oldfiles and open buffers
-- " :History:	Command history
-- " :History/	Search history
-- " :Snippets	Snippets (UltiSnips)
-- " :Commits	Git commits (requires fugitive.vim)
-- " :BCommits	Git commits for the current buffer
-- " :Commands	Commands
-- " :Maps	Normal mode mappings
-- " :Helptags	Help tags 1
-- " :Filetypes	File types

-- Telescope
-- autocommands
-- buffers
-- builtin
-- colorscheme
-- command_history
-- commands
-- current_buffer_fuzzy_find
-- current_buffer_tags,
-- fd
-- file_browser
-- filetypes
-- find_files
-- git_bcommits
-- git_branches
-- git_commits
-- git_files
-- git_stash
-- git_status
-- grep_string,
-- help_tags
-- highlights
-- jumplist
-- keymaps
-- live_grep
-- loclist
-- lsp_code_actions
-- lsp_definitions
-- lsp_document_diagnostics,
-- lsp_document_symbols
-- lsp_dynamic_workspace_symbols
-- lsp_implementations
-- lsp_range_code_actions
-- lsp_references
-- lsp_workspace_diagnostics,
-- lsp_workspace_symbols
-- man_pages
-- marks
-- oldfiles
-- planets
-- quickfix
-- registers
-- reloader
-- search_history
-- spell_suggest
-- symbols
-- tags
-- tagstack
-- treesitter
-- vim_options
