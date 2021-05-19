local saga = require 'lspsaga'
--      ﮻  ﱥ    ● ★ ◉ ◎ ◯ ? ✖ Ⓘ ⓧ ⓞ  Ⓘ ◆ ◇ ⬢ ✔ ♥       
--                             


saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  error_sign = '﮻',
  warn_sign = '',
  hint_sign = '◆' ,
  infor_sign = '',
  dianostic_header_icon = '   ',
  code_action_icon = '',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = {'q', '<C-[>'},
    scroll_down = '<C-f>',
    scroll_up = '<C-b>'
  },
  code_action_keys = {
    quit = {'q', '<C-[>'},
    exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<C-c>', '<C-[>'},
    exec = '<CR>'  -- quit can be a table
  },
  definition_preview_icon = '   ',
  -- "single" "double" "round" "plus"
  border_style = "round",
  rename_prompt_prefix = '➤',
}

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

-- highlight groups
--[[ LspSagaFinderSelection	Currently active entry in the finder window that gets previewed.
LspFloatWinNormal
LspFloatWinBorder
LspSagaBorderTitle
TargetWord
ReferencesCount
DefinitionCount
TargetFileName
DefinitionIcon
ReferencesIcon
ProviderTruncateLine
SagaShadow
LspSagaFinderSelection
DiagnosticTruncateLine
DiagnosticError
DiagnosticWarning
DiagnosticInformation
DiagnosticHint
DefinitionPreviewTitle
LspSagaShTruncateLine
LspSagaDocTruncateLine
LineDiagTuncateLine
LspSagaCodeActionTitle
LspSagaCodeActionTruncateLine
LspSagaCodeActionContent
LspSagaRenamePromptPrefix
LspSagaRenameBorder
LspSagaHoverBorder
LspSagaSignatureHelpBorder
LspSagaCodeActionBorder
LspSagaAutoPreview
LspSagaDefPreviewBorder
LspLinesDiagBorder ]]
