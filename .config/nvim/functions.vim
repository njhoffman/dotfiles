" ********** Custom Functions ********** "

" copy debug file and add import line to top of script
" return syntax item under cursor for status line
function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction
command! SyntaxItem call SyntaxItem()

function! SqlFormat()
  if mode()=="v"
    silent execute "'<,'>s%!sqlformat --reindent_aligned --keywords upper --identifiers lower -"
  else
    silent execute "'<,'>%!sqlformat --reindent_aligned --keywords upper --identifiers lower -"
  endif
endfunction
command! SqlFormat call SqlFormat()

" show all active syntax items
" :so $VIMRUNTIME/syntax/hitest.vim

command! SyntaxStack call SynStack()
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" select buffer by partial match
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

function! LogFuncs()
  let file = readfile(expand("%:p")) " read current file
  let lidx = 1
  for line in file
    let match = matchlist(line, '\v%((\w+)\s*:?\s*)?%(function)\s*(\w+)?\s*\((.*)\)')
    if (!empty(match) && !empty(match[1]))
      call append(lidx, "console.info('" . match[1] . "'," .  match[3] . ");")
      let lidx += 1
    endif
    let lidx += 1
  endfor
endfunction
command! LogFuncs call LogFuncs()

" execute shell command and output in new window
function! s:ExecuteInShell(command, bang)
  let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

  if (_ != '')
    let s:_ = _
    let bufnr = bufnr('%')
    let winnr = bufwinnr('^' . _ . '$')
    silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
    silent! :%d
    let message = 'Execute ' . _ . '...'
    call append(0, message)
    echo message
    silent! 2d | resize 1 | redraw
    silent! execute 'silent! %!'. _
    silent! execute 'resize ' . line('$')
    silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
    silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
    silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
    nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
  endif
endfunction

command! -nargs=1 Bs :call BufSel("<args>")
command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
command! -complete=shellcmd -nargs=* -bang Sh call s:ExecuteInShell(<q-args>, '<bang>')

command! -nargs=* Dbg execute ':e ~/.debugger-256.js'

" strip traililng white spaces
function! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction

" strip tabs
function! StripTabs()
 silent! :%s/\t/  /g
endfunction

" go to jump list #
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

function! s:Pulse() "{{{
  " Pulse - An awesome function by Steve Losh
  let current_window = winnr()
  windo set nocursorline
  execute current_window . 'wincmd w'
  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 9
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 *width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi
endfunction
command! -nargs=0 Pulse call s:Pulse()

function! VisualSelection()
  if mode()=="v"
    let [line_start, column_start] = getpos("v")[1:2]
    let [line_end, column_end] = getpos(".")[1:2]
  else
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
  end
  if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
    let [line_start, column_start, line_end, column_end] =
          \   [line_end, column_end, line_start, column_start]
  end
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - 1]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

" opens all files populated in quick fix window (workaround for Ag + fzf)
" :vimgrep /src/ **/*.js
" :QuickFixOpenAll
function!   QuickFixOpenAll()
  if empty(getqflist())
    return
  endif
  let s:prev_val = ""
  for d in getqflist()
    let s:curr_val = bufname(d.bufnr)
    if (s:curr_val != s:prev_val)
      exec "edit " . s:curr_val
    endif
    let s:prev_val = s:curr_val
  endfor
endfunction

command! QuickFixOpenAll         call QuickFixOpenAll()

function! SiblingFiles(A, L, P)
  return map(split(globpath(expand("%:h") . "/", a:A . "*"), "\n"), 'fnamemodify(v:val, ":t")')
endfunction

function! Rename(name, bang)
  let l:curfile = expand("%:p")
  let l:curpath = expand("%:h") . "/"
  let v:errmsg = ""
  silent! exe "saveas" . a:bang . " " . fnameescape(l:curpath . a:name)
  if v:errmsg =~# '^$\|^E329'
    let l:oldfile = l:curfile
    let l:curfile = expand("%:p")
    if l:curfile !=# l:oldfile && filewritable(l:curfile)
      silent exe "bwipe! " . fnameescape(l:oldfile)
      if delete(l:oldfile)
        echoerr "Could not delete " . l:oldfile
      endif
    endif
  else
    echoerr v:errmsg
  endif
endfunction
cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<CR>
command! -nargs=* -complete=customlist,SiblingFiles -bang Rename :call Rename("<args>", "<bang>")

function! FindProjectRoot(lookFor)
  let pathMaker='%:p'
  while(len(expand(pathMaker))>1)
    let pathMaker=pathMaker.':h'
    let fileToCheck=expand(pathMaker).'/'.a:lookFor
    if filereadable(fileToCheck)||isdirectory(fileToCheck)
      return expand(pathMaker)
    endif
  endwhile
  return 0
endfunction

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" use the 'alt' program to quickly load alternate file
" Run a given vim command on the results of alt from a given path.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

function! Try_edit(the_file) abort
  if filereadable(a:the_file)
    execute 'edit ' . a:the_file
  else
    echom 'file wasn''t readable'
  endif
endfunction

function! Cool_gf() abort
  let regex = '[/.]'

  if search(regex,'z',line('.'))
    " search forwards
    let the_file = expand('<cWORD>')
    call Try_edit(the_file)
  elseif search(regex,'b',line('.'))
    " search backwards
    let the_file = expand('<cWORD>')
    call Try_edit(the_file)
  else
    echom 'didn''t find a file'
  endif
endfunction

nnoremap <leader>gf :call Cool_gf()<cr>

" Function to quickly open/hide terminal window inside vim
" Terminal operation  when
" 1. terminal is open in split window, it closes the window (terminal still
"    running)
" 2. terminal open in buffer, it moves window into split window
" 3. no termial instance running then it opens new terminal instance in split
"    window
function Term() abort
  let bufNum = bufnr('term://')
  let termNum = bufwinnr('term://')
  if termNum > 0 && winnr('$') > 1
    execute termNum . 'wincmd c'
  elseif bufNum > 0 && bufNum != bufnr(@%)
    execute 'sb ' . bufNum . ' | wincmd p'
  elseif bufNum == bufnr(@%)
    execute 'bprevious | sb ' . bufNum . ' | wincmd p'
  else
    execute 'sp term://zsh'
  endif
endfunction
command! -bang -nargs=* Term call Term()
nmap <leader><space> :Term<CR>

" Maps Escape button in terminal window
autocmd BufEnter * if !empty(matchstr(@%, "term",0)) | tnoremap <buffer> <Esc> <C-\><C-n> | endif

" Repeat <C-o> or <C-i> jump commands until the current buffer changes
" or no other jumps are available
function FileCO(up)
    let current_buffer = bufnr()

    " Get the jump list and parse the position of the first jump in the list
    " if the number is zero then we reached the top
    redir => jumps_output
    silent jumps
    redir END
    let lastjump = split(jumps_output, '\n')[1]
    let lastjumppos = str2nr(matchstr(lastjump, '\d\+'))

    " Execute the jump command until the buffer changes or there are no more jumps
    while bufnr() == current_buffer && lastjumppos > 0
        if a:up == v:true
            execute "normal! \<c-o>"
        else
            " \<CR> is an ugly hack to do nothing but let the normal command
            " see that it has an argument
            execute "normal! \<CR>\<c-i>"
        endif
        let lastjumppos = lastjumppos - 1
    endwhile
endfunction

" Overriding <C-o> and <C-i> is a bad idea let's prefix them with <leader> instead
nnoremap <silent> <leader><C-o> :call FileCO(v:true)<CR>
nnoremap <silent> <leader><C-i> :call FileCO(v:false)<CR>


" I prefer a more automatic behavior where when cursoring over a word, I see either the diagnostic if it exists, otherwise the documentation. I wrote a snippet to accomplish this:
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction
"
" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction
"
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
"
" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>
