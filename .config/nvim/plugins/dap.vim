
Plug 'mfussenegger/nvim-dap'
nnoremap <leader>ib :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <S-k> :lua require'dap'.step_out()<CR>
" nnoremap <S-l> :lua require'dap'.step_into()<CR>
" nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>in :lua require'dap'.continue()<CR>
nnoremap <leader>i_ :lua require'dap'.run_last()<CR>
nnoremap <leader>ir :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>ii :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
vnoremap <leader>ii :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>i? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>ie :lua require'dap'.set_exception_breakpoints({"all"})<CR>
noremap <leader>ia :lua require'debugHelper'.attach()<CR>

Plug 'theHamsta/nvim-dap-virtual-text'
let g:dap_virtual_text = v:true

