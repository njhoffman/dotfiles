
function! airline#themes#hoffman#refresh()
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Options
  """"""""""""""""""""""""""""""""""""""""""""""""
  let s:background  = get(g:, 'airline_hoffman_bg', &background)
  let s:ansi_colors = 0
  let s:tty         = &t_Co == 8

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Colors
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Base colors
  let s:base03  = {'t': s:ansi_colors ?   8 : (s:tty ? '0' : 234), 'g': '#002b36'}
  let s:base02  = {'t': s:ansi_colors ? '0' : (s:tty ? '0' : 235), 'g': '#073642'}
  let s:base01  = {'t': s:ansi_colors ?  10 : (s:tty ? '0' : 247), 'g': '#586e75'}
  let s:base00  = {'t': s:ansi_colors ?  11 : (s:tty ? '7' : 255), 'g': '#657b83'}
  let s:base0   = {'t': s:ansi_colors ?  12 : (s:tty ? '7' : 242), 'g': '#839496'}
  let s:base1   = {'t': s:ansi_colors ?  14 : (s:tty ? '7' : 245), 'g': '#93a1a1'}
  let s:base2   = {'t': s:ansi_colors ?   7 : (s:tty ? '7' : 254), 'g': '#eee8d5'}
  let s:base3   = {'t': s:ansi_colors ?  15 : (s:tty ? '7' : 230), 'g': '#fdf6e3'}
  let s:yellow  = {'t': s:ansi_colors ?   3 : (s:tty ? '3' : 136), 'g': '#b58900'}
  let s:orange  = {'t': s:ansi_colors ?   9 : (s:tty ? '1' : 130), 'g': '#cb4b16'}
  let s:red     = {'t': s:ansi_colors ?   1 : (s:tty ? '1' : 160), 'g': '#dc322f'}
  let s:magenta = {'t': s:ansi_colors ?   5 : (s:tty ? '5' : 125), 'g': '#d33682'}
  let s:beige = {'t': s:ansi_colors ?   5 : (s:tty ? '5' : 61), 'g': '#d33682'}
  let s:violet  = {'t': s:ansi_colors ?  13 : (s:tty ? '5' : 57 ), 'g': '#6c71c4'}
  let s:blue    = {'t': s:ansi_colors ?   4 : (s:tty ? '4' : 33 ), 'g': '#268bd2'}
  let s:lightblue = {'t': s:ansi_colors ?   6 : (s:tty ? '6' : 81 ), 'g': '#2aa198'}
  let s:bluegreen = {'t': s:ansi_colors ?   6 : (s:tty ? '6' : 24 ), 'g': '#2aa198'}
  let s:cyan    = {'t': s:ansi_colors ?   6 : (s:tty ? '6' : 37 ), 'g': '#2aa198'}
  let s:green   = {'t': s:ansi_colors ?   2 : (s:tty ? '2' : 29 ), 'g': '#859900'}
  let s:green2   = {'t': s:ansi_colors ?   2 : (s:tty ? '2' : 42 ), 'g': '#859900'}

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Simple mappings
  " NOTE: These are easily tweakable mappings. The actual mappings get
  " the specific gui and terminal colors from the base color dicts.
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Normal mode
    let s:N1 = [s:base00, s:bluegreen, 'bold'] " mode
    let s:N2 = [s:base2, s:base02, '']  " right file encoding
    let s:N3 = [s:base2, s:base02, ''] " file name
    let s:N4 = [s:base1, s:base02, ''] " file type & tag
    let s:NF = [s:orange, s:N3[1], '']
    let s:NW = [s:base3, s:orange, '']

    let s:NM = [s:red, s:N3[1], '']
    let s:NMi = [s:base2, s:N3[1], '']

    " Insert mode
    let s:I1 = [s:N1[0], s:green, 'bold']
    let s:I2 = s:N2
    let s:I3 = s:N3
    let s:I4 = s:N4
    let s:IF = s:NF
    let s:IM = s:NM

    " Visual mode
    let s:V1 = [s:N1[0], s:violet, 'bold']
    let s:V2 = s:N2
    let s:V3 = s:N3
    let s:V4 = s:N4
    let s:VF = s:NF
    let s:VM = s:NM

    " Replace mode
    let s:R1 = [s:N1[0], s:red, '']
    let s:R2 = s:N2
    let s:R3 = s:N3
    let s:R4 = s:N4
    let s:RM = s:NM
    let s:RF = s:NF

let s:IA = [s:base0, s:base03, '']

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Actual mappings
  """"""""""""""""""""""""""""""""""""""""""""""""
  let s:NFa = [s:NF[0].g, s:NF[1].g, s:NF[0].t, s:NF[1].t, s:NF[2]]
  let s:IFa = [s:IF[0].g, s:IF[1].g, s:IF[0].t, s:IF[1].t, s:IF[2]]
  let s:VFa = [s:VF[0].g, s:VF[1].g, s:VF[0].t, s:VF[1].t, s:VF[2]]
  let s:RFa = [s:RF[0].g, s:RF[1].g, s:RF[0].t, s:RF[1].t, s:RF[2]]

  let g:airline#themes#hoffman#palette = {}
  let g:airline#themes#hoffman#palette.accents = {

        \ 'red': s:NFa,
        \ }

  let g:airline#themes#hoffman#palette.inactive = airline#themes#generate_color_map(
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]])
  let g:airline#themes#hoffman#palette.inactive_modified = {
        \ 'airline_c': [s:NMi[0].g, '', s:NMi[0].t, '', s:NMi[2]]}

  " let g:airline#themes#hoffman#palette.normal = airline#themes#generate_color_map(
  "       \ [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]],
  "       \ [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
  "       \ [s:N3[0].g, s:N3[1].g, s:N3[0].t, s:N3[1].t, s:N3[2]])

  let g:airline#themes#hoffman#palette.normal = {
        \ 'airline_a' : [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]],
        \ 'airline_b' : [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
        \ 'airline_c' : [s:N3[0].g, s:N3[1].g, s:N3[0].t, s:N3[1].t, s:N3[2]],
        \ 'airline_x' : [s:N4[0].g, s:N4[1].g, s:N4[0].t, s:N4[1].t, s:N4[2]],
        \ 'airline_y' : [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
        \ 'airline_z' : [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]]}

  let g:airline#themes#hoffman#palette.normal.airline_warning = [
        \ s:NW[0].g, s:NW[1].g, s:NW[0].t, s:NW[1].t, s:NW[2]]

  let g:airline#themes#hoffman#palette.normal_modified = {
        \ 'airline_c': [s:NM[0].g, s:NM[1].g, s:NM[0].t, s:NM[1].t, s:NM[2]]}

  let g:airline#themes#hoffman#palette.normal_modified.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.insert = {
        \ 'airline_a' : [s:I1[0].g, s:I1[1].g, s:I1[0].t, s:I1[1].t, s:I1[2]],
        \ 'airline_b' : [s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]],
        \ 'airline_c' : [s:I3[0].g, s:I3[1].g, s:I3[0].t, s:I3[1].t, s:I3[2]],
        \ 'airline_x' : [s:I4[0].g, s:I4[1].g, s:I4[0].t, s:I4[1].t, s:I4[2]],
        \ 'airline_y' : [s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]],
        \ 'airline_z' : [s:I1[0].g, s:I1[1].g, s:I1[0].t, s:I1[1].t, s:I1[2]]}

  let g:airline#themes#hoffman#palette.insert.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.insert_modified = {
        \ 'airline_c': [s:IM[0].g, s:IM[1].g,
        \ s:IM[0].t, s:IM[1].t, s:IM[2]]}

  let g:airline#themes#hoffman#palette.insert_modified.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.visual = {
        \ 'airline_a' : [s:V1[0].g, s:V1[1].g, s:V1[0].t, s:V1[1].t, s:V1[2]],
        \ 'airline_b' : [s:V2[0].g, s:V2[1].g, s:V2[0].t, s:V2[1].t, s:V2[2]],
        \ 'airline_c' : [s:V3[0].g, s:V3[1].g, s:V3[0].t, s:V3[1].t, s:V3[2]],
        \ 'airline_x' : [s:V4[0].g, s:V4[1].g, s:V4[0].t, s:V4[1].t, s:V4[2]],
        \ 'airline_y' : [s:V2[0].g, s:V2[1].g, s:V2[0].t, s:V2[1].t, s:V2[2]],
        \ 'airline_z' : [s:V1[0].g, s:V1[1].g, s:V1[0].t, s:V1[1].t, s:V1[2]]}


  let g:airline#themes#hoffman#palette.visual.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.visual_modified = {
        \ 'airline_c': [s:VM[0].g, s:VM[1].g,
        \ s:VM[0].t, s:VM[1].t, s:VM[2]]}

  let g:airline#themes#hoffman#palette.visual_modified.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.replace = airline#themes#generate_color_map(
        \ [s:R1[0].g, s:R1[1].g, s:R1[0].t, s:R1[1].t, s:R1[2]],
        \ [s:R2[0].g, s:R2[1].g, s:R2[0].t, s:R2[1].t, s:R2[2]],
        \ [s:R3[0].g, s:R3[1].g, s:R3[0].t, s:R3[1].t, s:R3[2]])

  let g:airline#themes#hoffman#palette.replace.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.replace_modified = {
        \ 'airline_c': [s:RM[0].g, s:RM[1].g,
        \ s:RM[0].t, s:RM[1].t, s:RM[2]]}

  let g:airline#themes#hoffman#palette.replace_modified.airline_warning =
        \ g:airline#themes#hoffman#palette.normal.airline_warning

  let g:airline#themes#hoffman#palette.tabline = {}

  let g:airline#themes#hoffman#palette.tabline.airline_tab = [
        \ s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]]

  let g:airline#themes#hoffman#palette.tabline.airline_tabtype = [
        \ s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]]
  let s:SE = [ '#ffffff', '#ff0000' , 221 , 52 ]

  let g:airline#themes#hoffman#palette.normal.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.normal_modified.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.visual.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.visual_modified.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.insert.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.insert_modified.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.replace.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.replace_modified.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.inactive.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]
  let g:airline#themes#hoffman#palette.inactive_modified.airline_error = [s:SE[0], s:SE[1], s:SE[2], s:SE[3]]

endfunction

call airline#themes#hoffman#refresh()

