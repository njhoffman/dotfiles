" dim the inactive window
Plug 'TaDaa/vimade'
let g:vimade = {}
let g:vimade.basebg = '0000000'
let g:vimade.fadelevel = 0.6
let g:vimade.fadepriority = 10
let g:vimade.checkinterval = 100
let g:vimade.signsretentionperiod = 1000
let g:vimade.enablefocusfading = 1
let g:vimade.enabletreesitter = 1
let g:vimade.colbufsize = 15
let g:vimade.rowbufxize = 15
let g:vimade.enablesigns = 1
let g:vimade.groupdiff = 1
let g:vimade.groupscrollbind = 0

" shows search results?
let g:vimade={}
let g:vimade.fadepriority=0

" should also help with search results
au! CompleteChanged * call vimade#WinDisable()
au! CompleteDone * call vimade#WinEnable()

autocmd WinEnter * setlocal cursorline
autocmd BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
setlocal cursorline

" pum content redraws can drag on performance, do user redraw
au! CompleteChanged * redraw
au! FocusLost * VimadeFadeActive
au! FocusGained * VimadeUnfadeActive

" function! vimade#CheckWindows()
"   call vimade#UpdateState()
"   "prevent if inside popup window
" ~ if winnr() == 0 || pumvisible()
"     return
"   endif
"   if g:vimade_running && g:vimade_paused == 0 && getcmdwintype() == ''
"
" let g:vimade = {
"   \ 'normalid': '',
"   \ 'normalncid': '',
"   \ 'basefg': '',
"   \ 'basebg': '',
"   \ 'fadelevel': 0.4,
"   \ 'colbufsize': 15, '15 is the default for gui vim, 5 is the default for terminals and gvim
"   \ 'rowbufsize': 15, '15 is the default for gui vim, 0 is the default for terminals and gvim
"   \ 'checkinterval': 100, '100 is the default for gui vim, 500 is the default for terminals and neovim
"   \ 'usecursorhold': 0, '0 is default, but will automatically set to 1 for Windows GVIM
"   \ 'detecttermcolors': 0,
"   \ 'enablescroll': 1, "1 is the default for gui vim, but will automatically set to 0 for terminals and Windows GVIM.
"   \ 'enablesigns': g:vimade_features.has_signs_priority, "enabled for vim/nvim versions that support sign priority.  Older vim/nvim versions may suffer performance issues
"   \ 'signsid': 13100,
"   \ 'signsretentionperiod': 4000,
"   \ 'fademinimap': 1,
"   \ 'fadepriority': 10,
"   \ 'groupdiff': 1,
"   \ 'groupscrollbind': 0,
"   \ 'enablefocusfading': 0,
"   \ 'enablebasegroups': 1,
"   \ 'enabletreesitter' : 0, "EXPERIMENTAL FEATURE - 0 is the default, enables support for treesitter highlights"
"   \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace']
" }

" VimadeEnable - Turns vimade on (Vimade is on by default)
" VimadeDisable - Turns vimade off and unfades all buffers
" VimadeToggle - Toggles between on/off states
" VimadeRedraw - Forces vimade to redraw fading for every window.
" VimadeFadeLevel [0.0-1.0] - Sets the FadeLevel config and forces an immediate redraw.
" VimadeFadePriority [0+] - Sets the FadePriority config and forces an immediate redraw.
" VimadeInfo - Provides debug information for Vimade. Please include this info in bug reports
" VimadeWinDisable - Disables fading for the current window
" VimadeWinEnable - Enables fading for the current window
" VimadeBufDisable - Disables fading for the current buffer
" VimadeBufEnable - Enables fading for the current buffer
" VimadeFadeActive - Fades the current active window
" VimadeUnfadeActive - Unfades the current active window
" VimadeOverrideFolded - Overrides the Folded highlight by creating a link to the Vimade base fade. This should produce acceptable results for colorschemes that include Folded highlights that are distracting in faded windows.
