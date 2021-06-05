local config = require("config")
local map = require("utils.core").map

-- map underscore to remove search highlighting
map("n", "_", ":nohl<CR>")

-- Blink current search match
-- vim.cmd('nnoremap <silent> n n:call <SID>BlinkCurrentMatch()<CR>')
-- vim.cmd('nnoremap <silent> N N:call <SID>BlinkCurrentMatch()<CR>')

-- Note that g! is equivalent to v, so you could also do the above with:
-- deleting lines
-- :g/profile/d
-- :g/^\s*$/d
-- :g!/^\s*"/d

-- basics
map("i", "jk", [[col('.') == 1 ? '<esc>' : '<esc>l']], {expr = true})
map("n", "Q", "<Nop>")
map("n", "<leader>tS", ":luafile %<CR>", {silent = false})
map("n", "<BS>", "<C-^>")
map("t", "<C-o>", [[<C-\><C-n>]])
map("n", "<A-t>", ":ToggleTerm<CR>")
map("t", "<A-t>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("n", "D", "dd")

-- Remap for dealing with word wrap in Normal mode/Visual mode
map("n", "k", 'v:count == 0 ? "gk" : "k"', {expr = true})
map("n", "j", 'v:count == 0 ? "gj" : "j"', {expr = true})
map("x", "k", '(v:count == 0 && mode() !=# "V") ? "gk" : "k"', {expr = true})
map("x", "j", '(v:count == 0 && mode() !=# "V") ? "gj" : "j"', {expr = true})

-- new files
map("n", "<leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<leader>ns", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<leader>nt", [[:tabedit <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})

-- text
map("n", [[<leader>tu]], [[guw]])
map("n", [[<leader>tU]], [[gUw]])
map("n", "<leader>t,", "A,<ESC>")
map("n", "<leader>t;", "A;<ESC>")
map("n", "<leader>t:", "A:<ESC>")

-- Automatically jump to the end of pasted text
map("v", "y", "y`]")
map("v", "p", "p`]")
map("n", "p", "p`]")

-- buffer management
-- map("n", "<Leader>w", "<cmd>w<cr>", {silent = true})
map("c", "W<cr>", ":noa w<cr>", {silent = true})
map("n", "<C-q>", "<cmd>qa!<cr>", {silent = true})
map("n", "<C-x>", "<cmd>xa!<cr>", {silent = true})
map("n", "<C-s>", "<cmd>w<cr>", {silent = true})
map("i", "<C-s>", "<esc><cmd>w<cr>", {silent = true})
map("n", "<leader>x", "<cmd>Sayonara<cr>", {silent = true, nowait = true})
map("n", "<Leader>!", ":BufferCloseAllButCurrent<CR>")
map("n", "<TAB>", ":bn<CR>")
map("n", "<S-TAB>", ":bp<CR>")
map("n", "<leader>*", ":wa<CR>")
map("n", "<leader>q", ":update | bdelete<CR>")
map("n", "H", "<cmd>BufferPrev<CR>")
map("n", "L", "<cmd>BufferNext<CR>")

-- Esc in the terminal
map("t", "jj", [[<C-\><C-n>]])

-- Window movement
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
map("n", "<Leader>;", "<c-w>w")
map("n", "<Leader>H", "<cmd>vnew<cr>")
map("n", "<Leader>V", "<cmd>new<cr>")
-- make full screen / equal heights, close non-focused window
map("n", "<Leader>_", "<c-w>_")
map("n", "<Leader>|", "<c-w>|")
map("n", "<Leader>=", "<c-w>=")
map("n", "<Leader>q", "<c-w><c-p><cmd>q<cr>")
-- map("n", "<S-k>", ":resize -2<CR>")
-- map("n", "<S-j>", ":resize +2<CR>")
-- map("n", "<S-h>", ":vertical resize -2<CR>")
-- map("n", "<S-l>", ":vertical resize +2<CR>")
-- " C-W make all equal, C-W -/+ change height, CTRL-W >/< change width
-- nnoremap + 4<C-W>+
-- nnoremap - 4<C-W>-

-- visual mode mappings
-- Visually select, paste the text that was last edited/pasted
map("n", "gV", "`[v`]", {noremap = false})
map("n", "<leader>[", "`[V`]<", {noremap = true})
map("n", "<leader>]", "`[V`]>", {noremap = true})
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")

map("n", "<F5>", ":lua require('utils.core')._lazygit_toggle()<CR>")
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")

-- LSP
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", ":Telescope lsp_definitions<CR>")
map("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>")
map("n", "gr", ":Telescope lsp_references<CR>")
map("n", "gh", ":Lspsaga hover_doc<CR>")
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<c-p>", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "<c-n>", ":Lspsaga diagnostic_jump_next<CR>")

local wkmaps = {
  ["g"] = {
    ["V"] = "visually select last edited/pasted text",
    ["d"] = "LSP definition",
    ["D"] = "LSP declaration",
    ["r"] = "LSP declaration",
    ["y"] = "LSP type definition",
    ["h"] = "LSP doc",
    ["c"] = "comment text",
    ["cc"] = "comment line"
  },
  ["s"] = {
    a = "add surrounding",
    d = "delete surrounding",
    db = "automatically seearch and delete",
    r = "replace surrounding",
    rb = "automatically search and select to replace"
  },
  ["<leader>"] = {
    ["!"] = "close all buffers but current",
    ["*"] = "save all buffers",
    ["b"] = "show buffers",
    ["q"] = "quit buffer",
    ["w"] = "save",
    ["e"] = "explorer",
    ["u"] = {"<cmd>MundoToggle<cr>", "undo tree"},
    ["h"] = "no highlight",
    -- ["["] = {"<cmd>bprev<cr>", "prev buffer"},
    -- ["]"] = {"<cmd>bnext<cr>", "next buffer"},
    f = {
      name = "find",
      c = {"<cmd>Telescope colorscheme<cr>", "colorscheme"},
      f = {"<cmd>Telescope find_files<cr>", "file"},
      g = {"<cmd>Telescope live_grep<cr>", "grep text"},
      h = {"<cmd>Telescope help_tags<cr>", "vim tags"},
      n = {"<cmd>lua require('utils.core').search_nvim()<cr>", "nvim dotfiles"},
      o = {"<cmd>Telescope oldfiles<cr>", "recent files"},
      p = "personal config",
      pc = {"<cmd>e ~/.config/nvim/lua/config.lua<cr>", "config"},
      pi = {"<cmd>e ~/.config/nvim/lua/init.lua<cr>", "init"},
      pp = {"<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "plugins"},
      ps = {"split"},
      psc = {"<cmd>vsp ~/.config/nvim/lua/config.lua<cr>", "split config"},
      psi = {"<cmd>vsp ~/.config/nvim/lua/init.lua<cr>", "split init"},
      psp = {"<cmd>vsp ~/.config/nvim/lua/plugins.lua<cr>", "split plugins"}
    },
    n = {
      name = "new",
      f = "create new file",
      s = "create new file in a split",
      t = "create new file in tab"
    },
    g = {
      name = "git",
      f = {"<cmd>Telescope git_files<cr>", "files"},
      c = {"<cmd>Telescope git_commits<cr>", "commits"},
      b = {"<cmd>Telescope git_branches<cr>", "branches"},
      s = {"<cmd>Telescope git_status<cr>", "status"},
      n = {"<cmd>Gitsigns next_hunk<cr>", "next hunk"},
      p = {"<cmd>Gitsigns prev_hunk<cr>", "prev hunk"},
      v = {"<cmd>Gitsigns preview_hunk<cr>", "preview hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "reset hunk"},
      R = {"<cmd>Gitsigns reset_buffer<cr>", "reset buffer"}
    },
    l = {
      name = "LSP",
      a = {"<cmd>Lspsaga code_action<cr>", "code action"},
      A = {"<cmd>Lspsaga range_code_action<cr>", "selected action"},
      d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics"},
      D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics"},
      l = {"<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics"},
      f = {"<cmd>Lspsaga lsp_finder<cr>", "LSP finder"},
      i = {"<cmd>LspInfo<cr>", "LSP info"},
      k = {"<cmd>Lspsaga signature_help<cr>", "LSP signature help"},
      h = {"<cmd>Lspsaga hover_doc<cr>", "hover document"},
      F = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
      p = {"<cmd>Lspsaga preview_definition<cr>", "preview definition"},
      r = {"<cmd>Lspsaga rename<cr>", "rename"},
      s = {"<cmd>Telescope lsp_document_symbols<cr>", "document symbols"},
      S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols"},
      ["'"] = "LSP start",
      -- ["'t"] = {"<cmd>LspStart TsServer<cr>", "javascript, typescript"},
      -- ["'e"] = {"<cmd>LspStart emmet_ls<cr>", "emmet"},
      -- ["'b"] = {"<cmd>LspStart bashls<cr>", "bash"},
      -- ["'l"] = {"<cmd>LspStart sumneko_lua<cr>", "lua"},
      -- ["'c"] = {"<cmd>LspStart clangd<cr>", "C/C++"},
      -- ["'j"] = {"<cmd>LspStart jsonls<cr>", "json"},
      -- ["'p"] = {"<cmd>LspStart pyright<cr>", "python"},
      -- ["'L"] = {"<cmd>LspStart texlab<cr>", "latex"},
      -- ["'h"] = {"<cmd>LspStart html<cr>", "HTML"},
      -- ["'C"] = {"<cmd>LspStart cssls<cr>", "CSS"},
      ["."] = {"LSP stop"},
      [".a"] = {"<cmd>LspStop<cr>", "stop all"},
      [".s"] = {"select"}
    },
    j = {
      name = "jump windows",
      h = {"<cmd>wincmd h<cr>", "Left"},
      j = {"<cmd>wincmd j<cr>", "Down"},
      k = {"<cmd>wincmd k<cr>", "Up"},
      l = {"<cmd>wincmd l<cr>", "Right"}
    },
    -- T = {
    --   name = "tabs",
    --   n = {"<cmd>tabnext<cr>", "next"},
    --   p = {"<cmd>tabprevious<cr>", "previous"},
    --   q = {"<cmd>tabclose<cr>", "quit tab"}
    -- },
    -- t = {
    --   name = "text",
    --   [","] = "add comma to end of line",
    --   [";"] = "add semicolon to end of line",
    --   [":"] = "add colon to end of line",
    --   u = "lowercase",
    --   U = "uppercase",
    --   S = "source file"
    -- },
    s = {
      name = "session",
      s = {"<cmd>SSave<cr>", "session save"},
      c = {"<cmd>SClose<cr>", "session close"},
      d = {"<cmd>SDelete<cr>", "session delete"},
      l = {"<cmd>SLoad<cr>", "session load"}
    },
    o = {
      name = "open",
      t = {"<cmd>ToggleTerm<cr>", "terminal"},
      e = {"<cmd>NvimTreeFindFile<cr>", "find current file"},
      u = {"<cmd>MundoToggle<cr>", "undo tree"}
    },
    p = {
      name = "plugins",
      u = {"<cmd>PackerUpdate<cr>", "update"},
      i = {"<cmd>PackerInstall<cr>", "install"},
      S = {"<cmd>PackerSync<cr>", "sync"},
      c = {"<cmd>PackerClean<cr>", "clean"},
      s = {"<cmd>PackerStatus<cr>", "status"}
    }
  }
}

require("which-key").register(wkmaps, opts)

-- vim.g.dashboard_custom_shortcut = {
--   last_session       = 'SPC s l',
--   find_history       = 'SPC f h',
--   find_file          = 'SPC f f',
--   new_file           = 'SPC c n',
--   change_colorscheme = 'SPC t c',
--   find_word          = 'SPC f a',
--   book_marks         = 'SPC f b',

-- }
--fzf

-- <plug>(fzf-maps-n)	Normal mode mappings
-- <plug>(fzf-maps-i)	Insert mode mappings
-- <plug>(fzf-maps-x)	Visual mode mappings
-- <plug>(fzf-maps-o)	Operator-pending mappings
-- <plug>(fzf-complete-word)	cat /usr/share/dict/words
-- <plug>(fzf-complete-path)	Path completion using find (file + dir)
-- <plug>(fzf-complete-file)	File completion using find
-- <plug>(fzf-complete-line)	Line completion (all open buffers)
-- vim.cmd("map <silent> <A-/> :Helptags<CR>")
-- vim.cmd("map <silent> <A-e> :Sessions<CR>")
-- vim.cmd("map <silent> <A-j> :FzfPreviewJumpsRpc<CR>")
-- vim.cmd("map <silent> <A-s> :Rg<CR>")
-- vim.cmd("map <silent> <A-s> :FzfPreviewProjectGrepRpc<CR>")
-- vim.cmd('map <silent> <A-v> :Vista!!<CR>')
-- vim.cmd('map <silent> <A-y> :<C-u>Snippets<CR>')
-- fzf-preview
-- -- (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
-- vim.cmd("map <silent> <A-p> :<C-u>FzfPreviewFromResourcesRpc buffer project<CR>")
-- -- vim.cmd('map <silent> <A-p> :<C-u>FzfPreviewDirectoryFiles <C-R>=$HOME<CR><CR>')
-- vim.cmd("map <silent> <C-p> :<C-u>call GFilesFallback()<CR>")
-- vim.cmd("map <silent> <A-p> :<C-u>FzfPreviewFromResourcesRpc old<CR>")
-- vim.cmd("map <silent> <A-o> :<C-u>FzfPreviewDirectoryFilesRpc ~<CR>")
-- -- vim.cmd('map <silent> <C-t> :<C-u>AsyncTaskFzf <CR>')
-- -- vim.cmd('map <silent> <A-t> :<C-u>AsyncTaskFzf <CR>')
-- -- vim.cmd("map <silent> <C-y> :<C-u>FzfPreviewYankround<CR>")
-- vim.cmd("map <silent> <C-g> :<C-u>FzfPreviewGitActionsRpc<CR>")
-- vim.cmd("map <silent> <A-g> :<C-u>FzfPreviewGitStatusRpc<CR>")
-- vim.cmd("map <silent> <C-u> :<C-u>FzfPreviewFromResourcesRpc old<CR>")
-- vim.cmd("map <silent> <A-u> :<C-u>FzfPreviewCommandPaletteRpc<CR>")
-- vim.cmd("map <silent> <C-d> :<C-u>FzfPreviewGitCurrentLogsRpc<CR>")
-- vim.cmd("map <silent> <A-d> :<C-u>FzfPreviewGitLogsRpc<CR>")
-- vim.cmd("map <silent> <C-e> :FzfPreviewAllBuffersRpc<CR>")
-- vim.cmd("map <silent> <A-m> :FzfPreviewLocationListRpc<CR>")

-- vim.cmd("nmap <Leader>f [fzf-p]")
-- -- vim.cmd('nnoremap <silent> [fzf-p]p     :<C-u>GFilesFallback<CR>')
-- vim.cmd("nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>")
-- -- nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
-- -- nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
-- vim.cmd("nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>")
-- -- vim.cmd('xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"')
-- vim.cmd("nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>")
-- vim.cmd("nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>")
--
-- gitsigns
-- keymaps = {
--   -- Default keymap options
--   noremap = true,
--   buffer = true,
--   ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
--   ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
--   ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
--   ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
--   ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
--   ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
--   ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
--   -- Text objects
--   ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
--   ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
-- },
-- map("n", ",gdb", "<Plug>(EasyAlign)", {noremap = false, silent = true})
-- map("n", "<F6>", ":NvimTreeToggle<CR>")
-- map("n", "<C-n>", ":NvimTreeToggle<CR>")
-- vim.api.nvim_set_keymap("n", "<Leader>d", ":Sayonara<CR>", {noremap = true, silent = true})
-- map("n", "<leader>wk", ":WhichKey<CR>", {silent = true})
-- map("n", "<unique><C-F>", "<Plug>(SmoothieForwards)")
-- map("n", "<unique><S-Down>", "<Plug>(SmoothieForwards)")
-- map("n", "<unique><C-B>", "<Plug>(SmoothieBackwards)")
-- map("n", "<unique><S-Up", "<Plug>(SmoothieBackwards)")
-- map("n", "<leader>ff", ":Telescope find_files<CR>")
-- map("n", "<leader>fo", ":Telescope oldfiles<CR>")
-- map("n", "<leader>fg", ":Telescope live_grep<CR>")
-- map("n", "<leader>fh", ":Telescope help_tags<CR>")
-- map("n", "<leader>fc", ":Telescope colorscheme<CR>")
-- map("n", "<leader>fn", ":lua require('utils.core').search_nvim()<CR>")
-- map("n", "<leader>b", ":Telescope buffers show_all=true sort_lastued=true<CR>")

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-p>",
--   ":lua require'telescope'.extensions.project.project{}<CR>",
--   {noremap = true, silent = true}
-- )
-- map("n", "<F8>", [[:lua require('dap').continue()<CR>]])
-- map("n", "<F5>", ":MundoToggle<CR>")
-- map("n", "<F9>", [[:lua require('dap').step_over()<CR>]])
-- map("n", "<F10>", [[:lua require('dap').step_into()<CR>]])
-- map("n", "<F11>", [[:lua require('dap').step_out()<CR>]])
-- map("n", "<S-F12>", [[:lua require('dap').repl.run_last()<CR>]])
-- map("n", "<leader>tb", [[:lua require"dap".toggle_breakpoint()<CR>]])
-- map("n", "<leader>cb", [[:lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>]])
-- map("n", "<leader>lb", [[:lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>]])
-- map("n", "<Leader>/", ":Ack!<Space>")
-- map("n", "<Leader>/", "<Plug>AgActionWord")
-- map("v", "<Leader>/", "<Plug>AgActionVisual")
--
-- noremap <Space> :<c-u>noh<CR>:echo<CR>

-- " select put text, via http://stackoverflow.com/a/4775281/955926
-- " toggle fold under cursor
-- nnoremap <silent> zz zA
-- nnoremap <silent> <Leader>z zA
-- " close all folds
-- nnoremap <silent> zZ zM
-- " open all folds
-- nnoremap <silent> ZZ zR

-- " map current directory
-- nnoremap <silent> <Leader>cd :cd %:h<CR>
-- nnoremap <silent> <Leader>cdh :cd ~<CR>
-- nnoremap <silent> <Leader>cdr :cd /<CR>
-- " better commandline mode mappings
-- cnoremap <silent> <M-[> <C-u>:History:<CR>
-- cnoremap <C-b> <Left>
-- cnoremap <C-f> <Right>
-- cnoremap <M-b> <S-Left>
-- cnoremap <M-f> <S-Right>
-- " <C-n>: next history.
-- " cnoremap <C-n>          <Down>
-- " <C-p>: previous history.
-- " cnoremap <C-p>          <Up>
-- " <C-y>: paste.
-- cnoremap <C-y>          <C-r>*
-- " <C-g>: Exit.
-- cnoremap <C-g>          <C-c>
-- nnoremap q; q:

-- " Disable ex mode
-- nnoremap Q <Nop>

-- print(vim.inspect(vim.api.nvim_get_keymap('n')))
-- :verbose nmap
-- set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
