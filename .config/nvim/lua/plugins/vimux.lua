local plugin = {}

function plugin.load()
  -- echo g:VimuxRunnerIndex
  -- TODO: style tmux pane when controlled, add vim status section
  vim.g.VimuxHeight = 30
  vim.g.VimuxUseNearest = 1
  vim.g.VimuxResetSequence = "q C-u"
  vim.g.VimuxPromptString = ""
  vim.g.VimuxRunnerType = "pane" -- pane, window
  vim.g.VimuxRunnerName = "vimuxout"
  -- let g:VimuxTmuxCommand = "tmate"
  vim.g.VimuxTmuxCommand = "tmux"
  vim.g.VimuxCommandShell = 1 -- shell completion
  vim.g.VimuxCloseOnExit = 0
  -- vim.g.OpenextraArgs = "-c #{pane_current_path}"

  -- Run the current file with rspec
  -- map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

  -- Prompt for a command to run
  -- map <Leader>vp :VimuxPromptCommand<CR>

  -- Run last command executed by VimuxRunCommand
  -- map <Leader>vl :VimuxRunLastCommand<CR>

  -- Inspect runner pane
  -- map <Leader>vi :VimuxInspectRunner<CR>

  -- Close vim tmux runner opened by VimuxRunCommand
  -- map <Leader>vq :VimuxCloseRunner<CR>

  -- Interrupt any command running in the runner pane
  -- map <Leader>vx :VimuxInterruptRunner<CR>

  -- Zoom the runner pane (use <bind-key> z to restore runner pane)
  -- map <Leader>vz :call VimuxZoomRunner()<CR>

  -- Clear the terminal screen of the runner pane.
  -- map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>
end

function plugin.setup(use)
  use {"preservim/vimux", config = plugin.load}
end

return plugin

-- *VimuxRunCommand*
-- VimuxRunCommand~

-- Run a system command in a small horizontal split bellow
-- the current pane vim is in. You can optionally pass a second argument to stop
-- vimux from automatically sending a return after the command.
-- >
-- " Run the current file with rspec
-- map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
-- " Run command without sending a return
-- map <Leader>rq :call VimuxRunCommand("clear; rspec " . bufname("%"), 0)<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxSendText*
-- VimuxSendText~

-- Send raw text to the runner pane. This command will not open a new pane if one
-- does not already exist. You will need to use |VimuxOpenRunner| to do this. This
-- command can be used to interact with REPLs or other interactive terminal
-- programs that are not shells.

-- ------------------------------------------------------------------------------
-- *VimuxSendKeys*
-- VimuxSendKeys~

-- Send keys to the runner pane. This command will not open a new pane if one
-- does not already exist. You will need to use |VimuxOpenRunner| to do this. You
-- can use this command to send keys such as "Enter" or "C-c" to the runner pane.

-- ------------------------------------------------------------------------------
-- *VimuxOpenRunner*
-- VimuxOpenRunner~

-- This will either open a new pane or use the nearest pane and set it as the
-- vimux runner pane for the other vimux commands. You can control if this command
-- uses the nearest pane or always creates a new one with g:|VimuxUseNearest|

-- ------------------------------------------------------------------------------
-- *VimuxPromptCommand*
-- VimuxPromptCommand~

-- Prompt for a command and run it in a small horizontal split bellow the current
-- pane. A parameter can be supplied to predefine a command or a part of the
-- command which can be edited in the prompt.
-- >
-- " Prompt for a command to run map
-- map <Leader>vp :VimuxPromptCommand<CR>
-- map <Leader>vm :VimuxPromptCommand("make ")<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxRunLastCommand*
-- VimuxRunLastCommand~

-- Run the last command executed by `VimuxRunCommand`
-- >
-- " Run last command executed by VimuxRunCommand
-- map <Leader>vl :VimuxRunLastCommand<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxInspectRunner*
-- VimuxInspectRunner~

-- Move into the tmux runner pane created by `VimuxRunCommand` and enter copy
-- pmode (scroll mode).
-- >
-- " Inspect runner pane map
-- map <Leader>vi :VimuxInspectRunner<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxCloseRunner*
-- VimuxCloseRunner~

-- Close the tmux runner created by `VimuxRunCommand`
-- >
-- " Close vim tmux runner opened by VimuxRunCommand
-- map <Leader>vq :VimuxCloseRunner<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxInterruptRunner*
-- VimuxInterruptRunner~

-- Interrupt any command that is running inside the
-- runner pane.
-- >
-- " Interrupt any command running in the runner pane map
-- map <Leader>vs :VimuxInterruptRunner<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxClearTerminalScreen*
-- VimuxClearTerminalScreen~

-- Clear the terminal screen of the runner pane.
-- >
-- " Clear the terminal screen of the runner pane.
-- map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxClearRunnerHistory*
-- VimuxClearRunnerHistory~

-- Clear the tmux history of the runner pane for when
-- you enter tmux scroll mode inside the runner pane.
-- >
-- " Clear the tmux history of the runner pane
-- map <Leader>vc :VimuxClearRunnerHistory<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxZoomRunner*
-- VimuxZoomRunner~

-- Zoom the runner pane. Once its zoomed, you will need
-- to use tmux "<bind-key> z" to restore the runner pane.
-- Zoom requires tmux version >= 1.8
-- >

-- " Zoom the tmux runner page
-- map <Leader>vz :VimuxZoomRunner<CR>
-- <

-- ------------------------------------------------------------------------------
-- *VimuxRunCommandInDir*
-- VimuxRunCommandInDir~

-- Runs the specified command inside the directory of
-- the currently opened file. Takes two arguments. command and inFile

-- command: The command to run
-- inFile: If 1 the filename will be appended to the command
-- >

-- " Compile currently opened latex file to pdf
-- autocmd Filetype tex nnoremap <buffer> <Leader>rr :update<Bar>:call VimuxRunCommandInDir('latexmk -pdf', 1)<CR>
-- " Push the repository of the currently opened file
-- nnoremap <leader>gp :call VimuxRunCommandInDir("git push", 0)<CR>
-- <

-- ==============================================================================
-- MISC (3)                                                             *VimuxMisc*

-- ------------------------------------------------------------------------------
-- *VimuxExampleKeybinding*
-- Full Keybind Example~

-- >
-- " Run the current file with rspec
-- map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

-- " Prompt for a command to run
-- map <Leader>vp :VimuxPromptCommand<CR>

-- " Run last command executed by VimuxRunCommand
-- map <Leader>vl :VimuxRunLastCommand<CR>

-- " Inspect runner pane
-- map <Leader>vi :VimuxInspectRunner<CR>

-- " Close vim tmux runner opened by VimuxRunCommand
-- map <Leader>vq :VimuxCloseRunner<CR>

-- " Interrupt any command running in the runner pane
-- map <Leader>vx :VimuxInterruptRunner<CR>

-- " Zoom the runner pane (use <bind-key> z to restore runner pane)
-- map <Leader>vz :call VimuxZoomRunner()<CR>

-- " Clear the terminal screen of the runner pane.
-- map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>
-- >

-- ------------------------------------------------------------------------------
-- *VimuxTslimeReplacement*
-- Vimux as tslime replacement~

-- Here is how to use vimux to send code to a REPL. This is similar to tslime.
-- First, add some helpful mappings.

-- >
-- function! VimuxSlime()
-- call VimuxRunCommand(@v, 0)
-- endfunction

-- " If text is selected, save it in the v buffer and send that buffer it to tmux
-- vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

-- " Select current paragraph and send it to tmux
-- nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
-- <

-- Now, open a clojure file. Let's say your leader is backslash (\). Type \vp,
-- and then type lein repl at the prompt. This opens a tmux split running a REPL.
-- Then, select text or put the cursor on a function and type \vs. This will send
-- it to the REPL and evaluate it. The reason we pass `0` to `VimuxRunCommand`
-- is to stop the normal return that is sent to the runner pane and use our own
-- new line so the clojure REPL will evaluate the selected text without adding an
-- extra return. Thanks to @trptcolin for discovering this issue.

-- ==============================================================================
-- CONFIGURATION (4)                                           *VimuxConfiguration*

-- You can configure Vimux as follows. Note that all occurances of global
-- variables `g:Vimux...` may also be set using buffer variables `b:Vimux...` to
-- change the behavior of Vimux in just the current buffer.

-- ------------------------------------------------------------------------------
