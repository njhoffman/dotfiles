if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *bash* let b:is_bash = 1 | setfiletype sh
augroup END
