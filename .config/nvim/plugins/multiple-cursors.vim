" multiple cursor emulation
Plug 'mg979/vim-visual-multi'
"
" tutorial: vim -Nu path/to/visual-multi/tutorialrc
" let g:multi_cursor_use_default_mapping=0
" Basic usage:

" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A
" Two main modes:
"
" in cursor mode commands work as they would in normal mode
" in extend mode commands work as they would in visual mode
" press Tab to switch between «cursor» and «extend» mode
" Most vim commands work as expected (motions, r to replace characters, ~ to change case, etc). Additionally you can:
