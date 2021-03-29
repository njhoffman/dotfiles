"""""""""""""""""""""""""""
" CUSTOMIZATIONS
"""""""""""""""""""""""""""

call s:X("Normal","cccccc",s:background_color,"","White","")
" call s:X("Normal","e8e8d3",s:background_color,"","White","")

call s:X("CursorLine","","081214","","",s:termBlack)
call s:X("CursorColumn","","ffffff","","",s:termBlack)

call s:X("CursorLineNR", "afd7ff","","","",s:termBlack)
" call s:X("CursorLineNr","ccc5c4","","NONE","White","")

call s:X("SignColumn","777777","","","",s:termBlack)
" call s:X("SignColumn","777777","333333","","",s:termBlack)

call s:X("MatchParen","ffffff","80a090","bold","","DarkCyan")

  " Tabs
call s:X("TabLineSel","000000","f0f0f0","bold",s:termBlack,"White")
" call s:X("TabLineSel","000000","f0f0f0","italic,bold",s:termBlack,"White")

" Auto-completion
hi! Pmenu ctermbg=234 ctermfg=250
hi! PmenuSel ctermbg=23 ctermfg=255
hi! PmenuThumb ctermbg=23 ctermfg=255
" call s:X("Pmenu","ffffff","606060","","White",s:termBlack)
" call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")
" call s:X("PmenuSbar","cccccc","222266","","White","Blue")

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
hi! ActiveWindow ctermbg=232
hi! InactiveWindow ctermbg=234

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
call s:X("htmlItalic","e8e8d3","000000","","Grey","")
call s:X("htmlLink","aaddff","","","Grey","")

" JavaScript

call s:X("javascriptBraces","FFFFFF","","","Magenta","")
call s:X("javaScript", "CCCCCC","","","White","")
call s:X("jsxTag", "FF6600","","","Orange","")
call s:X("jsObjectKey", "cccccc", "", "", "Cyan", "")
call s:X("jsObjectProp", "bbbbbb", "", "", "White", "")
call s:X("jsObjectValue", "bbbbbb", "", "", "White", "")
call s:X("jsClassProperty", "aaddff", "", "", "White", "")
" call s:X("jsClassFuncName", "cccccc", "", "", "White", "")
call s:X("jsFuncName", "ff8800", "", "", "White", "")
" call s:X("jsFuncCall", "dddddd", "", "", "White", "")
call s:X("jsFuncCall", "eeeeee", "", "", "White", "")
call s:X("jsThis", "aaddff", "", "", "White", "")
" call s:X("jsGlobalObjects", "cccccc", "", "", "White", "")
call s:X("jsTemplateBraces", "b9bc6b", "", "", "Brown", "")
call s:X("jsTemplateString","37acaa","","","Green","")
" hi! link jsTemplateString String
hi! link xmlTagName jsxTag
hi! link xmlTag jsxTag

"**************
" PLUGINS
"**************

call s:X("VimWikiLink","00ccff","","","Green","")

call s:X("GitGutterAdd","007700","","","Green","")
call s:X("GitGutterChange","999900","","","Yellow","")
call s:X("GitGutterDelete","880000","","","Red","")

hi! link CocErrorHighlight none
hi! link CocWarningHighlight none
hi! link CocInfoHighlight none
hi! link CocHintHighlight none

" Sign highlighting
call s:X("SyntasticErrorSign", "ff0000","","","Red","")
call s:X("SyntasticWarningSign", "ffff00","","","Yellow","")
call s:X("SyntasticError", "", "", "", "White", "")
call s:X("SyntasticWarning", "", "", "", "White", "")
" highlight SyntasticErrorLine guibg=#2f000

" ALE linter highlighting
call s:X("ALEError", "", "", "", "", "")
" call s:X("ALEErrorSign", "", "550000", "", "Red", "")
call s:X("ALEErrorSign","AA0000", "",  "", "Red", "")
call s:X("ALEWarning", "", "", "", "", "")
" call s:X("ALEWarning", "", "000055", "", "", "Blue")
" call s:X("ALEErrorLine", "", "550000", "", "Red", "")
" hi! link ALEWarning Warning
" hi! link ALEWarningLine Warning
" hi! link ALEWarningSign Warning
" ALEErrorSign
" ALEInfoSign
" ALEInfoLine
" ALEStyleError
" ALEStyleErrorSign
" ALEStyleWarning
" ALEStyleWarningSign
" ALEVirtualTextError
" ALEVirtualTextInfo
" ALEVirtualTextStyleError
" ALEVirtualTextStyleWarning
" ALEVirtualTextWarning

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")
