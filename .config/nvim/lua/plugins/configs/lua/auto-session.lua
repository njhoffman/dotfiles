local opts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil
}
-- {hook_name}_cmds = {"{hook_command1}", "{hook_command2}"}
-- {pre_save}: executes before a session is saved
-- {post_save}: executes after a session is saved
-- {pre_restore}: executs before a session is restored
-- {post_restore}: executs after a session is restored
-- {pre_delete}: executs before a session is deleted
-- {post_delete}: executs after a session is deleted

require("auto-session").setup(opts)

-- :SearchSession

-- :SaveSession " saves or creates a session in the currently set `auto_session_root_dir`.
-- :SaveSession ~/my/custom/path " saves or creates a session in the specified directory path.
-- :RestoreSession " restores a previously saved session based on the `cwd`.
-- :RestoreSession ~/my/custom/path " restores a previously saved session based on the provided path.
-- :DeleteSession " deletes a session in the currently set `auto_session_root_dir`.
-- :DeleteSession ~/my/custom/path " deleetes a session based on the provided path.
