Plug 'yuttie/comfortable-motion.vim'
" default C-e C-y
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" default key mappings
let g:comfortable_motion_no_default_key_mappings = 1
" nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>
"
" friction and air resistance defaults
" let g:comfortable_motion_interval = 1000.0 / 60
" let g:comfortable_motion_friction = 80.0
" let g:comfortable_motion_air_drag = 2.0

" Feel free to increase/decrease this value.
let g:comfortable_motion_impulse_multiplier = 2

" TODO: achieve the same for shift-{ / shift-}


