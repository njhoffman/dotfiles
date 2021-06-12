
let g:nord_bold_vertical_split = 0
let g:nord_cursor_line_number_background = 0
let g:nord_cursorline_transparent = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_underline = 0
lua require("lush")(require("colorschemes.nord"))

" nord_cursor_line_number_background  0 Use the same background on number when cursorline enabled
" nord_uniform_status_lines 0 Use the same background for all statuslines on split windows
" nord_bold_vertical_split_line 0 Lighter background for vertical split
" nord_uniform_diff_background  0 Use forground colours in diffs
" nord_bold 1 Enable bold font
" nord_italic 1 Enable italic font
" nord_italic_comments  0 Use italic font for comments
" nord_underline  0 Enable underlining
