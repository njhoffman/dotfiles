" .editorconfig loader
Plug 'editorconfig/editorconfig-vim'

" don't apply to fugitive plugin or ssh connections
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
