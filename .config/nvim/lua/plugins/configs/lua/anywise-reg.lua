-- delete / yank/ change  - inner/outer - word function class
require("anywise_reg").setup({
  operators = { "y", "d", "c" },
  textobjects = { { "i", "a" }, { "w", "W", "f", "c" } },
  paste_keys = { ["p"] = "p`]" },
  register_print_cmd = true,
})
