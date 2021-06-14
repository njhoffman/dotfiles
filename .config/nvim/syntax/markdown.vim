
" for s:i in range(1,6)
"   execute 'syntax match VimwikiHeader'.s:i
"       \ . ' /'.vimwiki#vars#get_syntaxlocal('rxH'.s:i, s:current_syntax).
"       \ '/ contains=VimwikiTodo,VimwikiHeaderChar,VimwikiNoExistsLink,VimwikiCode,'.
"       \ 'VimwikiLink,@Spell'
"   execute 'syntax region VimwikiH'.s:i.'Folding start=/'.
"         \ vimwiki#vars#get_syntaxlocal('rxH'.s:i.'_Start', s:current_syntax).'/ end=/'.
"         \ vimwiki#vars#get_syntaxlocal('rxH'.s:i.'_End', s:current_syntax).
"         \ '/me=s-1 transparent fold'
" endfor
