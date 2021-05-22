" settings that may way to be changed session to session
"
" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" tabs -> :list :retab
nnoremap <Leader><S-T> :retab <CR>
nnoremap <Leader><S-W> <CR>:set list!<CR>

" fix popup menu navigation compatibility problem
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi


" better commandline mode mappings
cnoremap <silent> <M-[> <C-u>:History:<CR>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
" <C-n>: next history.
" cnoremap <C-n>          <Down>
" <C-p>: previous history.
" cnoremap <C-p>          <Up>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
" <C-g>: Exit.
cnoremap <C-g>          <C-c>
nnoremap q; q:

" Disable ex mode
nnoremap Q <Nop>

" map underscore to remove search highlighting
nnoremap <silent> _ :nohl<CR>

" Blink current search match
nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>
nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>
function! s:BlinkCurrentMatch()
  let target = '\c\%#'.@/
  let match = matchadd('IncSearch', target)
  redraw
  sleep 100m
  call matchdelete(match)
  redraw
endfunction

" map vertical/horizontal splits
" nnoremap <silent> <Leader>w vsplit <CR>
" nnoremap <silent> <Leader>v :split<CR>
nnoremap <silent> <Leader>H :vnew <CR>
nnoremap <silent> <Leader>V :new<CR>


" parse buffer into tab split columns
command! -range Columnify
      \  %!sed 's/"\t"/\&/' | column -t -s '&'<CR>

" map close exit vim
nnoremap <silent> <Leader>x :q<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <C-x> :x<CR>

" map switch window focus to next window
" nnoremap <silent> <Leader>; <C-W>w
nnoremap <silent> <Leader>; <C-W><C-p>

" map fullscreen height/width, equal heights
nnoremap <silent> <Leader>_ <C-w>_
nnoremap <silent> <Leader>\| <C-w>\|
nnoremap <silent> <Leader>= <C-w>=

" close non-focused window
nnoremap <silent> <Leader>q <C-w><C-p>:q<CR>

"
" resizing
" C-W make all equal, C-W -/+ change height, CTRL-W >/< change width
nnoremap + 4<C-W>+
nnoremap - 4<C-W>-

nnoremap <silent>T :tabnext<CR>
nnoremap <silent><Leader>t :tabnext<CR>

" map close buffer
" nnoremap <silent> <Leader>d :bd<CR>
nnoremap <silent> <Leader>d :Sayonara<CR>

" barbar
map <silent> H :BufferPrev<CR>
map <silent> L :BufferNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>


" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>

" go to jumplist
" nmap <Leader>jl :call GotoJump()<CR>

" map current directory
nnoremap <silent> <Leader>cd :cd %:h<CR>
nnoremap <silent> <Leader>cdh :cd ~<CR>
nnoremap <silent> <Leader>cdr :cd /<CR>

" toggle fold under cursor
nnoremap <silent> zz zA
nnoremap <silent> <Leader>z zA
" close all folds
nnoremap <silent> zZ zM
" open all folds
nnoremap <silent> ZZ zR

" insert new line and switch to insert mode
nmap <M-CR> i<CR><Esc>O

" restart neovim
nnoremap <Leader>r :Restart<CR>:lua require('feline').reset_highlights()<CR>
" lua require('feline').reset_highlights()

" remap join lines to ,j (slow for some reason)
" nnoremap <silent> <Leader>j J

" tab control
" Use :hide to get rid of all windows unless you really need them open.
" Use <C-W>L, <C-W>H etc to move windows around. Don't forget :tab sp to open the current file (or a new one) in a new tab.
" :map <LEFT> <C-W>h and :map <RIGHT> <C-W>l, etc make it much easier to move between windows. :map <C-LEFT> :tabprev<CR> and :map <C-RIGHT> :tabnext<CR> make it much easier to move between tabs.

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <Leader>ts :tabnew split<CR>

" ctrl+s in insert mode to save and enter normal mode
inoremap <silent> <C-s> <Esc>:w <CR>
nnoremap <silent> <C-s> :w<CR>

" Plugin Key Mapping
nnoremap <Leader>e :e $HOME/projects/scratchpads/js/scratchpad.js<CR>
" nnoremap <A-r> :FloatermRepl<CR>
" vnoremap <A-r> :FloatermRepl<CR>

" Shift+U undotree
nnoremap U :UndotreeToggle<cr>

nnoremap <silent> <A-t> :AsyncTaskFzf<CR>

" :" Select files from selected resources (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)

" map <silent> <A-p> :<C-u>FzfPreviewFromResources buffer project<CR>
" map <silent> <A-p> :<C-u>FzfPreviewDirectoryFiles <C-R>=$HOME<CR><CR>
map <silent> <C-p> :<C-u>call GFilesFallback()<CR>
map <silent> <A-p> :<C-u>FzfPreviewFromResources old<CR>

map <silent> <A-o> :<C-u>FzfPreviewDirectoryFiles ~<CR>

map <silent> <C-t> :<C-u>AsyncTaskFzf <CR>
map <silent> <A-t> :<C-u>AsyncTaskFzf <CR>

map <silent> <C-y> :<C-u>FzfPreviewYankround<CR>
map <silent> <A-y> :<C-u>Snippets<CR>

map <silent> <C-g> :<C-u>FzfPreviewGitActions<CR>
map <silent> <A-g> :<C-u>FzfPreviewGitStatus<CR>

map <silent> <C-u> :<C-u>FzfPreviewFromResources old<CR>
map <silent> <A-u> :<C-u>FzfPreviewCommandPalette<CR>

map <silent> <C-d> :<C-u>FzfPreviewGitCurrentLogs<CR>
map <silent> <A-d> :<C-u>FzfPreviewGitLogs<CR>

"  map <silent> <A-s> :<C-u>GGrep<CR>
nnoremap <silent> <A-s> :<C-u>RG<CR>
xnoremap <silent> <C-s> "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

map <silent> <C-e> :FzfPreviewAllBuffers<CR>
map <silent> <A-e> :Sessions<CR>

" map <silent> <A-e> :FzfPreviewBookmarks<CR>

map <silent> <A-/> :Helptags<CR>

" map <silent> <A-r> :FloatermNew --width=0.9 --height=0.7 ranger<CR>

map <silent> <A-j> :FzfPreviewJumps<CR>
map <silent> <A-v> :Vista!!<CR>
map <silent> <A-m> :FzfPreviewLocationList<CR>

" map <silent> <A-m> :FzfPreviewQuickFix<CR>


command! -bang Maps call fzf#vim#maps(' ')
command! -bang NMaps call fzf#vim#maps('n')
command! -bang IMaps call fzf#vim#maps('i')
command! -bang CMaps call fzf#vim#maps('c')
command! -bang TMaps call fzf#vim#maps('t')
command! -bang VMaps call fzf#vim#maps('x')
command! -bang OMaps call fzf#vim#maps('o')
" <Space>	Normal, Visual, Select and Operator-pending
" n	Normal
" v	Visual and Select
" s	Select
" x	Visual
" o	Operator-pending
" !	Insert and Command-line
" i	Insert
" l	":lmap" mappings for Insert, Command-line and Lang-Arg
" c	Command-line
" t	Terminal-Job

" easily exit floating window
nmap <esc> <esc><Plug>(coc-float-hide).

lua vim.lsp.diagnostic.show_line_diagnostics()
" vim-fugitive
nmap <silent><leader>gD :Gdiffsplit<cr>

" goto file from anywhere on line
nnoremap gf ^f/gf

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
"
" Maps, Highlights, Locate <str>, fzf-preview.CocCurrentDiagnostics, Lets, Lists, Maps

nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gL :Commits<CR>
" :Maps :Commands :Helptags :Snippets
" <leader>l => javascript toggle conceal level

" pressing  esc in command line opens up command history window
cmap <silent> <A-O> :History:<CR>

" map <C-\> to exit terminal-mode
tnoremap <C-\> <C-\><C-n>

" let loaded_netrwPlugin = 1
" let g:netrw_banner = 0
" let g:netrw_altfile = 1
" open files from netrw in a previous window, unless we're opening the current dir
" let g:netrw_browse_split = 4

if has('nvim')
  " Increase terminal buffer 10x
  let g:terminal_scrollback_buffer_size = 10000
  " let $TMUX_TUI_ENABLE_SHELL_CURSOR=1
  " Workaround for bug #4299
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" allows selection anywhere while in blockwise-visual mode.
set virtualedit=block

" easy indentation in visual mode (preserves visual selection)
vmap > >gv
vmap < <gv

function! PreviewExists() abort
  for winnum in range(1, winnr('$'))
    if getwinvar(winnum, '&previewwindow')
      return 1
    endif
  endfor
  return 0
endfunction

" Avoid adding to jumping list
nnoremap } :keepjumps normal! }<CR>
nnoremap { :keepjumps normal! {<CR>
nnoremap n :keepjumps normal! n<CR>
nnoremap N :keepjumps normal! N<CR>

" Avoid * jumping to next ocurrence
nnoremap * m' :keepjumps normal! *N<CR>

" ***** visual mode mappings to test out
"
" This maps \y so that it will yank the visual selection and quote the regex
" metacharacters. For example, use v to select some text; type \y; then type
" CTRL-R" to insert the yanked selection with metacharacters escaped.
vmap <silent> <leader>y y:let @"=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>

" pretty up JSON data
" nnoremap <Leader>j !!python -m json.tool<CR>
" nnoremap <Leader>J :%!python -m json.tool<CR>
" vnoremap <Leader>j :!python -m json.tool<CR>

" clear normal/visual mode highlighting
noremap <Space> :<c-u>noh<CR>:echo<CR>

" select put text, via http://stackoverflow.com/a/4775281/955926
nnoremap <expr> gV "`[".getregtype(v:register)[0]."`]"

" make zz/zt/zb work nicely with visual selections
" vnoremap <silent> zz :<c-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<CR>:normal! zzgv<CR>
" vnoremap <silent> zt :<c-u>call setpos('.',[0,line("'<"),0,0])<CR>:normal! ztgv<CR>
" vnoremap <silent> zb :<c-u>call setpos('.',[0,line("'>"),0,0])<CR>:normal! zbgv<CR>

" convert bare words to quoted list words in visual selection
" vnoremap <Leader>' :s/\%V\(\h\+\w*\)\s*/'\1',/g<CR>:noh<CR>:echo<CR>
" convert quoted list words to bare words in visual selection
" vnoremap <Leader>" :s/\%V[',]//g<CR>noh<CR>:echo<CR>:noh<CR>:echo<CR>

" extract selected Python class method code to new method
" vnoremap <Leader>mm cself.newMethodName()<Esc>?^\s*def<CR>:noh<CR>:echo<CR>Odef newMethodName (self):<CR><Esc>k]p>}:%s/newMethodName/

" emacs narrow/widen... sorta (silly, experimental thing)
" vnoremap <Leader>N y:let [f,s,v]=[&ft,&syn,getregtype('@"')]<CR><C-w>nVp:set ft=<c-r>=f<CR> syn=<c-r>=s<CR><CR>:nnoremap <buffer> <Leader>W :let @"=v<C-r>="<"<CR>CR>gg0@"G$d:bw!<C-r>="<"<CR>CR>gvp<CR>

" These mappings extend the spirit of * and # for visual searching.
" Use visual select to select an area, then search for matches by
" typing * or #. This is very useful for searching for other instances of
" long, complex strings that may contain regex methacharacters and multiple
" lines. You don't have to worry about quoting.
" vmap <silent> * y:let @/=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>n
" vmap <silent> # y:let @/=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>N
" vnoremap <silent> * :<C-U>
"               \let old_reg=getreg('"')<bar>
"               \let old_regmode=getregtype('"')<cr>
"               \gvy/<C-R><C-R>=substitute(substitute(
"               \escape(@", '\\/.*$^~[]' ), "\n$", "", ""),
"               \"\n", '\\_[[:return:]]', "g")<cr><cr>
"               \:call setreg('"', old_reg, old_regmode)<cr>
" vnoremap <silent> # :<C-U>
"               \let old_reg=getreg('"')<bar>
"               \let old_regmode=getregtype('"')<cr>
"               \gvy?<C-R><C-R>=substitute(substitute(
"               \escape(@", '\\/.*$^~[]' ), "\n$", "", ""),
"               \"\n", '\\_[[:return:]]', "g")<cr><cr>
"               \:call setreg('"', old_reg, old_regmode)<cr>
" Prevent vim from indenting newlines
" https://vim.fandom.com/wiki/Get_the_correct_indent_for_new_lines_despite_blank_lines

function! IndentIgnoringBlanks(child) abort
  let lnum = v:lnum
  while v:lnum > 1 && getline(v:lnum-1) == ""
    normal k
    let v:lnum = v:lnum - 1
  endwhile
  if a:child == ""
    if ! &l:autoindent
      return 0
    elseif &l:cindent
      return cindent(v:lnum)
    endif
  else
    exec "let indent=".a:child
    if &l:cindent != -1
      return &l:cindent
    endif
  endif
  if v:lnum == lnum && lnum != 1
    return -1
  endif
  let next = nextnonblank(lnum)
  if next == lnum
    return -1
  endif
  if next != 0 && next-lnum <= lnum-v:lnum
    return indent(next)
  else
    return indent(v:lnum-1)
  endif
endfunction

command! -bar IndentIgnoringBlanks
      \ if match(&l:indentexpr,'IndentIgnoringBlanks') == -1 |
      \   if &l:indentexpr == '' |
      \     let b:blanks_indentkeys = &l:indentkeys |
      \     if &l:cindent |
      \       let &l:indentkeys = &l:cinkeys |
      \     else |
      \       setlocal indentkeys=!^F,o,O |
      \     endif |
      \   endif |
      \   let b:blanks_indentexpr = &l:indentexpr |
      \   let &l:indentexpr = "IndentIgnoringBlanks('".
      \   substitute(&l:indentexpr,"'","''","g")."')" |
      \ endif
command! -bar IndentNormally
      \ if exists('b:blanks_indentexpr') |
      \   let &l:indentexpr = b:blanks_indentexpr |
      \ endif |
      \ if exists('b:blanks_indentkeys') |
      \   let &l:indentkeys = b:blanks_indentkeys |
      \ endif

" augroup IndentIgnoringBlanks
"   autocmd!
"   autocmd FileType * IndentIgnoringBlanks
" augroup END

" noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
"             \<Cmd>lua require('hlslens').start()<CR>
" noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
"             \<Cmd>lua require('hlslens').start()<CR>
" noremap * *<Cmd>lua require('hlslens').start()<CR>
" noremap # #<Cmd>lua require('hlslens').start()<CR>
" noremap g* g*<Cmd>lua require('hlslens').start()<CR>
" noremap g# g#<Cmd>lua require('hlslens').start()<CR>

" " use : instead of <Cmd>
nnoremap <silent> <leader>l :nohlsearch<CR>
