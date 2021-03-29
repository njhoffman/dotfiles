" airline status bar enhancement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-ocean

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" :AirlineTheme {theme-name}
" let g:airline_theme='luna'
let g:airline_enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='jellybeans'
" let g:airline_theme='transparent'
" let g:airline_theme='nord'
"
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_insert=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let w:airline_skip_empty_sections = 1
let g:airline_focuslost_inactive = 1

function! s:update_highlights()
  " hi CursorLine ctermbg=none guibg=none
  " hi VertSplit ctermbg=none guibg=none
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()
" unicode symbols
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" \uF9D2\uF9D4 \uF9D6
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" capslock, commandt, ctrlp, fzf, lsp, languageclient, searchcount, tmuxline, windowswap, nvimlsp, cursormode, zoomwintab
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#ctrlp = 1
let g:airline#extensions#cursormode = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" set marked window indicator string >
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buf_label_first = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes =
      \ ['vimfiler', 'nerdtree']

let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'default'
" default, jsformatter, unique_tail, unique_tail_improved, shortpath
let g:airline#extensions#tabline#buffers_label = '%{ObsessionStatus(''$'', '''')}%{fnamemodify(getcwd(), ":t")}'
" '%{ObsessionStatus(''$'', '''')}',
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#warning_symbol = ' '
let airline#extensions#coc#error_symbol = '  '
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" airline_tab:		default highlighting group for the tabline
" airline_tab_right:	idem, but for the right side of the tabline
"
" airline_tabsel:	highlighting group of the selected item
" airline_tabsel_right: idem, but for the right side of the tabline
" airline_tabmod:       highlighting group for a 'modified' buffer
" airline_tabmod_right: idem, but on the right side
" airline_tabmod_unsel: unselected tab with modified buffer
" airline_tabmod_unsel_right: (unused)
" airline_tabtype:      label group used by ctrlspace and tabws
" airline_tabfill:	highlighting group for the filler space
" airline_tablabel:     highlighting group for the label
" airline_tablabel_right: highlighting group for the label on the right side
" airline_tabhid:	hidden buffer
" airline_tabhid_right: idem, but on the right

"  <> 57520, Hex e0b0, Octal 160260 ee 82 b0
function! AirlineX()
  " output character and selection details in visual mode
  if (mode(1) == 'v' || mode(1) == 'V')
    if mode()=="v"
      let [line_start, column_start] = getpos("v")[1:2]
      let [line_end, column_end] = getpos(".")[1:2]
    else
      let [line_start, column_start] = getpos("'<")[1:2]
      let [line_end, column_end] = getpos("'>")[1:2]
    end

    redir => char_ascii
    silent! execute ":ascii"
    silent! execute "normal g8"
    redir END
    let char_ascii = substitute(char_ascii, '\n', ' ', 'g')
    " return substitute(char_ascii, '[[:cntrl:]]', '', '')
    " return char_ascii
    let line_span = abs(line_end - line_start) + 1
    let char_len = strlen(VisualSelection())
    if (char_len > 1)
      return "Sel " . char_len . " chars" . (line_span > 1 ? ' : ' . line_span . " ln" : "")
    else
      return char_ascii
    endif
  else
    return &syn
  endif
  return ''
endfunction

function! AirlineBlame()
  let blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? blame : ''
endfunction

function! AirlineSnippet()
  if len(UltiSnips#SnippetsInCurrentScope()) > 0
    let curr_key = reverse(keys(UltiSnips#SnippetsInCurrentScope()))[0]
    return curr_key
  endif
  return ""
endfunction

" :echo eval(&statusline[2:]).
function! AirlineInit()
  call airline#parts#define_function('airlineX', 'AirlineX')
  call airline#parts#define_function('airlineSnippet', 'AirlineSnippet')
  let g:airline_section_a = airline#section#create(['mode'])
  " let g:airline_section_b = airline#section#create(['%{fnamemodify(getcwd(), ":t")}'])
  " let g:airline_section_c = airline#section#create(['%f'])
  let g:airline_section_c = airline#section#create(['%{fnamemodify(expand("%f"), ":p:.")}'])

  let g:airline_section_x = airline#section#create_right(['airlineX'])
  let g:airline_section_y = airline#section#create([''])
  " let g:airline_section_y = airline#section#create(['airlineSnippet'])
  let g:airline_section_z = airline#section#create(['0x%B ', 'Ξ %l',':','%c',' %P'])
endfunction
"
" dynamically change airline bar with async status
autocmd User AirlineAfterInit call AirlineInit()


" augroup vimrc
"   " Auto rebuild C/C++ project when source file is updated, asynchronously
"   autocmd BufWritePost *.c,*.cpp,*.h
"         \ let dir=expand('<amatch>:p:h') |
"         \ if filereadable(dir.'/Makefile') || filereadable(dir.'/makefile') |
"         \   execute 'AsyncRun -cwd=<root> make -j8' |
"         \ endif
"   " Auto toggle the quickfix window
"   autocmd User AsyncRunStop
"         \ if g:asyncrun_status=='failure' |
"         \   execute('call asyncrun#quickfix_toggle(8, 1)') |
"         \ else |
"         \   execute('call asyncrun#quickfix_toggle(8, 0)') |
"         \ endif
" augroup END
"
" " Define new accents

" call airline#parts#define_accent('syntastic', 'yellow')
" function! AirlineThemePatch(palette)
"   " [ guifg, guibg, ctermfg, ctermbg, opts ].
"   let a:palette.accents.running = [ '', '', '', '', '' ]
"   let a:palette.accents.success = [ '#00ff00', '' , 'green', '', '' ]
"   let a:palette.accents.failure = [ '#ff0000', '' , 'red', '', '' ]
" endfunction
"
" let g:airline_theme_patch_func = 'AirlineThemePatch'
" let g:airline#themes#jellybeans#palette.normal.airline_error = ['#FFBBBB', '#880000', 88, '']
" let airline_error = ['#FFBBBB', '#880000', 88, '']
" let airline_warning = ['#FFFFFF', '#FF0000', 88, '']
" let g:airline#themes#jellybeans#palette.normal.airline_error = airline_error
" let g:airline#themes#jellybeans#palette.normal.airline_warning = airline_warning

" " set alternate color for modified active/inactive tabs
" autocmd VimEnter *
"    \ let g:airline#themes#molokai#palette.tabline = {
"    \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
"    \    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
"    \ } | :AirlineRefresh
" call airline#highlighter#exec('airline_tablabel', tablabel)
" call airline#highlighter#exec('airline_tab', tab)
" call airline#highlighter#exec('airline_tabsel', tabsel)
" call airline#highlighter#exec('airline_tabtype', tabtype)
" call airline#highlighter#exec('airline_tabfill', tabfill)
" call airline#highlighter#exec('airline_tabmod', tabmod)
" call airline#highlighter#exec('airline_tabmod_unsel', tabmodu)
" call airline#highlighter#exec('airline_tabhid', tabhid)
"
function! AirlineThemePatch(palette)

  let a:palette.normal.airline_tabsel = ['#ccccee', '#114455', 88, '']
  let a:palette.normal.airline_tab = ['', '#000000', '', 'black', '' ]
  let a:palette.normal.airline_tabfill = ['', '#000000', '', 'black', '' ]

  let a:palette.accents.success = [ '#00ff00', '' , 'green', '', '' ]
  let a:palette.accents.failure = [ '#ff0000', '' , 'red', '', '' ]

  " [ guifg, guibg, ctermfg, ctermbg, opts ].
  let airline_error = ['#EEAAAA', '#880000', 88, '']
  " let airline_warning = ['#DDDDAA', '#CC6600', 88, '']
  let a:palette.normal.airline_error = airline_error
  " let a:palette.normal.airline_warning = airline_warning
  let a:palette.normal_modified.airline_error = airline_error
  " let a:palette.normal_modified.airline_warning = airline_warning
  let a:palette.insert.airline_error = airline_error
  " let a:palette.insert.airline_warning = airline_warning
  let a:palette.insert_modified.airline_error = airline_error
  " let a:palette.insert_modified.airline_warning = airline_warning
  let a:palette.replace.airline_error = airline_error
  " let a:palette.replace.airline_warning = airline_warning
  let a:palette.replace_modified.airline_error = airline_error
  " let a:palette.replace_modified.airline_warning = airline_warning
  let a:palette.visual.airline_error = airline_error
  " let a:palette.visual.airline_warning = airline_warning
  let a:palette.visual_modified.airline_error = airline_error
  " let a:palette.visual_modified.airline_warning = airline_warning
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'
"
"
" " Change color of the relevant section according to g:asyncrun_status, a global variable exposed by AsyncRun
" " 'running': default, 'success': green, 'failure': red
" let g:async_status_old = ''
" function! Get_asyncrun_running()
"
"   let async_status = g:asyncrun_status
"   if async_status != g:async_status_old
"
"     if async_status == 'running'
"       call airline#parts#define_accent('asyncrun_status', 'running')
"     elseif async_status == 'success'
"       call airline#parts#define_accent('asyncrun_status', 'success')
"     elseif async_status == 'failure'
"       call airline#parts#define_accent('asyncrun_status', 'failure')
"     endif
"
"     let g:airline_section_x = airline#section#create(['asyncrun_status'])
"     AirlineRefresh
"     let g:async_status_old = async_status
"
"   endif
"
"   return async_status
"
" endfunction
"
" call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
" let g:airline_section_x = airline#section#create(['asyncrun_status'])
" " CtrlP
" if !get(g:, 'loaded_ctrlp', 0)
"   finish
" endif
"
" let s:CP1 = [ s:guiWhite , s:gui01 , s:ctermWhite , s:cterm01  ]
" let s:CP2 = [ s:guiWhite , s:gui03 , s:ctermWhite , s:cterm01  ]
" let s:CP3 = [ s:guiWhite , s:gui0D , s:ctermWhite , s:cterm0D  ]
"
" let g:airline#themes#jellybeans#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)
" :echo airline#themes#jellybeans#palette
