" project management plugins

Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['package.json', '.git']
" let g:rooter_patterns = ['!=extras', '!^fixtures', '!build/env.sh']
"
" let g:rooter_patterns = ['=src']
" let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
"   To specify the root has a certain directory as an ancestor (useful for excluding directories), prefix it with ^:
" let g:rooter_patterns = ['^fixtures']
"
" Non-project files
" Don't change directory (default).
" let g:rooter_change_directory_for_non_project_files = ''
" Change to file's directory (similar to autochdir).
" let g:rooter_change_directory_for_non_project_files = 'current'
"   let g:rooter_change_directory_for_non_project_files = 'home'
" let g:rooter_cd_cmd = 'lcd'
" To stop Rooter echoing the project directory:
"   let g:rooter_silent_chdir = 1
" By default Rooter doesn't resolve symbolic links in the file or directory which triggers it. To do so:
let g:rooter_resolve_links = 1

" automatically save sessions
Plug 'tpope/vim-obsession'
" :Obsess / :Obsess! <file> to record a sessoin
" vim -S <file> / :source <file>

" switch/manage sessions cleanly
Plug 'dhruvasagar/vim-prosession'
" Prosession {dir} -> switch to session in dir
" update tmux window with session
let g:prosession_tmux_title = 1
let g:prosession_tmux_title_format = "vim - @@@"
let g:prosession_on_startup = 1
" different sessions per branch
let g:prosession_per_branch = 0
