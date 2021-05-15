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

