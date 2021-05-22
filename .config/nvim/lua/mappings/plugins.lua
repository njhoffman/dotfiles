local u = require("utils.core")

local plugins = {}
-- vim-mundo
  u.map('n', '<f5>',':MundoToggle<CR>')

-- nvim-tree
function plugins.nvim_tree()
  u.map("n", "<f6>", ":NvimTreeToggle<CR>")
  u.map("n", "<f7>", ":NvimTreeRefresh<CR>")
  u.map("n", "<f8>", ":NvimTreeFindFile<CR>")
end

function plugins.fzf_preview()
   -- (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
  vim.cmd('map <silent> <A-p> :<C-u>FzfPreviewFromResources buffer project<CR>')
  -- vim.cmd('map <silent> <A-p> :<C-u>FzfPreviewDirectoryFiles <C-R>=$HOME<CR><CR>')
  vim.cmd('map <silent> <C-p> :<C-u>call GFilesFallback()<CR>')
  vim.cmd('map <silent> <A-p> :<C-u>FzfPreviewFromResources old<CR>')
  vim.cmd('map <silent> <A-o> :<C-u>FzfPreviewDirectoryFiles ~<CR>')
  -- vim.cmd('map <silent> <C-t> :<C-u>AsyncTaskFzf <CR>')
  -- vim.cmd('map <silent> <A-t> :<C-u>AsyncTaskFzf <CR>')
  vim.cmd('map <silent> <C-y> :<C-u>FzfPreviewYankround<CR>')
  vim.cmd('map <silent> <C-g> :<C-u>FzfPreviewGitActions<CR>')
  vim.cmd('map <silent> <A-g> :<C-u>FzfPreviewGitStatus<CR>')
  vim.cmd('map <silent> <C-u> :<C-u>FzfPreviewFromResources old<CR>')
  vim.cmd('map <silent> <A-u> :<C-u>FzfPreviewCommandPalette<CR>')
  vim.cmd('map <silent> <C-d> :<C-u>FzfPreviewGitCurrentLogs<CR>')
  vim.cmd('map <silent> <A-d> :<C-u>FzfPreviewGitLogs<CR>')
  vim.cmd('map <silent> <C-e> :FzfPreviewAllBuffers<CR>')
  vim.cmd('map <silent> <A-m> :FzfPreviewLocationList<CR>')

  vim.cmd('nmap <Leader>f [fzf-p]')
  -- vim.cmd('nnoremap <silent> [fzf-p]p     :<C-u>GFilesFallback<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActions<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>')
  -- nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  -- nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  vim.cmd('nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>')
  -- vim.cmd('xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"')
  vim.cmd('nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>')
  vim.cmd('nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>')
end

--  fzf
function plugins.fzf()
  -- <plug>(fzf-maps-n)	Normal mode mappings
  -- <plug>(fzf-maps-i)	Insert mode mappings
  -- <plug>(fzf-maps-x)	Visual mode mappings
  -- <plug>(fzf-maps-o)	Operator-pending mappings
  -- <plug>(fzf-complete-word)	cat /usr/share/dict/words
  -- <plug>(fzf-complete-path)	Path completion using find (file + dir)
  -- <plug>(fzf-complete-file)	File completion using find
  -- <plug>(fzf-complete-line)	Line completion (all open buffers)
  vim.cmd('map <silent> <A-/> :Helptags<CR>')
  vim.cmd('map <silent> <A-e> :Sessions<CR>')
  vim.cmd('map <silent> <A-j> :FzfPreviewJumps<CR>')
  -- vim.cmd('map <silent> <A-s> :<C-u>GGrep<CR>')
  vim.cmd('map <silent> <A-s> :<C-u>RG<CR>')
  -- vim.cmd('map <silent> <A-v> :Vista!!<CR>')
  -- vim.cmd('map <silent> <A-y> :<C-u>Snippets<CR>')
end

-- telescope
function plugins.telescope()
  u.map("n", "<leader>ff", ":Telescope find_files<CR>")
  u.map("n", "<leader>fo", ":Telescope oldfiles<CR>")
  u.map("n", "<leader>fg", ":Telescope live_grep<CR>")
  u.map("n", "<leader>fh", ":Telescope help_tags<CR>")
  u.map("n", "<leader>fc", ":Telescope colorscheme<CR>")
  u.map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
  u.map("n", "<leader>b", ":Telescope buffers<CR>")
  -- remapped Esc Esc to close

end
-- vim-unimpaired
--  [<Space>        => add newlines
--  [p [P           => paste line after
--  =p =P           => paste line after reindenting
--  [a [q [b [l     => :next :cnext :bnext :lnext
--  [A [Q [b [L     => :last :clast :blast :llast
--  [o(x) s l n w p => options spell, list, number, wrap, paste
--  yo(x) s l n w p => toggle options
--  [f [n           => next file, next scm marker

return plugins
