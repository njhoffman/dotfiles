
" tags view/search
Plug 'liuchengxu/vista.vim'

nnoremap <Leader>v :Vista!!<CR>
nnoremap <Leader>vf :Vista finder<CR>
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" You can add a mapping to `/` in order to open the vista finder for
" searching by adding the following autocommand in your vimrc:
"  autocmd FileType vista,vista_kind nnoremap <buffer> <silent> \
"              / :<c-u>call vista#finder#fzf#Run()<CR>

" highlighting defaults
" hi VistaFloat ctermbg=237 guibg=#3a3a3a

  " `:Vista coc`       open vista window based on coc.nvim.
  " `:Vista ale`       open vista window based on ale.
  " `:Vista lcn`       open vista window based on LanguageClient-neovim.
  " `:Vista ctags`     open vista window based on ctags.
  " `:Vista vim_lsp`   open vista window based on vim-lsp.
  " `:Vista vim_lsc`   open vista window based on vim-lsc.
  " `:Vista nvim_lsp`  open vista window based on nvim-lsp.

let g:vista_executive_for = {
    \ 'js' : 'coc',
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp',
    \ 'vimwiki': 'markdown',
    \ 'pandoc': 'markdown',
    \ 'markdown': 'toc',
    \ }

let g:vista_stay_on_open = 0
let g_vista_keep_fzf_colors = 1
let g:vista_cursor_delay = 100

let g:vista_cpp_executive = 'vim_lsp'
" let g:vista_finder_alternative_executives = 'ctags'
" ehco, scroll, floating_win, both
let g:vista_echo_floating_strategy = 'both'
let g:vista_update_on_text_change = 1
let g:vista_update_on_text_changed_delay= 100
" hi VistaFloat ctermbg=237 guibg=#3a3a3a
" hi VistaLineNr guibg=#ba8260
