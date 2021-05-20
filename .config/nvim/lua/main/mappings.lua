local u = require("utils.core")

-- nvim-tree
  u.map("n", "<f6>", ":NvimTreeToggle<CR>")
  u.map("n", "<f7>", ":NvimTreeRefresh<CR>")
  u.map("n", "<f8>", ":NvimTreeFindFile<CR>")

-- telescope
  u.map("n", "<leader>ff", ":Telescope find_files<CR>")
  u.map("n", "<leader>fo", ":Telescope oldfiles<CR>")
  u.map("n", "<leader>fg", ":Telescope live_grep<CR>")
  u.map("n", "<leader>fh", ":Telescope help_tags<CR>")
  u.map("n", "<leader>fc", ":Telescope colorscheme<CR>")
  u.map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
  u.map("n", "<leader>b", ":Telescope buffers<CR>")

-- lsp-saga
  -- cursor word definition and reference
  vim.cmd('nnoremap <silent>gh :Lspsaga lsp_finder<CR>')
  -- code action
  vim.cmd('nnoremap <silent><leader>a :Lspsaga code_action<CR>')
  vim.cmd('nnoremap <silent><leader>ca :Lspsaga code_action<CR>')
  vim.cmd('vnoremap <silent><leader>a :<C-U>Lspsaga range_code_action<CR>')
  vim.cmd('vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>')
  -- show hover doc
  vim.cmd('nnoremap <silent>K :Lspsaga hover_doc<CR>')
  vim.cmd('nnoremap <silent>gk :Lspsaga hover_doc<CR>')
  -- scroll down hover doc or scroll in definition preview
  vim.cmd('nnoremap <silent><PageDown> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
  -- scroll up hover doc
  vim.cmd('nnoremap <silent><PageUp> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
  -- show signature help
  vim.cmd('nnoremap <silent>gs :Lspsaga signature_help<CR>')
  -- rename
  vim.cmd('nnoremap <silent>gr :Lspsaga rename<CR>')
  -- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
  -- preview definition
  vim.cmd('nnoremap <silent>gd :Lspsaga preview_definition<CR>')
  -- show
  vim.cmd('nnoremap <silent><leader>cd <cmd>lua<CR> require"lspsaga.diagnostic".show_line_diagnostics()<CR>')
  vim.cmd('nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>')
  -- only show diagnostic if cursor is over the area
  vim.cmd('nnoremap <silent><leader>cc <cmd>lua<CR> require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
  -- jump diagnostic
  vim.cmd('nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>')
  vim.cmd('nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>')
  vim.cmd('nnoremap <silent> [g :Lspsaga diagnostic_jump_next<CR>')
  vim.cmd('nnoremap <silent> ]g :Lspsaga diagnostic_jump_prev<CR>')
  -- float terminal also you can pass the cli command in open_float_terminal function
  vim.cmd('nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>')
  -- vim.cmd('tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>')





-- u.map("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'")
-- u.map("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'")
-- nvim-compe
-- u.map('i', '<C-Space>', '<plug>compe#complete()')
-- u.map('i', '<CR>', ':call compe#confirm("<CR>")')
-- u.map('i', '<Tab>', ':call compe#confirm("<CR>")')
-- u.map('i', '<C-e>', ':call compe#close("<C-e>")')
-- u.map('i', '<C-f>', ':call compe#scroll({ "delta": +4 })')
-- u.map('i', '<C-d>', ':call compe#scroll({ "delta": -4 })')
