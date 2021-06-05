-- gca ,ca     => Action (S)
--     gh      => Finder (S)
-- gD ,gd  gd  => Prev-Definition (S-D)
-- gk  K       => Hover Doc (S)
-- [d, [e      => Diag Virtual/Float (D-S)
-- ,wa ,wd ,wl => Folder add, remove, list
-- gi  gr      => Implementation, references (D-D)
--     ge      => Show diag error (S)
--    ,rn      => Rename (S)
--     gq      => Location list

local mappings = {}

-- lsp-saga
function mappings.lsp_saga()
  vim.cmd("nnoremap <silent>gh :Lspsaga lsp_finder<CR>")
  vim.cmd("nnoremap <silent>gca :Lspsaga code_action<CR>")
  vim.cmd("vnoremap <silent>gca :<C-U>Lspsaga range_code_action<CR>")
  vim.cmd("nnoremap <silent><leader>gs :Lspsaga signature_help<CR>")
  vim.cmd("nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>")
  vim.cmd("nnoremap <silent>gD :Lspsaga preview_definition<CR>")
  vim.cmd("nnoremap <silent>K :Lspsaga hover_doc<CR>")
  vim.cmd("nnoremap <silent>gk :Lspsaga hover_doc<CR>")
  vim.cmd("nnoremap <silent>ge :Lspsaga show_line_diagnostics<CR>")
  vim.cmd("nnoremap <silent><leader>ca :Lspsaga code_action<CR>")
  vim.cmd("vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>")
  vim.cmd("nnoremap <silent>[e :Lspsaga diagnostic_jump_next<CR>")
  vim.cmd("nnoremap <silent>]e :Lspsaga diagnostic_jump_prev<CR>")
  vim.cmd('nnoremap <silent><PageDown> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
  vim.cmd('nnoremap <silent><PageUp> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
  vim.cmd("nnoremap <silent><leader>rn :Lspsaga rename<CR>")
  -- vim.cmd('nnoremap <silent><leader>cd <cmd>lua<CR> require"lspsaga.diagnostic".show_line_diagnostics()<CR>')
  -- only show diagnostic if cursor is over the area
  -- vim.cmd('nnoremap <silent><leader>cc <cmd>lua<CR> require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
  -- float terminal also you can pass the cli command in open_float_terminal function
  -- vim.cmd('nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>')
  -- vim.cmd('tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>')
end

function mappings.lsp_attach(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end

return mappings
