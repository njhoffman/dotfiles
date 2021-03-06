"
" ********** Event Driven Functions **********
"
if has("autocmd")
  " prevent empty buffer in startify window
  autocmd User Startified setlocal buflisted

  " Trigger `checktime` when files changes on disk (ex and command mode dont
  " trigger autoread)
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  "
  " load dictionaries
  " autocmd FileType javascript set complete+=k/home/nhoffman/.vim/dictionaries/javascript.dict isk+=.,(
  " autocmd FileType html set complete+=k/home/nhoffman/.vim/dictionaries/javascript.dict isk+=.,(

  " close omni completetion tip window when selection is made (movement in  insert mode or leaving insert mode)
  " autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
  " turn off  line highlighting in insert mode
  autocmd InsertEnter,InsertLeave * set cul!

  " jump to last cursor
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

  " strip trailing white spaces
  " autocmd BufWritePre * call StripTrailingWhitespace()
  let blacklist = ['md', 'vimwiki']
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | call StripTrailingWhitespace()
  autocmd BufWritePre *.js call StripTabs()
  autocmd BufWritePre *.jsx call StripTabs()

  autocmd BufNewFile,BufRead *.png :!feh % & ?

  " autocmd QuitPre * call WarnDbg()

  " start at beginning of file for syntax highlighting
  " autocmd BufEnter * :syntax sync fromstart
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  " augroup BgHighlight
  "   autocmd!
  "   autocmd WinEnter * set cul
  "   autocmd WinLeave * set nocul
  " augroup END

  autocmd VimLeave * set guicursor=a:ver25-blinkon1

  " automatically adjust vim quickfix window max and min height
  au FileType qf call AdjustWindowHeight(3, 40)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction

  augroup qfpreview
    autocmd!
    autocmd FileType qf nmap <buffer> p <plug>(qf-preview-open)
  augroup END

  augroup two_space_ft
    autocmd!
    autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType tf setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType proto setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  augroup end


  augroup filetypedetect
    au BufNewFile,BufRead *.module setlocal ft=php syn=php
    " force bash syntax for shell scripts by default custom syntax extension assignments
    au BufNewFile,BufRead *.php setlocal ft=php syn=php
    au! BufRead,BufNewFile *bash* let b:is_bash = 1 | setfiletype sh
    au BufNewFile,BufRead *.md  set ft=vimwiki syn=vimwiki
    au BufNewFile,BufRead .pa set ft=config
    au BufNewFile,BufRead .env.* set ft=config
    au BufNewFile,BufRead .env.* set syn=config
    au BufNewFile,BufRead *.env set ft=config
    au BufNewFile,BufRead *.env set syn=config
    au BufNewFile,BufRead Chart.yaml  set ft=helm
    au BufNewFile,BufRead values.yaml set ft=helm
    au BufNewFile,BufRead */templates/*.yaml set ft=helm
    au BufNewFile,BufRead */templates/*.tpl set ft=helm
    au BufNewFile,BufRead */templates/*.txt set ft=helm
    au BufNewFile,BufRead */ansible/*.yml  set ft=yaml.ansible
    au BufNewFile,BufRead *.j2,*/ansible/*/templates/* set ft=config.jinja2
    au BufNewFile,BufRead bundles.txt setlocal ft=sh
    au BufNewFile,BufRead bundles.*.txt setlocal ft=sh
    au BufNewFile,BufRead .tasks setlocal ft=dosini
    au BufNewFile,BufRead .vimtasks setlocal ft=dosini
    au BufNewFile,BufRead Dockerfile* setlocal ft=dockerfile
    au BufNewFile,BufRead .dockerignore setlocal ft=gitignore
    au BufNewFile,BufRead *.sock setlocal ft=systemd
    au BufNewFile,BufRead *.service setlocal ft=systemd
    au BufNewFile,BufRead *.atj setlocal ft=javascript
    au BufNewFile,BufRead *.rjs setlocal ft=javascript
    au BufNewFile,BufRead *.xml setlocal ft=javascript
    " au BufEnter * if &bufhidden =~ 'wipe' && &buftype =~ 'nofile' | setf preview | endif
    au BufNewFile,BufRead *.tcf setlocal ft=tcf
    au BufNewFile,BufRead *.tca setlocal ft=tcf
    au BufNewFile,BufRead *.tso setlocal ft=tcf
    au BufNewFile,BufRead .tern-project setf json
    au BufNewFile,BufRead .tern-config setf json
  augroup END

  " Syntax highlight Vagrantfile as ruby
  augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
  augroup END

  " fasd integration
  function! s:fasd_update() abort
    if empty(&buftype) || &filetype ==# 'dirvish'
      call jobstart(['fasd', '-A', expand('%:p')])
    endif
  endfunction

  augroup fasd
    autocmd!
    autocmd BufWinEnter,BufFilePost * call s:fasd_update()
  augroup END
  command! FASD call fzf#run(fzf#wrap({'source': 'fasd -al', 'options': '--no-sort --tac --tiebreak=index'}))
  nnoremap <silent> <Leader>e :FASD<CR>

endif
