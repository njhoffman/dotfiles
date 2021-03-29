" display undo history in a graph
" J / K / D, u (undo), c-r (redo)
Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2

" e.g. using 'd' instead of 'days' to save some space.
let g:undotree_ShortIndicators = 1

" undotree window width
if g:undotree_ShortIndicators == 1
  let g:undotree_SplitWidth = 40
else
  let g:undotree_SplitWidth = 46
endif

" diff window height
let g:undotree_DiffpanelHeight = 7

" auto open diff window
let g:undotree_DiffAutoOpen = 0

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
let g:undotree_SetFocusWhenToggle = 0

" tree node shape.
let g:undotree_TreeNodeShape = '*'

let g:undotree_DiffCommand = "delta"
" relative timestamp
let g:undotree_RelativeTimestamp = 1

" Highlight changed text
let g:undotree_HighlightChangedText = 1

" Highlight changed text using signs in the gutter
let g:undotree_HighlightChangedWithSign = 1

" Highlight linked syntax type.
" You may chose your favorite through :hi command
let g:undotree_HighlightSyntaxAdd = "DiffAdd"
let g:undotree_HighlightSyntaxChange = "DiffChange"
let g:undotree_HighlightSyntaxDel = "DiffDelete"

" Show help line
let g:undotree_HelpLine = 1


