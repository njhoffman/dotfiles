

" emulate vscode's async task runner
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" ln ~/.vim/bundle/asynctasks.vim/bin/asynctask ~/bin/asynctask
" :AsyncTaskEdit! to edit global files
" :AsyncTaskList
" :AsyncTaskMacro to list global macros
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_rows = 10    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80    " set width for vertical terminal split
let g:asynctasks_config_name = '.vimtasks'
let g:asynctasks_extra_config = [
    \ '~/.config/asynctask/shared.ini',
    \ '~/.config/asynctask/vimtasks.ini',
    \ ]

" custom:
"   output=terminal
"   pos=floaterm
"   raw=position=bottomright,focus=1,autoclose=1,width=70,height=30
"   TODO: allow compound commands
"
" quickfix	simulation	Default, simulate a terminal in quickfix window (output will not match the errorformat)
" vim	-	Use the old ! command to run your task, some people still like it
" tab	internal terminal	open a new internal terminal in a new tab
" top	internal terminal	open a reusable internal terminal above current window
" bottom	internal terminal	open a reusable internal terminal under current window
" left	internal terminal	open a reusable internal terminal on the left
" right	internal terminal	open a reusable internal terminal on the right
" external	external terminal	use a new system terminal to run your task


function _parse_raw_option(raw, name, default)
    let name = a:name . '='
    let raw = a:raw
    let rawopt = matchstr(raw, name . '[^,]*')
    if (strlen(trim(rawopt)) == 0)
        return ' --' . name . a:default
    endif
    return ' --' . rawopt
endfunction

function! s:runner_proc(opts)
    let curr_bufnr = floaterm#curr()
    if has_key(a:opts, 'silent') && a:opts.silent == 1
        FloatermHide!
    endif
    let cmds = []
    let cmds += ['cd ' . shellescape(getcwd()) ]
    let cmds += [a:opts.cmd]
    let text = join(cmds, ";")
    let raw = a:opts.raw

    let winoptions = '--wintype=floating --name=' . a:opts.name . ' --title=' . a:opts.name
    let winoptions .= _parse_raw_option(raw, 'height', '0.5')
    let winoptions .= _parse_raw_option(raw, 'width', '0.8')
    let winoptions .= _parse_raw_option(raw, 'autoclose', '1')
    let winoptions .= _parse_raw_option(raw, 'position', 'center')

    execute 'FloatermNew ' . winoptions . ' '  . text
    " execute 'terminal! \<C-\>\<C-n><C-W>w'
    execute 'call setpos(".", [0,100,0])'
    if match(raw,'focus=0') != -1
        execute 'wincmd w'
   endif
    " echo winoptions
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:runner_proc')
