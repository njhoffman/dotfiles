local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = {">", "v"},
    item = {">", "v"},
    hunk = {"", ""}
  },
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use {
    --   'TimUntersberger/neogit',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim'
    --   }
    -- }
    --
    diffview = false
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = ""
    }
  }
}

-- :Neogit " uses tab
-- :Neogit kind=<kind> " override kind
-- :Neogit commit" open commit popup
-- local neogit = require('neogit')
-- -- open using defaults
-- neogit.open()
-- -- open commit popup
-- neogit.open({ "commit" })
-- -- open with split kind
-- neogit.open({ kind = "split" })
--
-- Status Keybindings
-- Keybinding	Function
-- Tab	Toggle diff
-- 1, 2, 3, 4	Set a foldlevel
-- $	Command history
-- b	Branch popup
-- s	Stage (also supports staging selection/hunk)
-- S	Stage unstaged changes
-- <C-s>	Stage Everything
-- u	Unstage (also supports staging selection/hunk)
-- U	Unstage staged changes
-- c	Open commit popup
-- L	Open log popup
-- p	Open pull popup
-- P	Open push popup
-- Z	Open stash popup
-- ?	Open help popup
-- x	Discard changes (also supports discarding hunks)
-- <enter>	Go to file
-- <C-r>	Refresh Buffer
-- With diffview integration enabled
-- Keybinding	Function
-- d	Open diffview.nvim at hovered file
-- D (TODO)	Open diff popup
-- List of status commands:

-- Close
-- Depth1 (Set foldlevel to 1)
-- Depth2 (Set foldlevel to 2)
-- Depth3 (Set foldlevel to 3)
-- Depth4 (Set foldlevel to 4)
-- Toggle
-- Discard (Normal and visual mode)
-- Stage (Normal and visual mode)
-- StageUnstaged
-- StageAll
-- GoToFile
-- Unstage (Normal and visual mode)
-- UnstageStaged
-- CommandHistory
-- RefreshBuffer
-- HelpPopup
-- PullPopup
-- PushPopup
-- CommitPopup
-- LogPopup
-- StashPopup
-- BranchPopup

-- TODO: load env for git functionality with cd hook
-- GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME [n]vim
-- git --git-dir=$HOME/.cfg --work-tree=$HOME config --local core.worktree $HOME
