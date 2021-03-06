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
--
-- TODO: create generic goto next/prev with [[ , ]] that handles loc lists, qf lists, diagnostics
--
local lsp_maps = {
  ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "hover document" },
  ["[d"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "prev diag" },
  ["]d"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "next diag" },
  ["g"] = {
    name = "+goto actions",
    ["d"] = { "<cmd>Telescope lsp_definitions<cr>", "lsp definitions" },
    ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "buffer declaration" },
    ["k"] = { "<cmd>Lspsaga hover_doc<cr>", "hover document" },
    ["o"] = { "<cmd>TSLspOrganize<cr>", "organize imports" },
    -- ["a"] = {"<cmd>Lspsaga code_action<cr>", "code actions"},
    -- ["f"] = {"<cmd>TSLspFixCurrent<cr>", "eslint fix"},
    -- ["r"] = {"<cmd>TSLspRenameFile<cr>", "rename file"},
    -- ["i"] = {"<cmd>TSLspImportAll<cr>", "import all"},
    ["h"] = { "<cmd>Telescope lsp_finder<cr>", "lsp finder" },
    ["r"] = { "<cmd>Telescope lsp_references<cr>", "lsp references" },
    ["s"] = { "<cmd>Telescope lsp_signature_help<cr>", "signature help" },
    ["y"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "buffer definition" },
    -- other goto/transforms under cursor
    ["f"] = { "Edit file under cursor" },
    -- TODO: create fallback function goto definition
    ["F"] = { ":exec 'normal ^f\'''<bar>exec 'normal f\"'<bar> exec 'normal gf'<cr>", "Edit file under line" },
    ["x"] = { "Open file under cursor" }, -- map X to background
    ["i"] = { "Move to last insertion" },
    ["I"] = { "Insert at beginning" },
    ["a"] = { "Ascii under cursor" },
    ["u"] = { "Lowercase motion" },
    ["U"] = { "Uppercase motion" },
    ["n"] = { "Select last search match" },
    ["v"] = { "visually select last edited/pasted text" },
    -- ["c"] = { "comment text" },
  },
  --- repl
  ["<leader>r"] = {
    name = "+repl actions",
    ["t"] = { "<cmd>call ripple#send_buffer()<cr>", "repl buffer" },
    ["m"] = { "<cmd>call ripple#send_motion()<cr>", "repl motion" },
    ["p"] = { "<cmd>call ripple#send_previous()<cr>", "repl previous" },
    ["r"] = { "<cmd>call ripple#send_buffer()<cr>", "repl buffer" },
  },
  --- lsp actions
  ["<leader>l"] = {
    name = "+lsp",
    ["a"] = { "<cmd>Lspsaga code_action<cr>", "code action" },
    ["A"] = { "<cmd>Lspsaga range_code_action<cr>", "selected action" },
    ["d"] = { "<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics" },
    ["D"] = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics" },
    ["e"] = { "<cmd>lua vim.cmd('e'..vim.lsp.get_log_path())<cr>", "view lsp log" },
    ["l"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics" },
    ["f"] = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
    ["i"] = { "<cmd>LspInfo<cr>", "lsp server info" },
    ["k"] = { "<cmd>Lspsaga signature_help<cr>", "signature help" },
    ["F"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format" },
    ["p"] = { "<cmd>Lspsaga preview_definition<cr>", "preview definition" },
    ["r"] = { "<cmd>Lspsaga rename<cr>", "rename" },
    ["s"] = { "<cmd>Telescope lsp_document_symbols<cr>", "document symbols" },
    ["S"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols" },
    [".a"] = { "<cmd>LspStop<cr>", "stop all" },
  },
}

local lsp_opts = { mode = "n", buffer = nil, silent = true, noremap = true, nowait = false }
require("which-key").register(lsp_maps, lsp_opts)

-- nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>
-- " create a new note
-- nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>
-- " find your notes, click enter to create the note if there are not notes that match
-- nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
-- " insert the id of the note that is found
-- nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>
-- " find the backlinks of the current note all the note that link this note
-- nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
-- " same as above but insert the found id
-- nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>
-- " find all tags and insert
-- nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>
-- " start the neuron server and render markdown, auto reload on save
-- nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>
-- " go to next [[my_link]] or [[[my_link]]]
-- nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
-- " go to previous
-- nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]

-- map("n", "<Leader>/", ":Ack!<Space>")
-- map("n", "<Leader>/", "<Plug>AgActionWord")
-- map("v", "<Leader>/", "<Plug>AgActionVisual")

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
