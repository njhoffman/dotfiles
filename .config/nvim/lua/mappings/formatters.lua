-- text
-- map("n", [[<leader>tu]], [[guw]])
-- map("n", [[<leader>tU]], [[gUw]])
-- map("n", "<leader>t,", "A,<ESC>")
-- map("n", "<leader>t;", "A;<ESC>")
-- map("n", "<leader>t:", "A:<ESC>")
-- yoinks
-- Change current yank and see a preview of it in the status bar
-- nmap [y <plug>(YoinkRotateBack)
-- nmap ]y <plug>(YoinkRotateForward)
-- nmap <c-n> <plug>(YoinkPostPasteSwapBack)
-- nmap <c-p> <plug>(YoinkPostPasteSwapForward)
-- nmap p <plug>(YoinkPaste_p)
-- nmap P <plug>(YoinkPaste_P)
-- " Also replace the default gp with yoink paste so we can toggle paste in this case too
-- nmap gp <plug>(YoinkPaste_gp)
-- nmap gP <plug>(YoinkPaste_gP)
-- You might also want to add a map for toggling whether the current paste is formatted or not:
-- nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
-- Now, hitting <c-=> after a paste will toggle between formatted and unformatted (equivalent to using the = key). By default pastes will not be formatted until you toggle it afterwards using <c-=> (however you can also change this with the yoinkAutoFormatPaste setting as described below)
-- Finally, you can also optionally add the following map:
-- nmap y <plug>(YoinkYankPreserveCursorPosition)
-- xmap y <plug>(YoinkYankPreserveCursorPosition)
--
-- I want to use the same binding for paste to trigger the swap afterwards
-- Try adding this to your .vimrc:
-- nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
-- nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
local formatters_map = {
  ["<leader>s"] = {
    name = "+surround",
    ["a"] = "add surrounding",
    ["bd"] = "automatically seearch and delete",
    ["br"] = "automatically search and select to replace",
    ["d"] = "delete surrounding",
    ["r"] = "replace surrounding",
  },
  ["<leader>t"] = {
    name = "+text",
    [","] = "add comma to end of line",
    [";"] = "add semicolon to end of line",
    [":"] = "add colon to end of line",
    ["u"] = "lowercase",
    ["U"] = "uppercase",
    ["S"] = "source file",
  },
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require("which-key").register(formatters_map, opts)
