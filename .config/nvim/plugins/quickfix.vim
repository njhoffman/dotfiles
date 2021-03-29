" quickfix preview
Plug 'bfrg/vim-qf-preview'

" quick-fix window enhancements
Plug 'romainl/vim-qf'
" nmap <C-p> <Plug>(qf_qf_previous)
" nmap <C-n> <Plug>(qf_qf_next)
" nmap <Leader>x <Plug>(qf_qf_toggle)
" nmap {g <Plug>(qf_loc_previous)
" nmap }g  <Plug>(qf_loc_next)
" nmap <buffer> <C-[> <Plug>(qf_previous_file)
" nmap <buffer> <C-]> <Plug>(qf_next_file)
" nnoremap <silent> >> :<c-u>execute repeat('>',v:count1)<cr>
" nnoremap <silent> << :<c-u>execute repeat('<',v:count1)<cr>
" qf_qf_toggle, qf_qf_toggle_stay, qf_loc_toggle_stay,
" let g:qf_mapping_filegroup_previous = '>'
" let g:qf_mapping_filegroup_next = '<'

" let g:qf_auto_open_quickfix = 0
" nmap ç <Plug>(qf_qf_switch) " jump to/from qf list
" let g:qf_mapping_ack_style = 1
" s - open entry in a new horizontal window
" v - open entry in a new vertical window
" t - open entry in a new tab
" o - open entry and come back
" O - open entry and close the location/quickfix window
" p - open entry in a preview window
let g:qf_auto_resize = 1
let g:qf_max_height = 10
" Dofile norm @q, SaveList LoadList, cwindow, copen, cnxt, cprev
" lopen, qf_qf_switch, lclose,


