local cb = require "diffview.config".diffview_callback

require "diffview".setup {
  diff_binaries = false, -- Show diffs for binaries
  file_panel = {
    width = 40,
    use_icons = true -- Requires nvim-web-devicons
  },
  key_bindings = {
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
      ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files") -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
      ["o"] = cb("select_entry"),
      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files")
    }
  }
}

-- diff_binaries = false,    -- Show diffs for binaries
-- file_panel = {
--   width = 40,
--   use_icons = true        -- Requires nvim-web-devicons
-- },
-- key_bindings = {
--   -- The `view` bindings are active in the diff buffers, only when the current
--   -- tabpage is a Diffview.
--   view = {
--     ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
--     ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
--     ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
--     ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
--   },
--   file_panel = {
--     ["j"]         = cb("next_entry"),         -- Bring the cursor to the next file entry
--     ["<down>"]    = cb("next_entry"),
--     ["k"]         = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
--     ["<up>"]      = cb("prev_entry"),
--     ["<cr>"]      = cb("select_entry"),       -- Open the diff for the selected entry.
--     ["o"]         = cb("select_entry"),
--     ["R"]         = cb("refresh_files"),      -- Update stats and entries in the file list.
--     ["<tab>"]     = cb("select_next_entry"),
--     ["<s-tab>"]   = cb("select_prev_entry"),
--     ["<leader>e"] = cb("focus_files"),
--     ["<leader>b"] = cb("toggle_files"),
--   }
-- }

-- :DiffviewOpen [git rev] [args] [ -- {paths...}]
--[[ Calling :DiffviewOpen with no args opens a new Diffview that compares against HEAD. You can also provide any valid git rev to view only changes for that rev. Examples:

:DiffviewOpen
:DiffviewOpen HEAD~2
:DiffviewOpen HEAD~4..HEAD~2
:DiffviewOpen d4a7b0d
:DiffviewOpen d4a7b0d..519b30e
You can also provide additional paths to narrow down what files are shown:

:DiffviewOpen HEAD~2 -- lua/diffview plugin
For information about additional [args], visit the documentation.

Additional commands for convenience:

:DiffviewClose: Close the current diffview. You can also use :tabclose.
:DiffviewToggleFiles: Toggle the files panel.
:DiffviewFocusFiles: Bring focus to the files panel.
:DiffviewRefresh: Update stats and entries in the file list of the current Diffview.
With a Diffview open and the default key bindings, you can cycle through changed files with <tab> and <s-tab> (see configuration to change the key bindings). ]]
