" fuzzy file finder
" install bat for syntax colors (apt-get install bat)
" bat --list-themes | fzf --preview="bat --theme={} --color=always /path/to/file"

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" color: bg, bg+, info, border, spinner, hl, fg, header, fg+, pointer,
" marker, prompt, hl+
" let s:fzf_color = ' '
let s:fzf_color = '--color="bg:#000000,bg+:#002222,border:#006B6B,spinner:#98BC99,header:#55FFFF" '

function! _fzf_get_window_props()
  let l:width = winwidth('%')

  let l:window_w = 0.9
  let l:window_h = 0.85

  if l:width > 160 && l:width < 200
    let l:window_w = 0.85
    let l:window_h = 0.7
  elseif l:width > 200 && l:width < 300
    let l:window_w = 0.7
    let l:window_h = 0.5
  elseif l:width > 300
    let l:window_w = 0.6
    let l:window_h = 0.4
  endif
  return { 'width': l:window_w, 'height': l:window_h, 'highlight': 'Error' }
endfunction


let g:fzf_layout = { 'window': _fzf_get_window_props() }

function! Fzf_files_with_icons(command, ...)
  if a:0 > 0
    let working_dir = a:1
  else
    let working_dir = getcwd()
  end

  function! s:edit_devicon_prepended_file(item)
    let l:file_path = a:item[4:-1]
    execute 'silent e' l:file_path
  endfunction

  let l:width = winwidth('%')
  let l:header = '--header="Open file..." '

  let l:preview = '--preview "~/resources/bin/fzf/vim-preview-devicons.sh {}" '
  let l:style = '--info=inline --preview-window=hidden:bottom:50%:noborder '

  if l:width > 120
    let l:style = '--info=inline --preview-window=bottom:60%:noborder '
  endif
  if l:width > 200
    let l:style = '--info=inline --preview-window=bottom:50%:noborder '
  endif

  let l:fzf_files_options = l:header.l:style.s:fzf_color.l:preview
  let l:window_props = _fzf_get_window_props()

  call fzf#run({
        \ 'source': a:command.' | devicon-lookup',
        \ 'dir': working_dir,
        \ 'sink':   function('s:edit_devicon_prepended_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'window': l:window_props  })
endfunction

function! Fzf_history_files_with_icons()
  function! s:edit_devicon_prepended_file_diff(item)
    echom a:item
    let l:file_path = a:item[7:-1]
    echom l:file_path
    let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
    execute 'term git diff --color "'.l:file_path.'" | diff-so-fancy | less --tabs=4 -RFX '
    " execute l:first_diff_line_number
  endfunction

  let l:width = winwidth('%')
  let l:header = '--header="Git diff..." '
  let l:style = '--ansi --info=inline --preview-window=:bottom:70%:noborder '
  let l:preview = '--preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d; bat --color always --style numbers {3..}) | head -'.&lines.'\""'

  if l:width > 120
    let l:style = '--ansi --info=inline --preview-window=bottom:60%:noborder '
  endif
  if l:width > 200
    let l:style = '--ansi --info=inline --preview-window=bottom:50%:noborder '
  endif
  let l:fzf_files_options = l:header.l:style.s:fzf_color.l:preview
  let l:window_props = _fzf_get_window_props()

  call fzf#run({
        \ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file_diff'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'window': l:window_props  })
endfunction

function! Fzf_git_diff_files_with_icons()
  function! s:edit_devicon_prepended_file_diff(item)
    echom a:item
    let l:file_path = a:item[7:-1]
    echom l:file_path
    let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
    execute 'term git diff --color "'.l:file_path.'" | diff-so-fancy | less --tabs=4 -RFX '
    " execute l:first_diff_line_number
  endfunction

  let l:width = winwidth('%')
  let l:header = '--header="Git diff..." '
  let l:style = '--ansi --info=inline --preview-window=:bottom:70%:noborder '
  let l:preview = '--preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d; bat --color always --style numbers {3..}) | head -'.&lines.'\""'

  if l:width > 120
    let l:style = '--ansi --info=inline --preview-window=bottom:60%:noborder '
  endif
  if l:width > 200
    let l:style = '--ansi --info=inline --preview-window=bottom:50%:noborder '
  endif
  let l:fzf_files_options = l:header.l:style.s:fzf_color.l:preview
  let l:window_props = _fzf_get_window_props()

  call fzf#run({
        \ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file_diff'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'window': l:window_props  })
endfunction

command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

let s:rg_command = 'rg --column --line-number --no-heading --color=always --smart-case'
let s:rg_options = ['--preview-window', 'hidden', '--preview', '~/resources/bin/fzf/vim-preview-search.sh {}']

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \  s:rg_command.' -- '.shellescape(<q-args>), 1,
      \  { 'options': s:rg_options },
      \ <bang>0)

" command! -bang -complete=dir -nargs=* LS
"       \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))
"
function! s:fzf_sink(what)
  let p1 = stridx(a:what, '<')
  if p1 >= 0
    let name = strpart(a:what, 0, p1)
    let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
    if name != ''
      exec "AsyncTask ". fnameescape(name)
    endif
  endif
endfunction

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

function! s:yank_list()
  redir => ys
  silent call EasyClip#Yank#ShowYanks()
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')
    execute 'Paste' . token[0]
  endif
endfunction

function! s:fzf_yanks() abort
  let l:opts = {
    \ 'source': <sid>yank_list(),
    \ 'sink': function('s:yank_handler'),
    \ 'options': '-m ',
    \ 'window': FloatingFZF() }
  call fzf#run(fzf#wrap(l:opts))
endfunction
command! -bang FZFYanks call s:fzf_yanks()
command! -bang Clips call s:fzf_yanks()

function! RipgrepFzf(query, fullscreen)
  let l:opts = ' --line-number --hidden --no-ignore-vcs --no-heading --color=always --smart-case '
  let command_fmt = 'rg ' . l:opts . ' --ignore-file ~/.ignore --ignore-file ~/.rgignore -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--preview-window=:bottom:40%:noborder', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" list sessions
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

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" let g:fzf_command_prefix = 'Fz'
" let g:fzf_commands_expect = 'alt-enter'
" let g:fzf_history_dir = '~/.local/share/fzf-history'
    " nnoremap <silent> <Leader>b :Buffers<CR>
    " nnoremap <silent> <C-f> :Files<CR>
    " nnoremap <silent> <Leader>f :Rg<CR>
    " nnoremap <silent> <Leader>/ :BLines<CR>
    " nnoremap <silent> <Leader>' :Marks<CR>
    " nnoremap <silent> <Leader>g :Commits<CR>
    " nnoremap <silent> <Leader>H :Helptags<CR>
    " nnoremap <silent> <Leader>hh :History<CR>
    " nnoremap <silent> <Leader>h: :History:<CR>
    " nnoremap <silent> <Leader>h/ :History/<CR>
"
"
" function! s:set_fzf_maps()
"   tnoremap <buffer> <C-t> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzFiles<CR>
"   tnoremap <buffer> <C-f> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzBuffers<CR>
"   tnoremap <buffer> <C-s> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzGFiles?<CR>
"   tnoremap <buffer> <C-g> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzAg<CR>
"   tnoremap <buffer> <C-l> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzBLines<CR>
"   tnoremap <buffer> <C-o> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzHistory<CR>
"   tnoremap <buffer> <C-c> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzCommands<CR>
" endfunction
"
"
" augroup fzfMappingsAu
"   autocmd!
"   autocmd FileType fzf call <SID>set_fzf_maps()
" augroup END
" No
" :Files [PATH]	Files (runs $FZF_DEFAULT_COMMAND if defined)
" :GFiles [OPTS]	Git files (git ls-files)
" :GFiles?	Git files (git status)
" :Buffers	Open buffers
" :Colors	Color schemes
" :Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
" :Rg [PATTERN]	rg search result (ALT-A to select all, ALT-D to deselect all)
" :Lines [QUERY]	Lines in loaded buffers
" :BLines [QUERY]	Lines in the current buffer
" :Tags [QUERY]	Tags in the project (ctags -R)
" :BTags [QUERY]	Tags in the current buffer
" :Marks	Marks
" :Windows	Windows
" :Locate PATTERN	locate command output
" :History	v:oldfiles and open buffers
" :History:	Command history
" :History/	Search history
" :Snippets	Snippets (UltiSnips)
" :Commits	Git commits (requires fugitive.vim)
" :BCommits	Git commits for the current buffer
" :Commands	Commands
" :Maps	Normal mode mappings
" :Helptags	Help tags 1
" :Filetypes	File types


