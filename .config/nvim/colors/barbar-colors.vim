
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

let s:bg= 'NONE'
let s:bg_alt         = '#21242b'
let s:bg_highlight   = '#2E323C'
let s:bg_popup       = '#0c0c0c'
let s:bg_widget      = s:bg
let s:bg_statusline  = s:bg_popup
" let s:bg_visual      = color#Lighten(s:base2, 0.3)
let s:bg_selection   = s:dark_blue
let s:bg_highlighted = '#4A4A45'

let s:fg           = '#bbc2cf'
let s:fg_alt       = '#5B6268'
let s:fg_widget    = s:fg
let s:fg_popup     = '##bbc2cf'
let s:fg_conceal   = s:base4
let s:fg_subtle    = s:base7
" let s:fg_highlight = color#Lighten(s:fg, 0.2)
let s:fg_linenr    = s:base4

let s:highlight       = s:blue
let s:highlight_color = s:base0

" let s:tag    = color#Mix(s:blue, s:cyan)

let s:diff_info_fg  = s:blue
" let s:diff_info_bg0 = color#Mix('#D8EEFD', s:bg, 0.6)
" let s:diff_info_bg1 = color#Mix('#D8EEFD', s:bg, 0.8)

let s:diff_add_fg  = s:green
" let s:diff_add_fg0 = color#Mix(s:green,   s:fg, 0.4)
" let s:diff_add_bg0 = color#Mix('#506d5b', s:bg, 0.4)
" let s:diff_add_bg1 = color#Mix('#acf2bd', s:bg, 0.6)
" let s:diff_add_bg2 = color#Mix('#acf2bd', s:bg, 0.8)

let s:gh_danger_fg  = s:red
" let s:gh_danger_fg0 = color#Mix(s:red,     s:fg, 0.6)
" let s:gh_danger_bg0 = color#Mix('#ffdce0', s:bg, 0.6)
" let s:gh_danger_bg1 = color#Mix('#ffdce0', s:bg, 0.8)
" let s:gh_danger_bg2 = color#Mix('#ffdce0', s:bg, 0.9)

" }}}
" General UI                                                                 {{{

call s:_('Normal',            s:fg,           s:bg)
call s:_('EndOfBuffer',       s:fg,           s:bg)
" call s:_('NormalPopup',       s:fg_highlight, s:bg_popup)
" call s:_('NormalPopover',     s:fg_highlight, s:bg_popup)
" call s:_('NormalPopupPrompt', s:base7,        color#Darken(s:bg_popup, 0.3), 'bold')
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

" call s:_('Visual',         '', s:bg_visual)
" call s:_('VisualBold',     '', s:bg_visual, 'bold')

call s:_('WildMenu',       s:fg,            s:bg_selection)

call s:_('StatusLine',       s:base8,  s:bg_statusline, 'none')
call s:_('StatusLineNC',     s:base6,  s:bg_statusline, 'none')
call s:_('StatusLinePart',   s:base6,  s:bg_statusline, 'bold')
call s:_('StatusLinePartNC', s:base6,  s:bg_statusline, 'bold')

call s:_('Separator', s:fg_alt, 'none')
call s:_('VertSplit', s:base4,   s:bg, 'none')

" Auto-completion

" hi! Pmenu guifg=#99aacc guibg=#001818  ctermbg=234 ctermfg=250
" hi! PmenuSel guifg=#bceeff guibg=#226888 ctermbg=23 ctermfg=255
" hi! PmenuThumb ctermbg=23 ctermfg=255
" hi! NormalFloat guifg=#99aacc guibg=#100812  ctermbg=234 ctermfg=250

" if exists('&pumblend')
"   set pumblend=20
" end

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

" call s:_('BufferPart',        s:diff_info_fg,   s:diff_info_bg0, 'bold')

" }}}
