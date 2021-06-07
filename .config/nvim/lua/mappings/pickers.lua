local unused_alternates = {
  ["<A-s>"] = {":<C-u>:Rg<CR>", "search (ag)"}
  -- ["<A-s>"] = {":<C-u>:FzfPreviewProjectGrepRpc<CR>", "search (grep)"}
}
--     name = "find",
--         a = "code actions",
--         b = "buffers",
-- 		c = "in current buffer",
--         f = "files",
--         g = "grep files",
--         h = "help",
-- 		o = "options",
--         m = "manual pages",
--         r = "recent files",
--         s = "settings",
--         t = "colorschemes"
--     }
-- }, { prefix = "<leader>" })

-- -- Directory
-- wk.register({
--     d = {
--         name = "directory",
--         a = "add directory",
--         l = "list directories",
--         r = "remove directory",
--     }
-- }, { prefix = "<leader>" })

-- -- Window
-- wk.register({
--     w = {
--         name = "window",
--         v = "vertical split",
--         s = "horizontal split",
--         t = "tab split",
--         r = "rotate",
--         l = "load session",
--         a = "archive session"
--     }
-- -- Mappings.
-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap("n", "<C-p>", ":lua FindFile()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>ff", ":lua FindBuffer()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>fg", ":lua FindString()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>fl", ":lua FindLive()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>fd", ":lua FindDot()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>fb", ":lua FindGit()<CR>", {silent = true, noremap = true})
--  telescope mappings
--  nnoremap <leader><space> :Telescope git_files<CR>
--  nnoremap <leader>ff :Telescope live_grep<CR>
--  nnoremap <leader>FF :Telescope find_files<CR>
--  nnoremap <leader>fg :Telescope git_branches<CR>

local picker_maps = {
  ["<C-p>"] = {"<cmd>call GFilesFallback()<cr>", "project files"},
  ["<A-p>"] = {"<cmd>FzfPreviewDirectoryFiles<cr>", "directory files"},
  ["<A-o>"] = {"<cmd>FzfPreviewDirectoryFilesRpc ~<cr>", "home files"},
  ["<C-g>"] = {"<cmd>FzfPreviewGitActionsRpc<cr>", "git actions"},
  ["<A-g>"] = {"<cmd>FzfPreviewGitStatus<cr>", "git status"},
  ["<C-u>"] = {"<cmd>FzfPreviewFromResources old<cr>", "mru files"},
  ["<A-u>"] = {"<cmd>FzfPreviewCommandPaletteRpc<cr>", "commands"},
  ["<C-d>"] = {"<cmd>FzfPreviewGitCurrentLogsRpc<cr>", "git file log"},
  ["<A-d>"] = {"<cmd>FzfPreviewGitLogsRpc<cr>", "git log"},
  ["<C-e>"] = {"<cmd>FzfPreviewAllBuffersRpc<cr>", "buffers"},
  ["<A-e>"] = {"<cmd>Sessions<cr>", "sessions"},
  ["<A-j>"] = {"<cmd>FzfPreviewJumpsRpc<cr>", "jumps"},
  ["<A-/>"] = {"<cmd>Helptags<cr>", "jumps"},
  ["<A-m>"] = {"<cmd>FzfPreviewLocationListRpc<cr>", "location list"},
  ["<A-s>"] = {"<cmd>Ag<cr>", "search (ag)"},
  ["<leader>f"] = {
    name = "+find",
    ["b"] = {"<cmd>FindBuffer<cr>", "Find buffer"},
    c = {"<cmd>Telescope colorscheme<cr>", "colorscheme"},
    f = {"<cmd>Telescope find_files<cr>", "file"},
    g = {"<cmd>Telescope live_grep<cr>", "grep text"},
    h = {"<cmd>Telescope help_tags<cr>", "vim tags"},
    n = {"<cmd>lua require('utils.core').search_nvim()<cr>", "nvim dotfiles"},
    o = {"<cmd>Telescope oldfiles<cr>", "recent files"},
    m = {"<plug>(fzf-maps-n)", "mappings (normal)"},
    mi = {"<plug>(fzf-maps-i)", "mappings (insert)"},
    mv = {"<plug>(fzf-maps-v)", "mappings (visual)"},
    mo = {"<plug>(fzf-maps-o)", "mappings (operator)"},
    p = "personal config",
    pn = {"<cmd>e ~/.config/nvim/lua/config.lua<cr>", "nvim"},
    ps = {"<cmd>e ~/.shell/.zshrc<cr>", "shell"}
  }
}

local opts = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
}

require("which-key").register(picker_maps, opts)

-- map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
-- map("n", "<leader>b", ":Telescope buffers show_all=true sort_lastued=true<CR>")

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
