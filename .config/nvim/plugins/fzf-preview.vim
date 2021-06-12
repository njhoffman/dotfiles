
" also CocInstall fzf-preview
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

"" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9

" fzf window position settings
let g:fzf_preview_direct_window_option = ''

" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }

" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" jump to the buffers by default, when possible
let g:fzf_preview_buffers_jump = 1

" Commands used for fzf preview.
" The file name selected by fzf becomes {}
" let g:fzf_preview_command = 'cat'                               " Not installed bat
let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat

" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
let g:fzf_preview_filelist_command = 'rg --files --hidden --no-ignore-vcs --follow --no-messages -g \!"* *"'

" Commands used to get the file list from git reposiroty
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

" Commands used to get the git status file list
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'

" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
      \ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
      \ g:fzf_preview_command

" if !s:is_win && &columns > s:wide
"   let suffix = executable('delta') ? '| delta' : '--color=always'
"   call extend(options.options,
"   \ ['--preview', 'echo {} | grep -o "[a-f0-9]\{7,\}" | head -1 | xargs git show --format=format: ' . suffix])

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --hidden'

" MRU and MRW cache directory
let g:fzf_preview_cache_directory = expand('~/.cache/nvim/fzf_preview')

" If this value is not 0, disable mru and mrw
let g:fzf_preview_disable_mru = 0

" Limit of the number of files to be saved by mru
let g:fzf_preview_mru_limit = 10000

" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Keyboard shortcuts while fzf preview is active
" let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'
let g:fzf_preview_preview_key_bindings = 'Ctrl-/:toggle-preview,ctrl-p:up,ctrl-n:down,tab:down,shift-tab:up,ctrl-b:page-up,ctrl-f:page-down,alt-g:top,alt-b:page-up+page-up+page-up,alt-f:page-down+page-down+page-down,alt-n:toggle-down,alt-p:toggle-up,alt-space:toggle,ctrl-alt-a:toggle-all,alt-a:toggle-all,up:preview-up,down:preview-down,pgup:preview-page-up,pgdn:preview-page-down,shift-up:preview-page-up,shift-down:preview-page-down,ctrl-y:execute-silent(echo {+} | xsel --clipboard),ctrl-e:execute(nvim {+} < /dev/tty > /dev/tty 2>&1),ctrl-v:execute(code {+})'

" Specify the color of fzf
" fg  Text
" bg  Background
" preview-fg  Preview window text
" preview-bg  Preview window background
" hl  Highlighted substrings
" fg+ Text (current line)
" bg+ Background (current line)
" gutter  Gutter on the left (defaults to bg+)
" hl+ Highlighted substrings (current line)
" info  Info
" border  Border of the preview window and horizontal separators (--border)
" prompt  Prompt
" pointer Pointer to the current line
" marker  Multi-select marker
" spinner Streaming input indicator
" header  Header
" let s:fzf_preview_fzf_color_option = '--color="bg:#000018,bg+:#002222,border:#006B6B,spinner:#98BC99,header:#55FFFF" '
" let s:fzf_preview_fzf_color_option = '--color="fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104,info:183,prompt:110,spinner:107,pointer:167,marker:215"  '
" let s:fzf_preview_fzf_color_option = '--color="dark,fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f,info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7" '
" let s:fzf_preview_fzf_color_option = '--color="fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108,info:108,prompt:109,spinner:108,pointer:168,marker:168"'
" let s:fzf_preview_fzf_color_option = '--color="fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104,info:183,prompt:110,spinner:107,pointer:167,marker:215" '
let s:fzf_preview_fzf_color_option = '--color="bg:#000008,bg+:#002222,spinner:#98BC99,hl:#58aeb5,fg:#a3a3b6,header:#586e75,info:#cb4b16,pointer:#07ae71,marker:#07ae71,fg+:#a3d3e6,prompt:#55FFFF,hl+:#07cea1"'
" Set the processes when selecting an element with fzf
let g:fzf_preview_custom_processes = {}
" For example, set split to ctrl-s
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file')
" on coc extensions
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
" let g:fzf_preview_custom_processes['open-file']['ctrl-s'] = g:fzf_preview_custom_processes['open-file']['ctrl-x']
" call remove(g:fzf_preview_custom_processes['open-file'], 'ctrl-x')

" Use as fzf preview-window option
" let g:fzf_preview_fzf_preview_window_option = 'noborder:down:50%'
let g:fzf_preview_fzf_preview_window_option = 'down:50%'

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 10000

" The theme used in the bat preview
" $FZF_PREVIEW_PREVIEW_BAT_THEME = 'ansi-dark'
$FZF_PREVIEW_PREVIEW_BAT_THEME = 'base16'

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
" commands
" " Select project files
" :CocCommand fzf-preview.ProjectFiles
"
" " Select file from git ls-files
" :CocCommand fzf-preview.GitFiles
"
" " Select file from directory files (default to current working directory) (Required [ripgrep](https://github.com/BurntSushi/ripgrep))
" :CocCommand fzf-preview.DirectoryFiles
"
" " Select file buffers. Used open-buffer processes.
" :CocCommand fzf-preview.Buffers
"
" " Select all buffers. Used open-bufnr processes
" :CocCommand fzf-preview.AllBuffers
"
" " Select project files from oldfiles
" :CocCommand fzf-preview.ProjectOldFiles
"
" " Select project mru (Most Recently Used) files
" :CocCommand fzf-preview.ProjectMruFiles
"
" " Select project mrw (Most Recently Written) files
" :CocCommand fzf-preview.ProjectMrwFiles
"
" " Grep project files from args word (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.ProjectGrep {word}
"
" " Select tags from tags file (Required [universal-ctags](https://github.com/universal-ctags/ctags) and [Python3](https://www.python.org/))
" :CocCommand fzf-preview.Ctags
"
" " Select tags from current files (Required [universal-ctags](https://github.com/universal-ctags/ctags) and [Python3](https://www.python.org/))
" :CocCommand fzf-preview.BufferTags
"
"  Select files from oldfiles
" :CocCommand fzf-preview.OldFiles
"
" :" Select mru (Most Recently Used) files
" :CocCommand fzf-preview.MruFiles
"
" :" Select mrw (Most Recently Written) files
" :CocCommand fzf-preview.MrwFiles
"
" :" Select line from QuickFix (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.QuickFix
"
" :" Select line from LocationList (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.LocationList
"
" :" Select line from current buffer (Required [bat](https://github.com/sharkdp/bat))
" :CocCommand fzf-preview.Lines
"
" :" Select line from loaded buffer (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.BufferLines
"
" :" Select jumplist item (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.Jumps
"
" :" Select changelist item (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.Changes
"
" :" Select mark (Required [Python3](https://www.python.org/))
" :CocCommand fzf-preview.Marks
"
" :" Select files from selected resources (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
" :CocCommand fzf-preview.FromResources
"
" :" Execute and edit command history
" :CocCommand fzf-preview.CommandPalette
"
" :" Interactive git integration. (Required [Fugitive](https://github.com/tpope/vim-fugitive) or [Gina](https://github.com/lambdalisue/gina.vim))
" :CocCommand fzf-preview.GitActions
"
" :" Select git status listed file. (Required [Fugitive](https://github.com/tpope/vim-fugitive) or [Gina](https://github.com/lambdalisue/gina.vim))
" :CocCommand fzf-preview.GitStatus
"
" :" Select tags from vista.vim (Required [vista.vim](https://github.com/liuchengxu/vista.vim))
" :CocCommand fzf-preview.VistaCtags
"
" :" Select current buffer tags from vista.vim (Required [vista.vim](https://github.com/liuchengxu/vista.vim))
" :CocCommand fzf-preview.VistaBufferCtags
"
" :" Select bookmarks (Required [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks))
" :CocCommand fzf-preview.Bookmarks
"
" :" Select register history (Required [yankround.vim](https://github.com/LeafCage/yankround.vim))
" :CocCommand fzf-preview.Yankround
"
" :" Open the PR corresponding to the selected line (Required [GitHub cli](https://github.com/cli/cli))
" :CocCommand fzf-preview.BlamePR
"
" :" Select references from coc.nvim (only coc extensions)
"
" :CocCommand fzf-preview.CocDiagnostics        " Select diagnostics from coc.nvim (only coc extensions)
"
" :CocCommand fzf-preview.CocCurrentDiagnostics " Select current file diagnostics from coc.nvim (only coc extensions)
"
" :CocCommand fzf-preview.CocTypeDefinitions    " Select type definitions from coc.nvim (only coc extensions)
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

" The theme used in the bat preview
" let $BAT_THEME = 'base16'
$FZF_PREVIEW_PREVIEW_BAT_THEME = 'ansi'

" coc extensions
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

" echo FindProjectDirectory()
" nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]p     :<C-u>GFilesFallback<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
