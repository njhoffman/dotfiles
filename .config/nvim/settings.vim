" ********** Global Settings **********

set expandtab                        " use space instead of acutal tab character
set tabstop=2                        " a tab is 2 spaces
set shiftwidth=2                     " 2 spaces for autoindenting
set shiftround                       " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase                       " ignore case by default
set smartcase                        " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                         " insert tabs on the start of a line according to shiftwidth
set autoindent                       " always autoindent
set copyindent		 			        		" copy previous indentation on autoindenting
set norelativenumber                 " this might speed things up
set nowrap                           " no line wrapping
set number                           " turn line numbers on
set hlsearch                         " highlight all matching search terms
set incsearch                        " show search matches as you type
set scrolloff=10                     " keep at least 5 lines above/below
set sidescrolloff=10                 " keep at least 5 lines left/right
set omnifunc=syntaxcomplete#Complete " turn on omni-completion (C-N or C-P to navigate)
set completeopt=menuone,preview		 	 " omnicomplete inserts longest common text of all matches instead of 1st match
set previewheight=10                 " max lines for preview height
set clipboard=unnamedplus           " use system clipboard
set nofoldenable                     " no folding
set foldmethod=indent                " speed up syntax highlighting
set confirm                          " ask to write unsaved changes instead of halting with warning
set cul                              " active line highlighting
set history=2000                     " command search history size
set undolevels=1000                  " how many undos to trace
set re=0                             "  automatically select regex engine
set visualbell                       " dont beep
set noerrorbells                     " dont beep
set lazyredraw                       " buffer screen updates, increases speed
set hidden                           " allows buffers to be hidden without writing to file
set signcolumn=yes                   " always show left hand sign column (displays errors for syntastic)
set backup
set backupcopy=yes                   " prevents vim from renaming original file/creating a new one screwing up file watchers
set backupdir=$HOME/.vim/backup/     " put backup files, double slashes avoid name collisions
set directory=$HOME/.vim/swap/       " put swp files here, double slashes avoid name collisions
set writebackup
set mouse=a                          " mouse support for 'all' of vim
set encoding=utf-8                   " vim bad at detecting encoding, if no BOM assumes it is latin-1
set path='.,src,node_modules         " paths to look for files when using gf command
set suffixesadd=.js,.jsx             " suffix to apply to files when using gf command
set backspace=start,eol,indent       " make backspace work like it should
set wildmode^=lastused               " autocomplete buffers by last visited, :b <Tsb>

set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=tabpages
set sessionoptions-=buffers
set sessionoptions-=options

set ttyfast                          " we have a fast terminal
" set autowriteall						     	 " automatically save changes to buffer before hiding
set autoread   								       " autoload files that changed outside of vim
set redrawtime=10000                 " timeout before vim quits trying to apply syntax highlighting
set switchbuf=useopen                " if buffer already open in window, switch don't open new window
set nocompatible                     " be iMproved, required
set wildignore+=*/archive/*,*/images/*,*/gif/*
set wildignore+=*.swp,*.bak,*.pyc,*.class
set cmdheight=1
" short, abbreviated messages
set shortmess+=a
" writes to swap file periodically, too slow causes noticeable lag
set updatetime=500

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

set grepprg="ag --vimgrep --smart-case --follow --hidden"

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
" enable true color (use guifg/guibg color codes)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Use ripgrep for vim :grep
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" '(marks) <(register-lines) s(skip-size) :(cmd-history) n(filepath)
" %(bufferlist) /(search-history) h(disable-highlighting) !(global-vars)
" save marks from 2000 files (oldfiles), registers max 2000 lines, skip >300kb,
" save 3000 commands, save all searches, open buffers if no specific file, disable search highlight
set shada='2000,<2000,s300,:3000,h,n~/.vim/.shada

" key escape times
" tmux: set -sg escape-time 0                " don't wait for an escape sequence after hitting Esc. fixes insert mode exit lag in vim
" vim: set timeoutlen=1000 ttimeoutlen=0
" zsh: # KEYTIMEOUT=1 # 10ms for key sequences

set pumheight=20                     " menu hegiht
" filetype plugin indent on

" Set a variable on the buffer that tells the sh syntax highlighter
" that this is bash:
let b:is_bash = 1
" Set the filetype to sh
set ft=sh

" set tags=./tags;$HOME				     		 " load tags from current directoyr all the way to home
" set nocursorline                     " cursor line highlighting slows things down a lot, turn off if sluggish performance

if has("persistent_undo")
  set undodir=$HOME/.vim/undo
  set undofile
endif
