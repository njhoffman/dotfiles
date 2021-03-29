" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                               "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellybeans.vim
" URL:          github.com/nanotech/jellybeans.vim
" Scripts URL:  vim.org/scripts/script.php?script_id=2555
" Maintainer:   NanoTech (nanotech.nanotechcorp.net)
" Version:      1.7
" Last Change:  June 21st, 2019
" License:      MIT

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans"

if has("gui_running") || (has('termguicolors') && &termguicolors)
  let s:true_color = 1
else
  let s:true_color = 0
endif

if s:true_color || &t_Co >= 88
  let s:low_color = 0
else
  let s:low_color = 1
endif

" Configuration Variables:
" - g:jellybeans_overrides          (default = {})
" - g:jellybeans_use_lowcolor_black (default = 0)
" - g:jellybeans_use_gui_italics    (default = 1)
" - g:jellybeans_use_term_italics   (default = 0)

let s:background_color = "151515"

if exists("g:jellybeans_overrides")
  let s:overrides = g:jellybeans_overrides
else
  let s:overrides = {}
endif

" Backwards compatibility
if exists("g:jellybeans_background_color")
  \ || exists("g:jellybeans_background_color_256")
  \ || exists("g:jellybeans_use_term_background_color")

  let s:overrides = deepcopy(s:overrides)

  if !has_key(s:overrides, "background")
    let s:overrides["background"] = {}
  endif

  if exists("g:jellybeans_background_color")
    let s:overrides["background"]["guibg"] = g:jellybeans_background_color
  endif

  if exists("g:jellybeans_background_color_256")
    let s:overrides["background"]["256ctermbg"] = g:jellybeans_background_color_256
  endif

  if exists("g:jellybeans_use_term_background_color")
    \ && g:jellybeans_use_term_background_color
    let s:overrides["background"]["ctermbg"] = "NONE"
    let s:overrides["background"]["256ctermbg"] = "NONE"
  endif
endif

if exists("g:jellybeans_use_lowcolor_black") && g:jellybeans_use_lowcolor_black
  let s:termBlack = "Black"
else
  let s:termBlack = "Grey"
endif

" When `termguicolors` is set, Vim[^1] ignores `hi Normal guibg=NONE`
" after Normal's `guibg` is already set to a color. See:
"
" - https://github.com/vim/vim/issues/981
" - https://github.com/nanotech/jellybeans.vim/issues/64
"
" To work around this, ensure we don't set the default background
" color before an override changes it to `NONE` by ensuring that the
" background color isn't set to a value different from its override.
"
" [^1]: Tested on 8.0.567. Does not apply to Neovim.
"
if has_key(s:overrides, "background") && has_key(s:overrides["background"], "guibg")
    let s:background_color = s:overrides["background"]["guibg"]
endif

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellybeans.vim by Daniel Herbert

if &t_Co == 88

  " returns an approximate grey index for the given grey level
  fun! s:grey_number(x)
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! s:grey_level(n)
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  endfun

  " returns the palette index for the given grey index
  fun! s:grey_color(n)
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! s:rgb_number(x)
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  endfun

  " returns the actual color level for the given color index
  fun! s:rgb_level(n)
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! s:rgb_color(x, y, z)
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  endfun

else " assuming &t_Co == 256

  " returns an approximate grey index for the given grey level
  fun! s:grey_number(x)
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! s:grey_level(n)
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endfun

  " returns the palette index for the given grey index
  fun! s:grey_color(n)
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! s:rgb_number(x)
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun! s:rgb_level(n)
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! s:rgb_color(x, y, z)
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endfun

endif

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " map greys directly (see xterm's 256colres.pl)
  if &t_Co == 256 && a:r == a:g && a:g == a:b && a:r > 3 && a:r < 243
    return (a:r - 8) / 10 + 232
  endif

  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

fun! s:is_empty_or_none(str)
  return empty(a:str) || a:str ==? "NONE"
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  if s:is_empty_or_none(a:rgb)
    return "NONE"
  endif
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

fun! s:prefix_highlight_value_with(prefix, color)
  if s:is_empty_or_none(a:color)
    return "NONE"
  else
    return a:prefix . a:color
  endif
endfun

fun! s:remove_italic_attr(attr)
  let l:attr = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
  if empty(l:attr)
    let l:attr = "NONE"
  endif
  return l:attr
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:cmd = "hi ".a:group.
    \ " ctermfg=".s:prefix_highlight_value_with("", a:lcfg).
    \ " ctermbg=".s:prefix_highlight_value_with("", a:lcbg)
  else
    let l:cmd = "hi ".a:group.
    \ " guifg=".s:prefix_highlight_value_with("#", a:fg).
    \ " guibg=".s:prefix_highlight_value_with("#", a:bg)
    if !s:true_color
      let l:cmd = l:cmd.
      \ " ctermfg=".s:rgb(a:fg).
      \ " ctermbg=".s:rgb(a:bg)
    endif
  endif

  let l:attr = s:prefix_highlight_value_with("", a:attr)

  if exists("g:jellybeans_use_term_italics") && g:jellybeans_use_term_italics
    let l:cterm_attr = l:attr
  else
    let l:cterm_attr = s:remove_italic_attr(l:attr)
  endif

  if !exists("g:jellybeans_use_gui_italics") || g:jellybeans_use_gui_italics
    let l:gui_attr = l:attr
  else
    let l:gui_attr = s:remove_italic_attr(l:attr)
  endif

  let l:cmd = l:cmd." gui=".l:gui_attr." cterm=".l:cterm_attr
  exec l:cmd
endfun
" }}}

call s:X("Normal","e8e8d3",s:background_color,"","White","")
set background=dark

" call s:X("CursorLine","","1c1c1c","","",s:termBlack)
" call s:X("CursorColumn","","1c1c1c","","",s:termBlack)

" Some of Terminal.app's default themes have a cursor color
" too close to Jellybeans' preferred MatchParen background
" color to be easily distinguishable. Other terminals tend
" to use a brighter cursor color.
"
" Use a more distinct color in Terminal.app, and also in
" low-color terminals if the preferred background color is
" not available.
if !has('gui_running') && $TERM_PROGRAM == "Apple_Terminal"
    let s:matchParenGuiFg = "dd0093"
    let s:matchParenGuiBg = "000000"
else
    let s:matchParenGuiFg = "ffffff"
    let s:matchParenGuiBg = "556779"
endif
if s:termBlack != "Black"
    let s:matchParenTermFg = "Magenta"
    let s:matchParenTermBg = ""
else
    let s:matchParenTermFg = ""
    let s:matchParenTermBg = s:termBlack
endif
call s:X("MatchParen",s:matchParenGuiFg,s:matchParenGuiBg,"bold",
\                     s:matchParenTermFg,s:matchParenTermBg)

call s:X("TabLine","000000","b0b8c0","italic","",s:termBlack)
call s:X("TabLineFill","9098a0","","","",s:termBlack)
call s:X("TabLineSel","000000","f0f0f0","italic,bold",s:termBlack,"White")

" Auto-completion
call s:X("Pmenu","ffffff","606060","","White",s:termBlack)
call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")

call s:X("Visual","","404040","","",s:termBlack)
call s:X("Cursor",s:background_color,"b0d0f0","","","")

call s:X("LineNr","605958",s:background_color,"",s:termBlack,"")
call s:X("CursorLineNr","ccc5c4","","","White","")
call s:X("Comment","888888","","italic","Grey","")
call s:X("Todo","c7c7c7","","bold","White",s:termBlack)

call s:X("StatusLine","000000","dddddd","italic","","White")
call s:X("StatusLineNC","ffffff","403c41","italic","White","Black")
call s:X("VertSplit","777777","403c41","",s:termBlack,s:termBlack)
call s:X("WildMenu","f0a0c0","302028","","Magenta","")

call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")
call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
call s:X("SignColumn","777777","","","",s:termBlack)
call s:X("ColorColumn","","000000","","",s:termBlack)

call s:X("Title","70b950","","bold","Green","")

call s:X("Constant","cf6a4c","","","Red","")
call s:X("Special","799d6a","","","Green","")
call s:X("Delimiter","668799","","","Grey","")

call s:X("String","99ad6a","","","Green","")
call s:X("StringDelimiter","556633","","","DarkGreen","")

call s:X("Identifier","c6b6ee","","","LightCyan","")
call s:X("Structure","8fbfdc","","","LightCyan","")
call s:X("Function","fad07a","","","Yellow","")
call s:X("Statement","8197bf","","","DarkBlue","")
call s:X("PreProc","8fbfdc","","","LightBlue","")

hi! link Operator Structure
hi! link Conceal Operator

call s:X("Type","ffb964","","","Yellow","")
call s:X("NonText","606060",s:background_color,"",s:termBlack,"")

call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")

call s:X("Search","f0a0c0","302028","underline","Magenta","")

call s:X("Directory","dad085","","","Yellow","")
call s:X("ErrorMsg","","902020","","","DarkRed")
hi! link Error ErrorMsg
hi! link MoreMsg Special
call s:X("Question","65C254","","","Green","")


" Spell Checking

call s:X("SpellBad","","902020","underline","","DarkRed")
call s:X("SpellCap","","0000df","underline","","Blue")
call s:X("SpellRare","","540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2D7067","underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff (:help hl-DiffAdd)

" hi! DiffAdd ctermbg=232 guibg=#002000
" hi! DiffDelete ctermbg=234 guibg=#301014
call s:X("DiffAdd","","001000","","","DarkGreen")
call s:X("DiffDelete","","300000","","","DarkRed")
call s:X("DiffChange","","001030","","","DarkBlue")
call s:X("DiffText","","001030","italic","","")
" call s:X("DiffAdd","D2EBBE","001000","","White","DarkGreen")
" call s:X("DiffDelete","40000A","300000","","DarkRed","DarkRed")
" call s:X("DiffChange","","2B5B77","","White","DarkBlue")
" call s:X("DiffText","8fbfdc","000000","reverse","Yellow","")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","c59f6f","","","Red","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass","447799","","","DarkBlue","")
call s:X("rubyIdentifier","c6b6fe","","","Cyan","")
hi! link rubyConstant Type
hi! link rubyFunction Function

call s:X("rubyInstanceVariable","c6b6fe","","","Cyan","")
call s:X("rubySymbol","7697d6","","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
call s:X("rubyControl","7597c6","","","Blue","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

call s:X("rubyRegexpDelimiter","540063","","","Magenta","")
call s:X("rubyRegexp","dd0093","","","DarkMagenta","")
call s:X("rubyRegexpSpecial","a40073","","","Magenta","")

call s:X("rubyPredefinedIdentifier","de5577","","","Red","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Elixir

hi! link elixirAtom rubySymbol


" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp
hi! link javaScriptTemplateVar StringDelim
hi! link javaScriptTemplateDelim Identifier
hi! link javaScriptTemplateString String

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" HTML

hi! link htmlTag Statement
hi! link htmlEndTag htmlTag
hi! link htmlTagName htmlTag

" XML

hi! link xmlTag Statement
hi! link xmlEndTag xmlTag
hi! link xmlTagName xmlTag
hi! link xmlEqual xmlTag
hi! link xmlEntity Special
hi! link xmlEntityPunct xmlEntity
hi! link xmlDocTypeDecl PreProc
hi! link xmlDocTypeKeyword PreProc
hi! link xmlProcessingDelim xmlAttrib

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","232323","","","")
call s:X("IndentGuidesEven","","1b1b1b","","","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","B9ED67","405026","","White","Green")

" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !s:low_color
  hi StatusLineNC ctermbg=235
  hi Folded ctermbg=236
  hi DiffText ctermfg=81
  hi DbgBreakPt ctermbg=53
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

if !empty("s:overrides")
  fun! s:current_attr(group)
    let l:synid = synIDtrans(hlID(a:group))
    let l:attrs = []
    for l:attr in ["bold", "italic", "reverse", "standout", "underline", "undercurl"]
      if synIDattr(l:synid, l:attr, "gui") == 1
        call add(l:attrs, l:attr)
      endif
    endfor
    return join(l:attrs, ",")
  endfun
  fun! s:current_color(group, what, mode)
    let l:color = synIDattr(synIDtrans(hlID(a:group)), a:what, a:mode)
    if l:color == -1
      return ""
    else
      return substitute(l:color, "^#", "", "")
    endif
  endfun
  fun! s:load_color_def(group, def)
    call s:X(a:group, get(a:def, "guifg", s:current_color(a:group, "fg", "gui")),
    \                 get(a:def, "guibg", s:current_color(a:group, "bg", "gui")),
    \                 get(a:def, "attr", s:current_attr(a:group)),
    \                 get(a:def, "ctermfg", s:current_color(a:group, "fg", "cterm")),
    \                 get(a:def, "ctermbg", s:current_color(a:group, "bg", "cterm")))
    if !s:low_color
      for l:prop in ["ctermfg", "ctermbg"]
        let l:override_key = "256".l:prop
        if has_key(a:def, l:override_key)
          exec "hi ".a:group." ".l:prop."=".a:def[l:override_key]
        endif
      endfor
    endif
  endfun
  fun! s:load_colors(defs)
    for [l:group, l:def] in items(a:defs)
      if l:group == "background"
        call s:load_color_def("LineNr", l:def)
        call s:load_color_def("NonText", l:def)
        call s:load_color_def("Normal", l:def)
      else
        call s:load_color_def(l:group, l:def)
      endif
      unlet l:group
      unlet l:def
    endfor
  endfun
  call s:load_colors(s:overrides)
  delf s:load_colors
  delf s:load_color_def
  delf s:current_color
  delf s:current_attr
endif



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
call s:X("jsxCloseTag", "7F90AA", "", "", "Blue", "")

"**************
" PLUGINS
"**************

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

" vim shortcut line
hi! link vimShortcutLine vimLineComment

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


