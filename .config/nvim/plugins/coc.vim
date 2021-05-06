" Intellisense code completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" debug with: call coc#client#open_log()
" let g:node_client_debug = 1

" use <tab> and <S-tab> to navitate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"  Use <c-space> to trigger completion.
"
" HINT: When manually triggering of completion use CocConfig to set
"   'suggest.autoTrigger' : 'trigger'
" as the default 'always' will constantly check completion options.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()['selected'] != '-1' ? '\<C-y>' : '\<C-g>u\<CR>'
" else
"     inoremap <expr> <cr> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'
" endif

  " Better display for messages
  " set cmdheight=2
  "
  " " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300
  "
  " " don't give |ins-completion-menu| messages.
  " set shortmess+=c
  "
  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif
  " augroup mygroup
  "   autocmd!
  "   " Setup formatexpr specified filetype(s).
  "   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "   " Update signature help on jump placeholder
  "   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " augroup end
  "
  " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)
  "
  " " Remap for do codeAction of current line
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " " Fix autofix problem of current line
  " nmap <leader>qf  <Plug>(coc-fix-current)
  "
  " " Create mappings for function text object, requires document symbols feature of languageserver.
  " xmap if <Plug>(coc-funcobj-i)
  " xmap af <Plug>(coc-funcobj-a)
  " omap if <Plug>(coc-funcobj-i)
  " omap af <Plug>(coc-funcobj-a)
  "
  " " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  " nmap <silent> <C-d> <Plug>(coc-range-select)
  " xmap <silent> <C-d> <Plug>(coc-range-select)
  "
  " " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  "
  " " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  "
  " " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  "
  " " Add status line support, for integration with other plugin, checkout `:h coc-status`
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  function! FloatScroll(forward) abort
    let float = coc#util#get_float()
    if !float | return '' | endif
    let buf = nvim_win_get_buf(float)
    let buf_height = nvim_buf_line_count(buf)
    let win_height = nvim_win_get_height(float)
    if buf_height < win_height | return '' | endif
    let pos = nvim_win_get_cursor(float)
    if a:forward
      if pos[0] == 1
        let pos[0] += 3 * win_height / 4
      elseif pos[0] + win_height / 2 + 1 < buf_height
        let pos[0] += win_height / 2 + 1
      else
        let pos[0] = buf_height
      endif
    else
      if pos[0] == buf_height
        let pos[0] -= 3 * win_height / 4
      elseif pos[0] - win_height / 2 + 1  > 1
        let pos[0] -= win_height / 2 + 1
      else
        let pos[0] = 1
      endif
    endif
    call nvim_win_set_cursor(float, pos)
    return ''
  endfunction

  inoremap <silent><expr> <down> coc#util#has_preview() ? FloatScroll(1) : "\<down>"
  inoremap <silent><expr>  <up>  coc#util#has_preview() ? FloatScroll(0) :  "\<up>"

