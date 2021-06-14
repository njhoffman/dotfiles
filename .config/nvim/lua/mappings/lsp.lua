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
-- buf_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- vim.cmd("nnoremap <silent>gh :Lspsaga lsp_finder<CR>")
-- vim.cmd("nnoremap <silent>gca :Lspsaga code_action<CR>")
-- vim.cmd("vnoremap <silent>gca :<C-U>Lspsaga range_code_action<CR>")
-- vim.cmd("nnoremap <silent><leader>gs :Lspsaga signature_help<CR>")
-- vim.cmd("nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>")
-- vim.cmd("nnoremap <silent>gD :Lspsaga preview_definition<CR>")
-- vim.cmd("nnoremap <silent>K :Lspsaga hover_doc<CR>")
-- vim.cmd("nnoremap <silent>gk :Lspsaga hover_doc<CR>")
-- vim.cmd("nnoremap <silent>ge :Lspsaga show_line_diagnostics<CR>")
-- vim.cmd("nnoremap <silent><leader>ca :Lspsaga code_action<CR>")
-- vim.cmd("vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>")
-- vim.cmd("nnoremap <silent>[e :Lspsaga diagnostic_jump_next<CR>")
-- vim.cmd("nnoremap <silent>]e :Lspsaga diagnostic_jump_prev<CR>")
-- vim.cmd('nnoremap <silent><PageDown> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
-- vim.cmd('nnoremap <silent><PageUp> <cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
-- vim.cmd("nnoremap <silent><leader>rn :Lspsaga rename<CR>")
-- vim.cmd('nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>')
-- vim.cmd('tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>')
-- vim.cmd('nnoremap <silent><leader>cd <cmd>lua<CR> require"lspsaga.diagnostic".show_line_diagnostics()<CR>')
-- -- only show diagnostic if cursor is over the area
-- -- vim.cmd('nnoremap <silent><leader>cc <cmd>lua<CR> require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
-- -- float terminal also you can pass the cli command in open_float_terminal function

-- map("n", "<leader>tv", ":lua diagnostic_toggle_virtual_text()<CR>")
local lsp_maps = {
  ["K"] = {"<cmd>Lspsaga hover_doc<cr>", "hover document"},
  ["g"] = {
    name = "+goto actions",
    ["d"] = {"<cmd>Telescope lsp_definitions<cr>", "lsp definitions"},
    ["D"] = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "buffer declaration"},
    ["k"] = {"<cmd>Lspsaga hover_doc<cr>", "hover document"},
    ["o"] = {"<cmd>TSLspOrganize<cr>", "organize imports"},
    -- ["a"] = {"<cmd>Lspsaga code_action<cr>", "code actions"},
    -- ["f"] = {"<cmd>TSLspFixCurrent<cr>", "eslint fix"},
    -- ["r"] = {"<cmd>TSLspRenameFile<cr>", "rename file"},
    -- ["i"] = {"<cmd>TSLspImportAll<cr>", "import all"},
    ["h"] = {"<cmd>Telescope lsp_finder<cr>", "lsp finder"},
    ["r"] = {"<cmd>Telescope lsp_references<cr>", "lsp references"},
    ["s"] = {"<cmd>Telescope lsp_signature_help<cr>", "signature help"},
    ["y"] = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "buffer definition"},
    -- other goto/transforms under cursor
    ["f"] = {"Edit file under cursor"},
    ["x"] = {"Open file under cursor"}, -- map X to background
    ["i"] = {"Move to last insertion"},
    ["I"] = {"Insert at beginning"},
    ["a"] = {"Ascii under cursor"},
    ["u"] = {"Lowercase motion"},
    ["U"] = {"Uppercase motion"},
    ["n"] = {"Select last search match"},
    ["v"] = {"visually select last edited/pasted text"},
    ["c"] = {"comment text"},
    ["cc"] = {"comment line"}
  },
  --- lsp actions
  ["<leader>l"] = {
    name = "+lsp",
    ["a"] = {"<cmd>Lspsaga code_action<cr>", "code action"},
    ["A"] = {"<cmd>Lspsaga range_code_action<cr>", "selected action"},
    ["d"] = {
      "<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics"
    },
    ["D"] = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics"
    },
    ["l"] = {"<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics"},
    ["f"] = {"<cmd>Lspsaga lsp_finder<cr>", "lsp finder"},
    ["i"] = {"<cmd>LspInfo<cr>", "lsp server info"},
    ["k"] = {"<cmd>Lspsaga signature_help<cr>", "signature help"},
    ["F"] = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
    ["p"] = {"<cmd>Lspsaga preview_definition<cr>", "preview definition"},
    ["r"] = {"<cmd>Lspsaga rename<cr>", "rename"},
    ["s"] = {"<cmd>Telescope lsp_document_symbols<cr>", "document symbols"},
    ["S"] = {"<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols"},
    [".a"] = {"<cmd>LspStop<cr>", "stop all"}
  },
  --- DAP interactions
  ["<F8>"] = {"[[ lua require('dap').continue()<CR>]]"},
  ["<F9>"] = {"[[ lua require('dap').step_over()<CR>]]"},
  ["<F10>"] = {"[[ lua require('dap').step_into()<CR>]]"},
  ["<F11>"] = {"[[ lua require('dap').step_out()<CR>]]"},
  ["<S-F12>"] = {"[[ lua require('dap').repl.run_last()<CR>]]"},
  ["<leader>d"] = {
    name = "+dap",
    ["t"] = {'[[ lua require"dap".toggle_breakpoint()<CR>]]'},
    ["c"] = {
      '[[ lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>]]'
    },
    ["l"] = {
      '[[ lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>]]'
    }
  }
}

-- map("n", "<c-p>", ":Lspsaga diagnostic_jump_prev<CR>")
-- map("n", "<c-n>", ":Lspsaga diagnostic_jump_next<CR>")
-- map("n", "<Leader>/", ":Ack!<Space>")
-- map("n", "<Leader>/", "<Plug>AgActionWord")
-- map("v", "<Leader>/", "<Plug>AgActionVisual")

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(lsp_maps, opts)

-- -- lsp-saga
--   -- vim.cmd('nnoremap <silent><leader>cd <cmd>lua<CR> require"lspsaga.diagnostic".show_line_diagnostics()<CR>')
--   -- only show diagnostic if cursor is over the area
--   -- vim.cmd('nnoremap <silent><leader>cc <cmd>lua<CR> require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
--   -- float terminal also you can pass the cli command in open_float_terminal function
--   -- vim.cmd('nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>')
--   -- vim.cmd('tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>')
-- end

-- function mappings.lsp_attach(_client, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

--   local opts = {noremap = true, silent = true}
--   vim.api.nvim_buf_set_keymap(
--     bufnr,
--     "n",
--     "<leader>wl",
--     "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
--     opts
--   )
-- end
