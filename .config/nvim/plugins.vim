"---- vim-plug setup  ----
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----


call plug#begin()

let $plugins="~/.config/nvim/plugins"
" still need to checkout: https://github.com/wellle/targets.vim
"
" ---------- Visual Enhancements----------
"
source $plugins/bookmarks.vim        " location marking/tagging
" source $plugins/vim-smoothie.vim     " smooth scrolling
source $plugins/expand-selection.vim " incrementally expand visual selection
" source $plugins/highlights.vim       " plugins for showing inline colors
source $plugins/indent-guide.vim     " show indentation lines
source $plugins/syntax.vim           " syntax language packs and treesitter
" source $plugins/barbar.vim           " modern tab line
" source $plugins/vimade.vim           " inactive window dimming
source $plugins/vitality.vim         " cursor enhancement
" source $plugins/comfortable-motion.vim " more pleasant scrolling in vim
" source $plugins/rainbow-parentheses.vim " add/remove surrounding characters

" end plugin loading
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" call yankstack#setup()
