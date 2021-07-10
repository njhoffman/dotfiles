" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

  " Don't highlight builtin functions/filters (default: 1)
  let g:jq_highlight_builtin_functions = 0

  " Don't highlight module prefix, like NAME:: (default: 1)
  let g:jq_highlight_module_prefix = 0

  " Don't highlight imported JSON file prefix, like $NAME:: (default: 1)
  let g:jq_highlight_json_file_prefix = 0

  " Highlight objects like .foo (default: 0)
  let g:jq_highlight_objects = 1

  " Highlight all function calls (default: 0)
  " This will highlight all words directly followed by an opening parenthesis
  let g:jq_highlight_function_calls = 1

  let g:vim_jsx_pretty_highlight_close_tag = 1
  let g:vim_jsx_pretty_colorful_config = 1
  let g:vim_jsx_pretty_disable_tsx = 0
  let g:vim_jsx_pretty_disable_jsx = 0

  " Plug 'sheerun/vim-polyglot', { 'do': 'rm ~/.vim/plugged/vim-polyglot/after/indent/javascript.vim' }

  " plasticboy/vim-markdown fenced syntax blocks
  " ge: follow link, gx: open link in browser '<Plug>Markdown_EditUrlUnderCursor'j
" - ']]': go to next header. '<Plug>Markdown_MoveToNextHeader'
" - '[[': go to previous header. Contrast with ']c'. '<Plug>Markdown_MoveToPreviousHeader'
" - '][': go to next sibling header if any. '<Plug>Markdown_MoveToNextSiblingHeader'
" - '[]': go to previous sibling header if any. '<Plug>Markdown_MoveToPreviousSiblingHeader'
" - ']c': go to Current header. '<Plug>Markdown_MoveToCurHeader'
" - ']u': go to parent header (Up). '<Plug>Markdown_MoveToParentHeader'

  " let g:vim_markdown_folding_disabled = 1
  " let g:vim_markdown_override_foldtext = 0
  " let g:vim_markdown_folding_level = 1
"   To disable math conceal with LaTeX math syntax enabled, add the following to your '.vimrc':
"   let g:tex_conceal = ""
"   let g:vim_markdown_math = 1
" let g:vim_markdown_strikethrough = 1 ~~Strike~~
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_autowrite = 1
  let g:vim_markdown_auto_insert_bullets = 1

  let g:vim_markdown_conceal_code_blocks = 1
  let g:vim_markdown_fenced_languages = [
        \ 'coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript',
        \ 'python', 'css', 'sh', 'bash=sh', 'html', 'sql', 'zsh', 'ruby', 'sass', 'xml', 'viml=vim']

  let g:vim_markdown_no_extensions_in_markdown = 1

  " anchor links w/o extensions, [MyFile#anchorName], 'ge' commnd follows
  let g:vim_markdown_follow_anchor = 1
  let g:vim_markdown_anchorexpr = "''"
  " let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'" (converts anchor forms)
  " let g:vim_markdown_math = 1 (latex math '$x2$', '$$x^2$$')
  " let g:vim_markdown_frontmatter = 1 (yaml front matter hl for jekyll/hugo) (also has TOML,JSON)
  " :SetexToAtx, :HeaderIncrease, :HeaderDecrase
  " :Toc, :TableFormat


  " TODO: figure out why this has to be sourced twice
  " Plug 'tpope/vim-liquid'
  Plug 'njhoffman/vim-liquid'
  " Plug  'moll/vim-node'

  " Plug  'yuezk/vim-js'
  " Plug  'HerringtonDarkholme/yats.vim'
  " Plug  'maxmellon/vim-jsx-pretty'

  " Plug 'vim-pandoc/vim-pandoc'
  " Plug 'vim-pandoc/vim-pandoc-syntax'
  " Plug 'godlygeek/tabular'
  " " errors when restarting with neo-restart
  " " Plug 'kchmck/vim-coffee-script'

  " Plug  'GutenYe/json5.vim'
  " Plug  'StanAngeloff/php.vim'
  " Plug  'andrewstuart/vim-kubernetes'
  " Plug  'arzg/vim-sh'
  " Plug  'chr4/nginx.vim'
  " Plug  'chrisbra/csv.vim'
  " Plug  'editorconfig/editorconfig-vim'
  " Plug  'ekalinin/Dockerfile.vim'
  " Plug  'elzr/vim-json'
  " Plug  'ericpruitt/tmux.vim'
  " Plug  'gisphm/vim-gitignore'
  " Plug  'hashivim/vim-terraform'
  " Plug  'jparise/vim-graphql'
  " Plug  'moll/vim-node'
  " Plug  'neoclide/jsonc.vim'
  " Plug  'npxbr/glow.nvim'
  " Plug  'pearofducks/ansible-vim'
  " Plug  'rodjek/vim-puppet'
  " Plug  'tpope/vim-git'
  " Plug  'wgwoods/vim-systemd-syntax'
  " Plug  'zinit-zsh/zinit-vim-syntax'
  " Plug  'LnL7/vim-nix'

  " Plug  'PotatoesMaster/i3-vim-syntax'
  " Plug 'plasticboy/vim-markdown'
  " Plug 'bfrg/vim-jq'
  " Plug 'mtdl9/vim-log-highlighting'


call plug#end()
