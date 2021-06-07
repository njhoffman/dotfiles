-- text
-- map("n", [[<leader>tu]], [[guw]])
-- map("n", [[<leader>tU]], [[gUw]])
-- map("n", "<leader>t,", "A,<ESC>")
-- map("n", "<leader>t;", "A;<ESC>")
-- map("n", "<leader>t:", "A:<ESC>")
local formatters_map = {
  ["<leader>s"] = {
    name = "+surround",
    ["a"] = "add surrounding",
    ["d"] = "delete surrounding",
    ["db"] = "automatically seearch and delete",
    ["r"] = "replace surrounding",
    ["rb"] = "automatically search and select to replace"
  },
  ["<leader>t"] = {
    name = "+text",
    [","] = "add comma to end of line",
    [";"] = "add semicolon to end of line",
    [":"] = "add colon to end of line",
    ["u"] = "lowercase",
    ["U"] = "uppercase",
    ["S"] = "source file"
  }
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(formatters_map, opts)
