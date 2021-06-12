vim.g.ripple_enable_mappings = 1

-- <Plug> Mapping	Default key mapping	Description
-- <Plug>(ripple_open_repl)	y<cr> (nmap)	Open REPL
-- <Plug>(ripple_send_motion)	yr (nmap)	Send motion to REPL
-- <Plug>(ripple_send_previous)	yp (nmap)	Resend previous code selection
-- <Plug>(ripple_send_selection)	R (xmap)	Send selection to REPL
-- <Plug>(ripple_send_line)	yrr (nmap)	Send line to REPL
-- <Plug>(ripple_send_buffer)	yr<cr> (nmap)	Send whole buffer to REPL

vim.g.default_repls = {
  python = {"ipython", "\\<c-u>\\<esc>[200~", "\\<esc>[201~", 1},
  julia = "julia",
  lua = "lua",
  r = "R",
  ruby = "irb",
  scheme = "guile",
  sh = "bash",
  zsh = {"zsh", "", "", 0, vim.fn.Remove_comments}
}
