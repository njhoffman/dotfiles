" ********** Plugins Loader ********** "

let $plugins="~/.config/nvim/plugins"

""" Vim-Plug
call plug#begin()


" still need to checkout: https://github.com/wellle/targets.vim
"
" ---------- Visual Enhancements----------
"
source $plugins/bookmarks.vim          " location marking/tagging
Plug 'psliwka/vim-smoothie'
" nmap <silent> <M-b> 3<Plug>(SmoothieBackwards)
" nmap <silent> <M-f> 3<Plug>(SmoothieForwards)

" source $plugins/comfortable-motion.vim " more pleasant scrolling in vim
source $plugins/expand-selection.vim   " incrementally expand visual selection
source $plugins/highlights.vim         " plugins for showing inline colors
source $plugins/indent-guide.vim       " show indentation lines
source $plugins/syntax.vim             " syntax language packs and treesitter
source $plugins/treesitter.vim             " syntax language packs and treesitter
source $plugins/vimade.vim             " inactive window dimming
source $plugins/vitality.vim           " cursor enhancement
" source $plugins/rainbow-parentheses.vim " add/remove surrounding characters

" ---------- Manual Formatting ----------
"
source $plugins/comments.vim   " block comment formatting
source $plugins/easy-align.vim " alignment enhancer
source $plugins/sandwich.vim   " add/remove surrounding characters
source $plugins/snippets.vim   " ultisnips interface and snippet packages
source $plugins/splitjoin.vim  " switch between single line and multi-line statements
source $plugins/table-mode.vim " format or enter data into table structure

Plug 'wsdjeg/notifications.vim'

" vim-node: open paths/requires to node projects
Plug 'moll/vim-node'
" Use [I etc. to look for a keyword in required files (Sets Vim's &include).
" Use :Nedit to quickly edit any module, file in a module or your project file.
" Use :Nopen to quickly edit any module and lcd to its directory.
" Lets you even open Node's core modules. They're shown straight from Node's online repository without you having to download everything.
" Node.vim itself is tested with a thorough automated integration test suite! No cowboy coding here!
" edit core module
" :Nedit http

" Want <C-w>f to open the file under the cursor in a new vertical split?
" <C-w>f by default opens it in a horizontal split. To have it open vertically, drop this in your vimrc:
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" jump to nodejs file from anywhere on line
nnoremap gF ^f'gf
" Plugin "zoubin/vim-gotofile"

Plug 'meain/vim-package-json'

Plug 'metakirby5/codi.vim'
" available repl
" Codi [filetype] activates Codi for the current buffer, using the provided filetype or the buffer's filetype.
" Codi! deactivates Codi for the current buffer.
" Codi!! [filetype] toggles Codi for the current buffer, using the provided filetype or the buffer's filetype.
" g:codi#interpreters is a list of user-defined interpreters. See the documentation for more information.
" g:codi#aliases is a list of user-defined interpreter filetype aliases. See the documentation for more information.
" The below options can also be set on a per-interpreter basis via g:codi#interpreters:
"
" g:codi#autocmd determines what autocommands trigger updates. See the documentation for more information.
" g:codi#width is the width of the Codi split.
" g:codi#rightsplit is whether or not Codi spawns on the right side.
" g:codi#rightalign is whether or not to right-align the Codi buffer.
" g:codi#autoclose is whether or not to close Codi when the associated buffer is closed.
" g:codi#raw is whether or not to display interpreter results without alignment formatting (useful for debugging).
" g:codi#sync is whether or not to force synchronous execution. No reason to touch this unless you want to compare async to sync.
" Autocommands
" CodiEnterPre, CodiEnterPost: When a Codi pane enters.
" CodiUpdatePre, CodiUpdatePost: When a Codi pane updates.
" CodiLeavePre, CodiLeavePost: When a Codi pane leaves.
" convert numbers
Plug 'glts/vim-radical'
" crd, crx, cro, crb, gA

" quick date incrementing
Plug 'tpope/vim-speeddating'
" # <C-A>/ # <C-X>

" converts between js function signature types
Plug 'mvolkmann/vim-js-arrow-function'
" JsAnonFnToArrowFn

" ---------- Autoformatting ----------
"
" source $plugins/pear-tree.vim    " auto-pairing start/end text objects
Plug 'tpope/vim-endwise'
source $plugins/editorconfig.vim " load project .editorconfig settings

" coc-prettier handles this now
" source $plugins/prettier.vim     " prettier automatic formatting

" auto formatting for most file types
Plug 'sbdchd/neoformat'

" :Neoformat
" :Neoformat jsbeauty
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" Or
" let &verbose            = 1 " also increases verbosity of the editor as a whole

set fillchars+=vert:\│

" Plugin 'Konfekt/vim-alias'
" Plugin 'dbakker/vim-projectroot'
" Plugin 's1341/vim-tabws'
" nnoremap <leader>dp :ProjectRootCD<cr>
"
" function! <SID>AutoProjectRootCD()
"   try
"     if &ft != 'help'
"       ProjectRootCD
"     endif
"   catch
"     " Silently ignore invalid buffers
"   endtry
" endfunction
" autocmd BufEnter * call <SID>AutoProjectRootCD()

" inoreabbrev <expr> <bar><bar>
"           \ <SID>isAtStartOfLine('\|\|') ?
"           \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
" inoreabbrev <expr> __
"           \ <SID>isAtStartOfLine('__') ?
"           \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ---------- Search and Visual Navigation ----------
source $plugins/ack.vim        " search within files grep-like
source $plugins/easymotion.vim " quick hint screen navigation
source $plugins/wordmotion.vim " enhanced word motion definitions

Plug 'kevinhwang91/nvim-hlslens'

noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

" use : instead of <Cmd>
nnoremap <silent> <leader>l :nohlsearch<CR>

highlight default link HlSearchLensCur IncSearch
highlight default link HlSearchLens WildMenu
highlight default link HlSearchCur IncSearch

" ---------- Interfaces ----------

source $plugins/telescope.vim " debugging tools
source $plugins/dap.vim " debugging tools

" provides single command for smart buffer deletion
Plug 'mhinz/vim-sayonara'
" map close buffer
" TODO: close window if exists, if not close buffer
" nnoremap <silent> <Leader>d :bd<CR>
nnoremap <silent> <Leader>d :Sayonara<CR>

Plug 'kyazdani42/nvim-web-devicons'

" source $plugins/clap.vim           " custom popup ui interface
source $plugins/coc-extensions.vim " full featured intellisense code completion
source $plugins/coc.vim            " full featured intellisense code completion
source $plugins/floaterm.vim       " floating window interface
source $plugins/fzf-preview.vim    " fuzzy file finder
source $plugins/fzf.vim            " fuzzy file finder
" source $plugins/startify.vim       " fancy start screen
source $plugins/vista.vim          " sidebar tags navigator

Plug 'glepnir/dashboard-nvim'
" clap, fzf, telescope
let g:dashboard_default_executive ='telescope'
" let g:dashboard_custom_shortcut={
"       \ 'last_session'       : 'SPC s l',
"       \ 'find_history'       : 'SPC f h',
"       \ 'find_file'          : 'SPC f f',
"       \ 'new_file'           : 'SPC c n',
"       \ 'change_colorscheme' : 'SPC t c',
"       \ 'find_word'          : 'SPC f a',
"       \ 'book_marks'         : 'SPC f b',
"       \ }

" nmap <Leader>ss :<C-u>SessionSave<CR>
" nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item
" highlight TelescopeSelectionCaret guifg=#CC241D " selection caret
" highlight TelescopeMultiSelection guifg=#928374 " multisections
" highlight TelescopeNormal         guibg=#00000  " floating windows created by telescope.

" Border highlight groups.
" highlight TelescopeBorder         guifg=#ffffff
" highlight TelescopePromptBorder   guifg=#ffffff
" highlight TelescopeResultsBorder  guifg=#ffffff
" highlight TelescopePreviewBorder  guifg=#ffffff
"
" " Used for highlighting characters that you match.
" highlight TelescopeMatching       guifg=blue

" Used for the prompt prefix
" highlight TelescopePromptPrefix   guifg=red

" Plugin 'jeetsukumaran/vim-buffergator'
Plug 'rbtnn/vim-rabbit-ui'

Plug 'miyakogi/sidepanel.vim'
" Set position (left or right) if neccesary (default: "left").
let g:sidepanel_pos = "right"
" Set width if neccesary (default: 32)
let g:sidepanel_width = 36

" To use rabbit-ui.vim
let g:sidepanel_use_rabbit_ui = 1
" Plugin 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Plugin 'scrooloose/nerdtree'

nnoremap <C-\> :SidePanel buffergator<CR>

" Activate plugins in SidePanel
let g:sidepanel_config = {}
let g:sidepanel_config['nerdtree'] = {}
let g:sidepanel_config['tagbar'] = {}
let g:sidepanel_config['gundo'] = {}
let g:sidepanel_config['buffergator'] = {}
let g:sidepanel_config['vimfiler'] = {}
let g:sidepanel_config['defx'] = {}

" " file ranger for netrw replacement
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" ---------- Statusbar and Bufferline ----------

source $plugins/devicons.vim            " add filetype glyps to various vim plugins
source $plugins/airline.vim             " airline status bar enhancement
source $plugins/fugitive.vim            " branch indicator for vim-airline
" source $plugins/barbar.vim              " barbar bufferline
" source $plugins/bufferline.vim          " akinsho bufferline, needs bufferline-post
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua
" Plug 'famiu/feline.nvim'

" ---------- Key Mapping ----------
"
source $plugins/quickfix.vim         " quickfix window enhancements
source $plugins/tmux.vim             " tmux integration
source $plugins/unimpaired.vim       " pairing keymappings for ][

" ---------- Productivity ----------
"

source $plugins/shortcuts.vim   " Shortcuts discovery, needs shortcuts-post
source $plugins/wakatime.vim    " Wakatime timetracking integration
" source $plugins/taskwarrior.vim " taskwarrior interface
" source $plugins/hardtime.vim    " vim movements discipline

" ---------- Other ----------
"

source $plugins/asynctasks.vim   " asynctask runner
source $plugins/buffers.vim      " buffer management enhancements
source $plugins/clipboard.vim    " clipboard emulation between vim sessions and host
source $plugins/matchup.vim      " match on more than '%'
source $plugins/profiler.vim     " profile vim plugins and startup time
source $plugins/projects.vim     " project management plugins
source $plugins/suda.vim         " sudo write support
source $plugins/system-tools.vim " doing shell stuff from vim
source $plugins/undotree.vim     " undo tree interface
source $plugins/vimwiki.vim      " personal wiki interface

Plug 'urbainvaes/vim-ripple'
" Optional dependency
Plug 'machakann/vim-highlightedyank'

function! s:remove_comments(code)
    return substitute(a:code, "^#[^\r]*\r\\|\r#[^\r]*", "", "g")
endfunction

let s:default_repls = {
      \ "python": ["ipython", "\<c-u>\<esc>[200~", "\<esc>[201~", 1],
      \ "js": "~/bin/repl",
      \ "julia": "julia",
      \ "lua": "lua",
      \ "r": "R",
      \ "ruby": "irb",
      \ "scheme": "guile",
      \ "sh": "bash",
      \ "zsh": ["zsh", "", "", 0, function('s:remove_comments')],
      \ }
"
" g:ripple_winpos	vertical	Window position
" g:ripple_term_name	undefined	Name of the terminal buffer
" g:ripple_enable_mappings	1	Whether to enable default mappings
" g:ripple_highlight	DiffAdd Highlight group
" <Plug>(ripple_open_repl)	y<cr> (nmap)	Open REPL
" <Plug>(ripple_send_motion)	yr (nmap)	Send motion to REPL
" <Plug>(ripple_send_previous)	yp (nmap)	Resend previous code selection
" <Plug>(ripple_send_selection)	R (xmap)	Send selection to REPL
" <Plug>(ripple_send_line)	yrr (nmap)	Send line to REPL
" <Plug>(ripple_send_buffer)	yr<cr> (nmap)	Send whole buffer to REPL

"
" Tag generation, needs ctags
" Plugin 'ludovicchabant/vim-gutentags'
" let g:gutentags_cache_dir = $HOME . '/.gutencache'


" include plugin maps for repeat (.)
Plug 'tpope/vim-repeat'

" macro enhancer, requires vim-repeat
" Plugin 'svermeulen/vim-macrobatics'
" Use <nowait> to override the default bindings which wait for another key press
" nmap <nowait> q <plug>(Mac_Play)
" nmap <nowait> gq <plug>(Mac_RecordNew)

" nmap <leader>mh :DisplayMacroHistory<cr>
"
" nmap [m <plug>(Mac_RotateBack)
" nmap ]m <plug>(Mac_RotateForward)
"
" nmap <leader>ma <plug>(Mac_Append)
" nmap <leader>mp <plug>(Mac_Prepend)
"
" nmap <leader>mng <plug>(Mac_NameCurrentMacro)
" nmap <leader>mnf <plug>(Mac_NameCurrentMacroForFileType)
" nmap <leader>mns <plug>(Mac_NameCurrentMacroForCurrentSession)
"
" nmap <leader>mo <plug>(Mac_SearchForNamedMacroAndOverwrite)
" nmap <leader>mr <plug>(Mac_SearchForNamedMacroAndRename)
" nmap <leader>md <plug>(Mac_SearchForNamedMacroAndDelete) nmap <leader>me <plug>(Mac_SearchForNamedMacroAndPlay)
" nmap <leader>ms <plug>(Mac_SearchForNamedMacroAndSelect)
"
" let g:Mac_DefaultRegister = 'm'
" let g:Mac_PlayByNameRegister = 'n'
" let g:Mac_MaxItems = 10
" let g:Mac_SavePersistently = 0
" let g:Mac_DisplayMacroMaxWidth = 80
" let g:Mac_NamedMacroFileExtension = '.bin'
" let g:Mac_NamedMacroFuzzySearcher = v:null
" let g:Mac_NamedMacrosDirectory = "~/.config/macrobatics"
" let g:Mac_NamedMacroParameters = {}
" let g:Mac_NamedMacroParametersByFileType = {}
" let g:Mac_FzfOptions = {'window': {'width': 0.75, 'height': 0.6}}

" better quick fix window
Plug 'kevinhwang91/nvim-bqf'
" Press <Tab> or <S-Tab> to toggle the sign of item
" Press zn or zN will create new quickfix list
" Press zf in quickfix window will enter fzf mode.

Plug 'osyo-manga/vim-over'
let g:over_enable_auto_nohlsearch = 1
let g:over_enable_cmd_window = 1
let g:over_command_line_prompt = "> "
let g:over#command_line#search#enable_incsearch = 1
let g:over#command_line#search#enable_move_cursor = 1
let g:over#command_line#paste_escape_chars = '/.*$^~'
let g:over#command_line#paste_filters = {
\	"\n" : '\\n',
\	"\r" : '\\r',
\}
" OverCommandLineCursor                               *OverCommandLineCursor*
" This is the highlight color of the current cursor position.
" The default value is |hl-Cursor|.
" OverCommandLineCursorInsert                   *OverCommandLineCursorInsert*
" This is the highlight color of the current cursor position in insert mode.
" The default value is |hl-Cursor| with |underline| set.

Plug 'voldikss/vim-browser-search'
nmap <silent> <Leader>G <Plug>SearchNormal
vmap <silent> <Leader>G <Plug>SearchVisual
let g:browser_search_default_engine = 'google'
" <Leader>gsaw (word)
" <Leader>gsa( text between parentheses )
" <Leader>gsas Search for a sentence

let g:browser_search_engines = {
  \ 'baidu':'https://www.baidu.com/s?ie=UTF-8&wd=%s',
  \ 'bing': 'https://www.bing.com/search?q=%s',
  \ 'duckduckgo': 'https://duckduckgo.com/?q=%s',
  \ 'github':'https://github.com/search?q=%s',
  \ 'google':'https://google.com/search?q=%s',
  \ 'stackoverflow':'https://stackoverflow.com/search?q=%s',
  \ 'translate': 'https://translate.google.com/?sl=auto&tl=it&text=%s',
  \ 'wikipedia': 'https://en.wikipedia.org/wiki/%s',
  \ 'youtube':'https://www.youtube.com/results?search_query=%s&page=&utm_source=opensearch',
  \ }
" end plugin loading
call plug#end()

" source $plugins/bufferline-post.vim
source $plugins/bqf-post.vim
source $plugins/treesitter-post.vim
source $plugins/shortcuts-post.vim
source $plugins/telescope-post.vim
source $plugins/dap-post.vim
" source $plugins/feline-post.vim
" source $plugins/galaxyline-post-1.vim

" call yankstack#setup()
