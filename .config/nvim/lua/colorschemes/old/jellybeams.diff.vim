"""""""""""""""""""""""""""
" CUSTOMIZATIONS
"""""""""""""""""""""""""""

" call s:X("Normal","#cccccc",s:background_color,"","White","")
" call s:X("Normal","e8e8d3",s:background_color,"","White","")
call s:X("Normal","afb6bb",s:background_color,"","White","")


call s:X("CursorLine","","081214","","",s:termBlack)
call s:X("CursorColumn","","","","",s:termBlack)

if &diff
    hi! CursorLine cterm=none ctermfg=none ctermbg=none
    set cursorline!
endif

call s:X("CursorLineNr", "afd7ff","","","",s:termBlack)
" call s:X("CursorLineNr","ccc5c4","","","White","")

" call s:X("MatchParen","ffffff","80a090","bold","","DarkCyan")
call s:X("MatchParen","60a0a0","000022","bold","","DarkCyan")
call s:X("MatchParenCursor","a0c0b0", "", "bold","","DarkCyan")

  " Tabs
call s:X("TabLineSel","000000","f0f0f0","bold",s:termBlack,"White")
" call s:X("TabLineSel","000000","f0f0f0","italic,bold",s:termBlack,"White")

" quickfix filename
" hi! qfFileName guifg=#52a8b8

" has to get re-initialized by vim-airline?
hi VertSplit ctermfg=Black ctermbg=DarkGray



call s:X("Todo","808080","","bold","White",s:termBlack)
" call s:X("Todo","c7c7c7","","bold","White",s:termBlack)

call s:X("StatusLine","000000","dddddd","","","White")
" call s:X("StatusLine","000000","dddddd","italic","","White")

call s:X("StatusLineNC","ffffff","403c41","","White","Black")
" call s:X("StatusLineNC","ffffff","403c41","italic","White","Black")

call s:X("StatusLineAir","ff0000","","","","White")
call s:X("StatusLineAirNC","ff0000","","","White","Black")

call s:X("Folded","888888","","",s:termBlack,"")
" call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")

call s:X("FoldColumn","535D66","000000","","",s:termBlack)
" call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)

call s:X("Title","CCCCCC","","bold","Green","")
" call s:X("Title","70b950","","bold","Green","")

call s:X("Constant","87afff","","","Red","")
" call s:X("Constant","cf6a4c","","","Red","")

call s:X("Delimiter","7F90AA","","","Grey","")
" call s:X("Delimiter","668799","","","Grey","")

call s:X("Keyword","BECDE6","","","Grey","")

call s:X("Type","BECDE6","","","Grey","")
" call s:X("Type","ffb964","","","Yellow","")

call s:X("String","22BB99","","","Green","")
" call s:X("String","99ad6a","","","Green","")

" call s:X("Directory","dad085","","","Yellow","")
call s:X("Directory","52a8b8" ,"","","Cyan","")

" vimdiff
" call s:X("DiffAdd","","001000","","","DarkGreen")
call s:X("DiffAdd","","00361f","","","DarkGreen")
" call s:X("DiffDelete","","300000","","","DarkRed")
" call s:X("DiffChange","","001030","","","DarkBlue")
" call s:X("DiffText","","001030","italic","","")
" hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
" hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
" hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
" hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

call s:X("Identifier","BEA9E6","","","LightCyan","")
call s:X("Structure","8fbfdc","","","LightCyan","")
call s:X("Function","E2BD8C","","","Yellow","")
" call s:X("Function","FD971F","","","Yellow","")
call s:X("Statement","8197bf","","","DarkBlue","")
call s:X("PreProc","8fbfdc","","","LightBlue","")

hi! link Operator Normal

call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")

call s:X("Search","afffff","","","Magenta","")
" call s:X("Search","afd7ff","","","Magenta","")

" Dim inactive window, requires automatic window enter/leave function
hi! ActiveWindow ctermbg=232 guibg=NONE
hi! InactiveWindow ctermbg=234 guibg=#161824

" PSL
call s:X('pslNegative', "B0BAF7", "", "", "Blue", "")
call s:X('pslPositive', "B0BAF7", "", "", "Blue", "")
call s:X('pslImport', "E2DCBC", "", "", "Yellow", "")
call s:X('pslMultiline', "FF6600", "", "", "Orange", "")
call s:X('pslValue', "B0BAF7", "", "", "Blue", "")

" SpiderCode
call s:X("spiderCodeBlock","FF0000","","","Red", "")
call s:X("spiderCodeKeyword","cf6a4c","","","Red", "")

" TCF/TCA
"
call s:X("tcfAttrName","7F93E2","","","LightBlue","")
call s:X("tcfAttrValue","C8C8C8","","","Grey","")
call s:X("tcfAttrDiv","AACCFF","","","White","")
call s:X("tcfAttrRev","888888","","","Grey","")
call s:X("tcfAttrRevNum","888888","","","Grey","")
call s:X("tcfAttrRevName","888888","","","Grey","")
call s:X("tcfAttrRevDiv","888888","","","Grey","")
call s:X("tcfAttrRevValue","888888","","","Grey","")

" HTML

call s:X("htmlTag","7F90AA","","","Grey","")
call s:X("htmlEndTag","7F90AA","","","Grey","")
call s:X("htmlArg","7F90AA","","","Grey","")
call s:X("htmlTagName","7F90AA","","","Grey","")
" call s:X("htmlItalic","e8e8d3","000000","","Grey","")
call s:X("htmlItalic","","","italic","","")
call s:X("htmlLink","aaddff","","","Grey","")

" JavaScript

call s:X("javascriptBraces","FFFFFF","","","Magenta","")
call s:X("javaScript", "CCCCCC","","","White","")
call s:X("jsxTag", "FF6600","","","Orange","")
call s:X("jsxTagName", "FF6600","","","Orange","")
call s:X("jsxCloseTag", "7F90AA", "", "", "Blue", "")
call s:X("jsxAttrib", "88bbdd","","","Orange","")
call s:X("jsxEqual", "6699bb","","","Orange","")
" call s:X("jsObjectKey", "cccccc", "", "", "Cyan", "")
call s:X("jsObjectKey", "aabbcc", "", "", "Cyan", "")
call s:X("jsObjectProp", "bbbbbb", "", "", "White", "")
call s:X("jsObjectValue", "bbbbbb", "", "", "White", "")
call s:X("jsClassProperty", "aaddff", "", "", "White", "")
" call s:X("jsClassFuncName", "cccccc", "", "", "White", "")
call s:X("jsFuncName", "ff8800", "", "", "White", "")
" call s:X("jsFuncCall", "dddddd", "", "", "White", "")
call s:X("jsFuncCall", "79a8cb", "", "", "White", "")
call s:X("jsThis", "aaddff", "", "", "White", "")
" call s:X("jsGlobalObjects", "cccccc", "", "", "White", "")
call s:X("jsTemplateBraces", "b9bc6b", "", "", "Brown", "")
call s:X("jsTemplateString","37acaa","","","Green","")
call s:X("javaScriptRegexpString","bb55ff","","","Purple","")

hi! link xmlTagName jsxTag
hi! link xmlTag jsxTag

hi! link jsValue javaScriptValue
hi! link jsRegexpString javaScriptRegexpString
hi! link jsTemplateVar javaScriptTemplateVar
hi! link jsTemplateDelim javaScriptTemplateDelim
hi! link jsTemplateString javascriptTemplateString
hi! link jsxComponentName jsxTag
hi! link jsStorageClass StorageClass
hi! link jsReturn Statement
hi! link jsConditional Conditional
hi! link jsExportDefault StorageClass
hi! link jsExportDefaultGroup jsExportDefault
hi! link jsLabel Label

"**************
" PLUGINS
"**************

" jsx-pretty
hi! link jsVariableType jsStorageClass
hi! link jsFunctionCall jsFuncCall
hi! link jsIf jsConditional
hi! link jsIdentifier jsDestructuringBlock
hi! link jsModuleDefault jsExportDefault
hi! link jsSwitch jsConditional
hi! link jsSwitchCase jsLabel
call s:X("jsSwitch","8888dd","","","Purple","")

call s:X("VimWikiLink","00ccff","","","Green","")
" VimWikiHeader1, 2, 3

call s:X("GitGutterAdd","007700","","","Green","")
call s:X("GitGutterChange","999900","","","Yellow","")
call s:X("GitGutterDelete","880000","","","Red","")

" ALE linter highlighting
call s:X("ALEError", "", "", "", "", "")
call s:X("ALEErrorSign","AA0000", "",  "", "Red", "")
call s:X("ALEWarning", "", "", "", "", "")
highlight ALEErrorLine guibg=#120000

hi! link CocErrorHighlight none
hi! link CocWarningHighlight none
hi! link CocInfoHighlight none
hi! link CocHintHighlight none
hi! CocWarningSign ctermfg=130 guifg=#bf6200

" Debugger.vim
call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-wiki
hi vimwikiHeader1 ctermfg=109  guifg=#45a5f8 ctermbg=None gui=bold term=bold cterm=bold
hi vimwikiHeader2 ctermfg=109  guifg=#45a5e8 ctermbg=None gui=bold
hi vimwikiHeader3 ctermfg=109  guifg=#45a5d8 ctermbg=None gui=bold
hi vimwikiHeader4 ctermfg=109  guifg=#45a5c8 ctermbg=None gui=bold
hi vimwikiHeader5 ctermfg=109  guifg=#45a5b8 ctermbg=None gui=bold
hi vimwikiHeader6 ctermfg=109  guifg=#45a5a8 ctermbg=None gui=bold
hi vimwikiHeaderChar ctermfg=109  guifg=#557588 ctermbg=None

" vim-markdown
hi htmlH1 ctermfg=109  guifg=#45a5f8 ctermbg=None gui=bold term=bold cterm=bold
hi htmlH2 ctermfg=109  guifg=#45a5e8 ctermbg=None gui=bold
hi htmlH3 ctermfg=109  guifg=#45a5d8 ctermbg=None gui=bold
hi htmlH4 ctermfg=109  guifg=#45a5c8 ctermbg=None gui=bold
hi htmlH5 ctermfg=109  guifg=#45a5b8 ctermbg=None gui=bold
hi htmlH6 ctermfg=109  guifg=#45a5a8 ctermbg=None gui=bold
hi mkdHeading ctermfg=109  guifg=#557588 ctermbg=None
" hi htmlH1 ctermfg=88   guifg=#9d0006 ctermbg=None gui=bold  term=bold cterm=bold
" hi htmlH2 ctermfg=106  guifg=#fb4934 ctermbg=None gui=bold
" hi htmlH3 ctermfg=166  guifg=#98971a ctermbg=None gui=bold
" hi htmlH4 ctermfg=109  guifg=#458588 ctermbg=None gui=bold
" hi htmlH5 ctermfg=124  guifg=#b16286 ctermbg=None gui=bold
" hi mkdCodeStart ctermfg=239 guifg=#9E9E9E ctermbg=None gui=bold
" hi mkdCodeEnd ctermfg=239 guifg=#9E9E9E ctermbg=None gui=bold
" hi mkdCode ctermfg=88  guifg=#427b58 ctermbg=None cterm=bold
"
hi VimWikiTag guifg=#994444 gui=italic

" nvim-hlslens
" highlight default link HlSearchLensCur IncSearch
" highlight default link HlSearchLens WildMenu
" highlight default link HlSearchCur IncSearch
hi! HlSearchLensCur guifg=#ff2266 guibg=#003333
hi! HlSearchLens guifg=#00DDFF guibg=#000000
hi! HlSearchCur guifg=#00FFDD guibg=#000000

" bufferline
hi! BufferCurrent  guifg=#ff0000 guifg=#ff0000
hi! BufferVisible guifg=#ff0000 guifg=#ff0000
hi! BufferTabpages  guifg=#ff0000 guifg=#ff0000

" bqf preview
highlight BqfPreviewBorder guifg=#50a14f ctermfg=71
highlight link BqfPreviewRange IncSearch

" vim shortcut line
hi! link vimShortcutLine vimLineComment

" telescope styles and mappings
"  highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item
"  highlight TelescopeSelectionCaret guifg=#CC241D " selection caret
"  highlight TelescopeMultiSelection guifg=#928374 " multisections
"  highlight TelescopeNormal         guibg=#00000  " floating windows created by telescope.
"  highlight TelescopeBorder         guifg=#ffffff
"  highlight TelescopePromptBorder   guifg=#ffffff
"  highlight TelescopeResultsBorder  guifg=#ffffff
"  highlight TelescopePreviewBorder  guifg=#ffffff
" " Used for highlighting characters that you match.
" highlight TelescopeMatching       guifg=blue
" " Used for the prompt prefix
" highlight TelescopePromptPrefix   guifg=red


" startify

" hi! link StartifyPath Directory
hi! StartifyFile guifg=#a5c5db

" CocErrorSign   xxx ctermfg=9 guifg=#ff0000
" CocWarningSign xxx ctermfg=130 guifg=#ff922b
" CocInfoSign    xxx ctermfg=11 guifg=#fab005
" CocHintSign    xxx ctermfg=12 guifg=#15aabf
" CocSelectedText xxx ctermfg=9 guifg=#fb4934
" CocCodeLens    xxx ctermfg=248 guifg=#999999
" CocMenuSel     xxx links to PmenuSel
" CocErrorFloat  xxx links to CocErrorSign
" CocWarningFloat xxx links to CocWarningSign
" CocInfoFloat   xxx links to CocInfoSign
" CocHintFloat   xxx links to CocHintSign
" CocListMode    xxx links to ModeMsg
" CocListPath    xxx links to Comment
" CocHighlightText xxx links to CursorColumn
" CocHoverRange  xxx links to Search
" CocCursorRange xxx links to Search
" CocHighlightRead xxx links to CocHighlightText
" CocHighlightWrite xxx links to CocHighlightText
" CocFloating    xxx links to NormalFloat
" CocCursorTransparent xxx gui=strikethrough blend=100
" CocErrorVirtualText xxx links to CocErrorSign
" CocWarningVirtualText xxx links to CocWarningSign
" CocInfoVirtualText xxx links to CocInfoSign
" CocHintVirtualText xxx links to CocHintSign
"
" hi EasyMotionTarget ctermbg=none ctermfg=green
" hi EasyMotionShade  ctermbg=none ctermfg=blue

hi! EasyMotionShadeDefault guifg=#666077

" hi EasyMotionTarget2First ctermbg=none ctermfg=red
" hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred
"
" hi EasyMotionMoveHL ctermbg=green ctermfg=black
" hi EasyMotionIncSearch ctermbg=green ctermfg=black


" barbar bufferline

" Highlighting function {{{
function! s:_ (name, ...)
  let fg = ''
  let bg = ''
  let attr = ''

  if type(a:1) == 3
    let fg   = get(a:1, 0, '')
    let bg   = get(a:1, 1, '')
    let attr = get(a:1, 2, '')
  else
    let fg   = get(a:000, 0, '')
    let bg   = get(a:000, 1, '')
    let attr = get(a:000, 2, '')
  end

  let has_props = v:false

  let cmd = 'hi! ' . a:name
  if !empty(fg) && fg != 'none'
    let cmd .= ' guifg=' . fg
    let has_props = v:true
  end
  if !empty(bg) && bg != 'none'
    let cmd .= ' guibg=' . bg
    let has_props = v:true
  end
  if !empty(attr) && attr != 'none'
    let cmd .= ' gui=' . attr
    let has_props = v:true
  end
  execute 'hi! clear ' a:name
  if has_props
    execute cmd
  end
endfunc

" }}}
" Colors                                                                     {{{

let s:base0      = '#1B2229'
let s:base1      = '#1c1f24'
let s:base2      = '#202328'
let s:base3      = '#23272e'
let s:base4      = '#3f444a'
let s:base5      = '#5B6268'
let s:base6      = '#73797e'
let s:base7      = '#9ca0a4'
let s:base8      = '#b1b1b1'
let s:base9      = '#E6E6E6'

let s:grey       = s:base4
let s:red        = '#ff6c6b'
let s:orange     = '#da8548'
let s:green      = '#98be65'
let s:teal       = '#4db5bd'
let s:yellow     = '#ECBE7B'
let s:blue       = '#51afef'
let s:dark_blue  = '#2257A0'
let s:magenta    = '#c678dd'
let s:violet     = '#a9a1e1'
let s:cyan       = '#46D9FF'
let s:dark_cyan  = '#5699AF'
let s:white      = '#efefef'

let s:green_alt  = '#799033'

let s:bg = "#000000"
" let s:bg = "#151515"
" let s:bg             = '#282c34'
let s:bg_alt         = '#21242b'
let s:bg_highlight   = '#2E323C'
let s:bg_popup       = '#0c0c0c'
let s:bg_widget      = s:bg
let s:bg_statusline  = s:bg_popup
let s:bg_visual      = color#Lighten(s:base2, 0.3)
let s:bg_selection   = s:dark_blue
let s:bg_highlighted = '#4A4A45'

let s:fg           = '#bbc2cf'
let s:fg_alt       = '#5B6268'
let s:fg_widget    = s:fg
let s:fg_popup     = '##bbc2cf'
let s:fg_conceal   = s:base4
let s:fg_subtle    = s:base7
let s:fg_highlight = color#Lighten(s:fg, 0.2)
let s:fg_linenr    = s:base4

let s:highlight       = s:blue
let s:highlight_color = s:base0

let s:tag    = color#Mix(s:blue, s:cyan)

let s:diff_info_fg  = s:blue
let s:diff_info_bg0 = color#Mix('#D8EEFD', s:bg, 0.6)
let s:diff_info_bg1 = color#Mix('#D8EEFD', s:bg, 0.8)

let s:diff_add_fg  = s:green
let s:diff_add_fg0 = color#Mix(s:green,   s:fg, 0.4)
let s:diff_add_bg0 = color#Mix('#506d5b', s:bg, 0.4)
let s:diff_add_bg1 = color#Mix('#acf2bd', s:bg, 0.6)
let s:diff_add_bg2 = color#Mix('#acf2bd', s:bg, 0.8)

let s:gh_danger_fg  = s:red
let s:gh_danger_fg0 = color#Mix(s:red,     s:fg, 0.6)
let s:gh_danger_bg0 = color#Mix('#ffdce0', s:bg, 0.6)
let s:gh_danger_bg1 = color#Mix('#ffdce0', s:bg, 0.8)
let s:gh_danger_bg2 = color#Mix('#ffdce0', s:bg, 0.9)

" }}}
" General UI                                                                 {{{

call s:_('Normal',            s:fg,           s:bg)
call s:_('EndOfBuffer',       s:fg,           s:bg)
call s:_('NormalPopup',       s:fg_highlight, s:bg_popup)
call s:_('NormalPopover',     s:fg_highlight, s:bg_popup)
call s:_('NormalPopupPrompt', s:base7,        color#Darken(s:bg_popup, 0.3), 'bold')
call s:_('NormalPopupSubtle', s:base6,        s:bg_popup)

" call s:_('Cursor',           '', s:base0,  'reverse')
" call s:_('SecondaryCursor',  '', s:highlight, 'none')

call s:_('Folded',           s:base7,  s:bg_highlight, 'none')
call s:_('FoldColumn',       s:fg_alt, s:bg_widget, '')
call s:_('SignColumn',       '',       s:bg_widget, '')
call s:_('ColorColumn',      '',       s:bg_widget, '')

" call s:_('CursorLine','','#081214')
" call s:_('CursorColumn','','#081214')
" call s:_('CursorLine',       '',          s:bg_highlight)
" call s:_('CursorColumn',     '',          s:bg_highlight)
" call s:_('CursorLineNr',     s:highlight, s:bg_highlight, 'none')
" call s:_('LineNr',           s:fg_linenr, s:bg_widget,    'none')

call s:_('IndentGuide',      s:base4, '', '')
call s:_('IndentGuidesEven', s:base4, '', '')
call s:_('IndentGuidesOdd',  s:base4, '', '')

call s:_('TermCursor',       s:fg,        'none',            'reverse')
call s:_('TermCursorNC',     s:fg_alt,    'none',            'reverse')
call s:_('TermNormal',       s:fg,        s:bg,    '')
hi! link TermNormalNC TermNormal

call s:_('Visual',         '', s:bg_visual)
call s:_('VisualBold',     '', s:bg_visual, 'bold')

call s:_('WildMenu',       s:fg,            s:bg_selection)

call s:_('StatusLine',       s:base8,  s:bg_statusline, 'none')
call s:_('StatusLineNC',     s:base6,  s:bg_statusline, 'none')
call s:_('StatusLinePart',   s:base6,  s:bg_statusline, 'bold')
call s:_('StatusLinePartNC', s:base6,  s:bg_statusline, 'bold')

call s:_('Separator', s:fg_alt, 'none')
call s:_('VertSplit', s:base4,   s:bg, 'none')

" Auto-completion

hi! Pmenu guifg=#99aacc guibg=#001818  ctermbg=234 ctermfg=250
hi! PmenuSel guifg=#bceeff guibg=#226888 ctermbg=23 ctermfg=255
hi! PmenuThumb ctermbg=23 ctermfg=255
hi! NormalFloat guifg=#99aacc guibg=#100812  ctermbg=234 ctermfg=250
" call s:X("Pmenu","ffffff","606060","","White",s:termBlack)
" call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")
" call s:X("PmenuSbar","cccccc","222266","","White","Blue")
" call s:_('PmenuThumb',   '#666660',         '#666660')

if exists('&pumblend')
  set pumblend=20
end

let s:bg_current = s:bg
let s:bg_visible = s:bg
let s:bg_other   = s:base1

call s:_('TabLine',             s:base7, s:bg_alt,  'bold')
call s:_('TabLineSel',          s:blue,  s:bg_current, 'bold')
call s:_('TabLineFill',         'none',  s:bg_other,   'bold')

call s:_('BufferCurrent',       s:base9,          s:bg_current,  'none')
call s:_('BufferCurrentIndex',  s:base6,          s:bg_current,  'none')
call s:_('BufferCurrentMod',    s:yellow,         s:bg_current,  'none')
call s:_('BufferCurrentSign',   s:blue,           s:bg_current,  'none')
call s:_('BufferCurrentTarget', s:red,            s:bg_current,  'bold')

call s:_('BufferVisible',       s:base7,          s:bg_visible,  'none')
call s:_('BufferVisibleIndex',  s:base9,          s:bg_visible,  'none')
call s:_('BufferVisibleMod',    s:yellow,         s:bg_visible,  'none')
call s:_('BufferVisibleSign',   s:base4,          s:bg_visible,  'none')
call s:_('BufferVisibleTarget', s:red,            s:bg_visible,  'bold')

call s:_('BufferInactive',       s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveIndex',  s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveMod',    s:yellow,         s:bg_other,    'none')
call s:_('BufferInactiveSign',   s:base4,          s:bg_other,    'none')
call s:_('BufferInactiveTarget', s:red,            s:bg_other,    'bold')

call s:_('BufferTabpages',       s:blue,           s:bg_statusline, 'bold')
call s:_('BufferTabpageFill',    s:base4,          s:bg_other,    'bold')

call s:_('BufferPart',        s:diff_info_fg,   s:diff_info_bg0, 'bold')

" }}}

" delete functions {{{
delf s:X
delf s:remove_italic_attr
delf s:prefix_highlight_value_with
delf s:rgb
delf s:is_empty_or_none
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
" }}}


