
" match more than single letters with '%'

Plug 'andymass/vim-matchup'
let g:matchup_enabled = 1
let g:matchup_matchparen_enabled = 1
let g:matchup_motion_enabled = 1
let g:matchup_text_obj_enabled = 1
let g:matchup_surround_enabled = 1
" let g:matchup_delim_noskips = 1   " recognize symbols within comments
" let g:matchup_delim_noskips = 2   " don't recognize anything in comments
let g:matchup_matchparen_singleton = 0 " highlight words even without match
" nmap <silent> <F7> <plug>(matchup-hi-surround) " highlight surrounding until cursor moves
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1
