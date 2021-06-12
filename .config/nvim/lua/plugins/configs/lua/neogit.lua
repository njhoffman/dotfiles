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
-- Well, when I want to commit, I use :Gstatus and then do a D (so :Gdiff) on all the changed files to check the changes and either stage the whole file or do some tweaking with :diffput/:diffget to only stage the chunks I really want to add to the commit (or I don't stage anything from that file). And when I'm done with that I press C in the status windows and I just have to write my commit message.
-- Of course, when I'm at that point, I either close all my windows but one so I have only view the diff, or open a new tab for that if I don't want to loose my current windows organization.
-- I also like to set git config diff.tool = gvimdiff, then it's easy to go over all the unstaged changed (git difftool) on the commandline using gvimdiff or the differences between two branches (git difftool master mybranch) or commits.
-- It goes over the files one by one, I know there are better tools for this out there, but it's an easy way to go over all the differences between two different versions.
-- Same for solving conflicts with 3-windows diffs, on the left you have one version, on the right, you have the other version and in the center you have the version to be staged. Playing with :diffput/:diffget often makes it quick and painless. Sometimes you have to actually refactor the code in the middle window, but it's so much better to have the conflicting versions on each side of the file you're working on.
-- I think your problems comes from using vim diffs when you already have plenty of splits in a window... that sure isn't a good idea. When you go over changes, you just want the original file next to the changed file and no other distraction (and also a list of the changed files to go over, which you get with :Gstatus). Just close all your splits when the time comes to check on the changes you've done on your project or open a tab just for that.
-- ****
-- eah, Gdiff inside a split is unproductive. :tab sp | Gdiff ought to deal with that.
-- I have vim-gitgutter, so I usually view the file itself and traverse the hunks then stage with <Leader>ha. But Gdiff is useful to me when gitgutter doesn't show enough info in a hunk (such as removed lines).
-- Gdiff also allows finer controls with what lines get staged. The left split is the index (whatever exists there is staged by definition), so I can navigate to some lines in the right split, then do :.diffput to stage a single line or visual select then :'<,'>diffput to stage a region (sky's the limit, Vim's ranges and motions all apply). When I save the buffer in the left split, I'm saving directly into the index, so the lines I did diffput on will get staged as if I ran git add (note that git add -p can't add single lines, or any smaller subset within a hunk for that matter).
