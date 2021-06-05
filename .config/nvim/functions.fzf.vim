""""""""""""

function! GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    " exec "normal :" . prefix . "GFiles\<CR>"
    exec "normal :FzfPreviewFromResources project\<CR>"
  else
    exec "normal :FzfPreviewFromResources directory\<CR>"
    " exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

""""""""""""
" :AsyncTaskFzf
function! FloatingFZF()
  let width = float2nr(&columns * 0.8)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
        \ 'row': (&lines - height) / 2,
        \ 'col': (&columns - width) / 2,
        \ 'width': width,
        \ 'height': height }
  return opts
  " call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

function! s:fzf_task()
  let rows = asynctasks#source(&columns * 48 / 100)
  let source = []
  for row in rows
    let name = row[0]
    let source += [name . '  ' . row[1] . '  : ' . row[2]]
  endfor
  let opts = { 'source': source,
        \ 'sink': function('s:fzf_sink'),
        \ 'window': FloatingFZF(),
        \ 'options': '+m --nth 1 --inline-info --tac' }
  call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()

""""""""""""
" :Registers
function! s:get_registers() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! s:registers(...) abort
  let l:opts = {
        \ 'source': s:get_registers(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "',
        \ 'window': _fzf_get_window_props()
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction

command! -bang Registers call s:registers('<bang>' ==# '!')

""""""""""""
" :Highlights
function! s:get_highlights() abort
  redir => l:hlts
  silent highlight
  redir END
  return split(l:hlts, '\n')[1:]
endfunction

function! s:highlights_handler(hlt)
  echo a:hlt
endfunction

function! s:highlights(...) abort
  let l:opts = {
        \ 'source': s:get_highlights(),
        \ 'sink': function('s:highlights_handler'),
        \ 'options': '--prompt="Hlt> "',
        \ 'highlight': 'WarningMsg' }
  call fzf#run(fzf#wrap(l:opts))
endfunction

command! -bang Highlights call s:highlights('<bang>' ==# '!')


""""""""""""
" :Sessions
function! GetSessions()
  return prosession#ListSessions()
endfunction

function! GoToSession(session)
  let filepath = split(a:session , '\s\+')[0]
  execute "Prosession " . filepath . "\<c-o>"
endfunction
command! Sessions call fzf#run(fzf#wrap({
      \ 'source': GetSessions(),
      \ 'sink': function('GoToSession')}))


""""""""""""
" :Jumps
function! GetJumps()
  redir => cout
  silent jumps
  redir END
  return reverse(split(cout, "\n")[1:])
endfunction

function! GoToJump(jump)
  let jumpnumber = split(a:jump, '\s\+')[0]
  execute "normal " . jumpnumber . "\<c-o>"
endfunction
command! Jumps call fzf#run(fzf#wrap({
      \ 'source': GetJumps(),
      \ 'sink': function('GoToJump')}))

""""""""""""
" Dots
command! Dots call fzf#run(fzf#wrap({
      \ 'source': 'dotbare ls-files --full-name --directory "${DOTBARE_TREE}" | awk -v home="${DOTBARE_TREE}/" "{print home \$0}"',
      \ 'sink': 'e',
      \ 'options': [ '--multi', '--preview', 'cat {}' ]
      \ }))


""""""""""""
" :FASD
command! Fasd call fzf#run(fzf#wrap({'source': 'fasd -a', 'options': '--no-sort --tac --tiebreak=index'}))
command! Fasdd call fzf#run(fzf#wrap({'source': 'fasd -dl', 'options': '--no-sort --tac --tiebreak=index'}))
command! Fasdf call fzf#run(fzf#wrap({'source': 'fasd -fl', 'options': '--no-sort --tac --tiebreak=index'}))
