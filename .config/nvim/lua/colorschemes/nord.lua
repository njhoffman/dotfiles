local lush = require("lush")
local hsl = lush.hsl

vim.g.vim_jsx_pretty_colorful_config = 1
vim.g.vim_jsx_pretty_highlight_close_tag = 1

vim.g.javascript_sql_dialect = "pgsql"
-- vim.o.background = "dark" -- or "light" for light mode
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_fenced_languages = {
  "coffee",
  "css",
  "erb=eruby",
  "javascript",
  "js=javascript",
  "json=javascript",
  "python",
  "css",
  "sh",
  "bash=sh",
  "html",
  "zsh",
  "ruby",
  "sass",
  "xml"
}

vim.g.vim_markdown_no_extensions_in_markdown = 1

local nord = require("colorschemes.lush-themes.nord-nvim")

local clr_over = {
  orange = "#cc8877",
  yellow = "#bdb994",
  yellow_faded = "#7B6B3B",
  purple_faded = "#6A6CAB",
  red_faded = "#7F212A",
  green_faded = "#128A67",
  blue_faded = "#5171A1"
}
local spec =
  lush.extends({nord}).with(
  function()
    return {
      -- ui components
      NormalFloat {fg = "#8f93a2", bg = "#090b10"}, -- normal text and background color for floating windows
      Pmenu {fg = "#718cc4", bg = "#060614"},
      PmenuSel {fg = "#84ffff", bg = "#1a1c2b"},
      PmenuSbar {fg = "#717cb4", bg = "#202331"},
      PmenuThumb {fg = "#8f93a2", bg = "#84ffff"},
      SignColumn {bg = "none"},
      CursorLine {bg = nord.CursorLine.bg.darken(50), gui = "none"},
      CursorLineNr {fg = "#afd7ff", bg = CursorLine.bg},
      CursorColumn {},
      -- base groups
      Normal {fg = nord.Normal.fg.darken(15), bg = "none"},
      String {fg = "#22bb99"},
      Comment {fg = "#5c667a", gui = "italic"},
      Constant {fg = "#6699aa"},
      Identifier {fg = "#8eb9c6"},
      Type {fg = clr_over.yellow},
      MatchParen {fg = "#60a0a0", bg = "000022"},
      MatchParenCursor {fg = "#a0c0b0"},
      --
      TSTagDelimiter {fg = "#7f90aa"},
      TSURI {fg = "#8eb9f6", gui = "none"},
      yamlTSField {fg = "#717cb4"},
      yamlBlockMappingKey {yamlTSField},
      --
      liquidExpression {Type},
      liquidDelimiter {fg = clr_over.orange},
      -- jsx-pretty
      -- jsxElement {fg = "#ff6600"},
      jsxTag {fg = clr_over.orange},
      jsxComponentName {fg = clr_over.orange},
      jsxTagName {fg = clr_over.orange},
      jsxOpenTag {fg = clr_over.orange},
      jsxCloseTag {fg = "#7f90aa"},
      -- jsxCloseString {fg = "#ff6600"},
      jsxAttrib {fg = "#88bbdd"},
      jsxEqual {fg = "#6699bb"},
      -- js-other
      -- jsVariableType {fg = jsStorageClass.fg},
      -- jsIf {fg = jsConditional.fg},
      -- jsFunctionCall {fg = jsFuncCall.fg},
      -- jsIdentifier {fg = jsDestructuringBlock.fg},
      -- jsModuleDefault {fg = jsExportDefault.fg},
      -- jsSwitch {fg = jsConditional.fg},
      -- jsSwitchCase {fg = jsLabel.fg},
      -- jsRegexpString {javascriptRegExpString},
      -- jsTemplateVar {javascriptTemplateVar},
      -- jsTemplateDelim {javascriptTemplateDelim},
      -- jsTemplateString {javascriptTemplateString},
      -- jsStorageClass {StorageClass},
      -- jsReturn {Statement},
      -- jsConditional {Conditional},
      -- jsExportDefault {fg = StorageClass.fg},
      -- jsExportDefaultGroup {jsExportDefault},
      -- jsLabel {Label},
      --- nvim-hlslens
      HlSearchLensCur {fg = "#ff2266", bg = "#003333"},
      HlSearchLens {fg = "#00ddff", bg = "none"},
      HlSearchCur {fg = "#00ffdd", bg = "none"},
      ---

      -- GitSigns Faded
      GitSignsAddFaded = {fg = clr_over.green_faded},
      GitSignsAddNrFaded = {fg = clr_over.green_faded},
      GitSignsAddLnFaded = {fg = clr_over.green_faded},
      GitSignsChangeFaded = {fg = clr_over.yellow_faded},
      GitSignsChangeNrFaded = {fg = clr_over.yellow_faded},
      GitSignsChangeLnFaded = {fg = clr_over.yellow_faded},
      GitSignsChangeDeleteFaded = {fg = clr_over.purple_faded},
      GitSignsChangeDeleteNrFaded = {fg = clr_over.purple_faded},
      GitSignsChangeDeleteLnFaded = {fg = clr_over.purple_faded},
      GitSignsDeleteFaded = {fg = clr_over.red_faded},
      GitSignsDeleteNrFaded = {fg = clr_over.red_faded},
      GitSignsDeleteLnFaded = {fg = clr_over.red_faded}
      -- --html
      -- TSStrike = {},
      -- TSUnderline = {},
      -- Underline {},
      -- Underlined {},
      -- htmlLink = {},
      -- htmlUnderline = {},
      -- htmlUnderlineItalic = {},
      -- htmlUnderLineItalic = {}
      -- Underlined, CursorLine, TSUnderline, htmlUnderline, htmlUnderlineItalic, htmlUnderLineItalic,
      -- vim.cmd("hi! htmlTag guifg=#7f90aa")
      -- vim.cmd("hi! htmlEndTag guifg=#7f90aa")
      -- vim.cmd("hi! htmlArg guifg=#7f90aa")
      -- vim.cmd("hi! htmlTagName guifg=#7f90aa")

      -- vim.cmd("hi! link jsVariableType Type")
      -- vim.cmd("hi! link jsxComponentName jsxTag")
      -- vim.cmd("hi! link jsxRegexpString javascriptRegExpString")
      -- vim.cmd("hi! link jsTemplateVar javascriptTemplateVar")
      -- vim.cmd("hi! link jsTemplateDelim javascriptTemplateDelim")
      -- vim.cmd("hi! link jsTemplateString javascriptTemplateString")
    }
  end
)

return spec
