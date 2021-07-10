-- cnoremap <silent> <M-[> <C-u>:History:<CR>
-- <c-r>,+  pastes into comman
vim.cmd([[au CmdwinEnter * nnoremap <buffer><esc> <C-c><C-c>]])
vim.cmd([[au CmdwinEnter * startinsert ]])
vim.cmd([[au CmdwinEnter * set nonumber norelativenumber]])
vim.cmd([[cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"]])
vim.cmd([[cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"]])
-- cmap <Tab> <C-f>a<Tab>

local command_map = {
  -- ["<C-n>"] = { "<Tab>", "autocomplete down" },
  -- ["<C-p>"] = { "<Up>", "autocomplete up" },
  ["<C-y>"] = { "<C-r>*", "copy" },
}

local command_opts = { mode = "c", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(command_map, command_opts)
