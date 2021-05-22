local config = require "config"

--      ﮻  ﱥ    ● ★ ◉ ◎ ◯ ? ✖ Ⓘ ⓧ ⓞ  Ⓘ ◆ ◇ ⬢ ✔ ♥       
--                             

local saga_config = {
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
  finder_definition_icon = '   ',
  finder_reference_icon = '   ',
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

local plugin = {}

function plugin.load()
  require("lspsaga").init_lsp_saga(saga_config)
end

function plugin.setup(use)
  use {
    "glepnir/lspsaga.nvim",
    config = plugin.load,
    requires = 'neovim/nvim-lspconfig',
  }
end


return plugin


--[[ highlight groups
  LspSagaFinderSelection	Currently active entry in the finder window that gets previewed.
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
  LspLinesDiagBorder
]]
