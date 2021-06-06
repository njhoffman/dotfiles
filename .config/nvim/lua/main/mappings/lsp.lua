-- map("n", "gy", "")
-- map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
-- map("n", "gd", ":Telescope lsp_definitions<CR>")
-- map("n", "gR", ":Lspsaga rename<CR>")
-- map("n", "gr", ":Telescope lsp_references<CR>")
-- map("n", "gh", ":Telescope lsp_finder<CR>")
-- map("n", "K", ":Lspsaga hover_doc<CR>")
-- map("n", "gs", ":Lspsaga signature_help<CR>")
-- map("n", "gt", ":Lspsaga code_action<CR>")

local lsp_maps = {
  ["K"] = {"LSP hover"},
  ["g"] = {
    name = "+go cursor action",
    ["y"] = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "LSP type definition"},
    ["D"] = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "LSP declaration"},
    ["d"] = {"<cmd>Telescope lsp_definitions<cr>", "LSP definition"},
    ["r"] = {"<cmd>Telescope lsp_references<cr>", "LSP references"},
    ["h"] = {"<cmd>Telescope lsp_finder<cr>", "LSP finder"},
    ["s"] = {"<cmd>Telescope lsp_references<cr>", "LSP signature help"},
    ["t"] = {"<cmd>Lspsaga code_action<cr>", "LSP code action"},
    -- other goto/transforms under cursor
    ["v"] = {"visually select last edited/pasted text"},
    ["c"] = {"comment text"},
    ["cc"] = {"comment line"}
  },
  --- lsp actions
  ["<leader>l"] = {
    name = "LSP interactions",
    ["a"] = {"<cmd>Lspsaga code_action<cr>", "code action"},
    ["A"] = {"<cmd>Lspsaga range_code_action<cr>", "selected action"},
    ["d"] = {"<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics"},
    ["D"] = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics"},
    ["l"] = {"<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics"},
    ["f"] = {"<cmd>Lspsaga lsp_finder<cr>", "lsp finder"},
    ["i"] = {"<cmd>LspInfo<cr>", "lsp server info"},
    ["k"] = {"<cmd>Lspsaga signature_help<cr>", "signature help"},
    ["h"] = {"<cmd>Lspsaga hover_doc<cr>", "hover document"},
    ["F"] = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
    ["p"] = {"<cmd>Lspsaga preview_definition<cr>", "preview definition"},
    ["r"] = {"<cmd>Lspsaga rename<cr>", "rename"},
    ["s"] = {"<cmd>Telescope lsp_document_symbols<cr>", "document symbols"},
    ["S"] = {"<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols"},
    [".a"] = {"<cmd>LspStop<cr>", "stop all"}
  },
  ["<F8>"] = {"[[ lua require('dap').continue()<CR>]]"},
  ["<F9>"] = {"[[ lua require('dap').step_over()<CR>]]"},
  ["<F10>"] = {"[[ lua require('dap').step_into()<CR>]]"},
  ["<F11>"] = {"[[ lua require('dap').step_out()<CR>]]"},
  ["<S-F12>"] = {"[[ lua require('dap').repl.run_last()<CR>]]"},
  ["<leader>d"] = {
    name = "DAP interface",
    ["t"] = {'[[ lua require"dap".toggle_breakpoint()<CR>]]'},
    ["c"] = {'[[ lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>]]'},
    ["l"] = {'[[ lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>]]'}
  }
}

-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- buf_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- buf_set_keymap('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- buf_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- map("n", "<c-p>", ":Lspsaga diagnostic_jump_prev<CR>")
-- map("n", "<c-n>", ":Lspsaga diagnostic_jump_next<CR>")
-- map("n", "<Leader>/", ":Ack!<Space>")
-- map("n", "<Leader>/", "<Plug>AgActionWord")
-- map("v", "<Leader>/", "<Plug>AgActionVisual")
-- ["<F5>"] = {"<cmd>MundoToggle<CR>"},
-- ["n"] = "<F5>", ":MundoToggle<CR>")
local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(lsp_maps, opts)

require("which-key").register(lsp_maps, opts)
