-- delete / yank/ change  - inner/outer - word function class
-- helps facilitate easy text object pasting from changed/deleted text
require("anywise_reg").setup({
  operators = { "y", "d", "c" },
  textobjects = { { "i", "a" }, { "w", "W", "f", "c" } },
  -- paste_keys = { ["p"] = "p`]" },
  paste_keys = { ["p"] = "p", ["P"] = "P" },
  register_print_cmd = true,
})
