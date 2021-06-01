local plugin = {}

function set_mappings()
  -- (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
  vim.cmd("map <silent> <A-p> :<C-u>FzfPreviewFromResources buffer project<CR>")
  -- vim.cmd('map <silent> <A-p> :<C-u>FzfPreviewDirectoryFiles <C-R>=$HOME<CR><CR>')
  vim.cmd("map <silent> <C-p> :<C-u>call GFilesFallback()<CR>")
  vim.cmd("map <silent> <A-p> :<C-u>FzfPreviewFromResources old<CR>")
  vim.cmd("map <silent> <A-o> :<C-u>FzfPreviewDirectoryFiles ~<CR>")
  -- vim.cmd('map <silent> <C-t> :<C-u>AsyncTaskFzf <CR>')
  -- vim.cmd('map <silent> <A-t> :<C-u>AsyncTaskFzf <CR>')
  vim.cmd("map <silent> <C-y> :<C-u>FzfPreviewYankround<CR>")
  vim.cmd("map <silent> <C-g> :<C-u>FzfPreviewGitActions<CR>")
  vim.cmd("map <silent> <A-g> :<C-u>FzfPreviewGitStatus<CR>")
  vim.cmd("map <silent> <C-u> :<C-u>FzfPreviewFromResources old<CR>")
  vim.cmd("map <silent> <A-u> :<C-u>FzfPreviewCommandPalette<CR>")
  vim.cmd("map <silent> <C-d> :<C-u>FzfPreviewGitCurrentLogs<CR>")
  vim.cmd("map <silent> <A-d> :<C-u>FzfPreviewGitLogs<CR>")
  vim.cmd("map <silent> <C-e> :FzfPreviewAllBuffers<CR>")
  vim.cmd("map <silent> <A-m> :FzfPreviewLocationList<CR>")

  vim.cmd("nmap <Leader>f [fzf-p]")
  -- vim.cmd('nnoremap <silent> [fzf-p]p     :<C-u>GFilesFallback<CR>')
  vim.cmd("nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActions<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>")
  -- nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  -- nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  vim.cmd("nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>")
  -- vim.cmd('xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"')
  vim.cmd("nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>")
  vim.cmd("nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>")
end

function set_config()
  vim.cmd([[let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }]])
  vim.cmd(
    [[let g:fzf_preview_filelist_command = "rg --files --hidden --no-ignore-vcs --follow --no-messages -g \!\"* *\""]]
  )
  -- vim.cmd([[let g:fzf_preview_fzf_color_option = "bg:#000008,bg+:#002222,spinner:#98BC99,hl:#58aeb5,fg:#a3a3b6,header:#586e75,info:#cb4b16,pointer:#07ae71,marker:#07ae71,fg+:#a3d3e6,prompt:#55FFFF,hl+:#07cea1"]])
  vim.cmd([[let g:fzf_preview_directory_files_command = "rg --files --hidden --follow --no-messages -g \!\"* *\""]])
  vim.g.fzf_preview_preview_key_bindings =
    "Ctrl-/:toggle-preview,ctrl-p:up,ctrl-n:down,tab:down,shift-tab:up,ctrl-b:page-up,ctrl-f:page-down,alt-g:top,alt-b:page-up+page-up+page-up,alt-f:page-down+page-down+page-down,alt-n:toggle-down,alt-p:toggle-up,alt-space:toggle,ctrl-alt-a:toggle-all,alt-a:toggle-all,up:preview-up,down:preview-down,pgup:preview-page-up,pgdn:preview-page-down,shift-up:preview-page-up,shift-down:preview-page-down,ctrl-y:execute-silent(echo {+} | xsel --clipboard),ctrl-e:execute(nvim {+} < /dev/tty > /dev/tty 2>&1),ctrl-v:execute(code {+})"
  vim.g.fzf_preview_command = "bat --color=always --plain {-1}"
  vim.g.fzf_preview_fzf_preview_window_option = "down:50%"
  vim.g.fzf_preview_dev_icons_limit = 20000
  vim.g.fzf_preview_grep_cmd = "rg --line-number --no-heading --hidden"
  vim.g.fzf_preview_lines_command = "bat --color=always --plain --number"
  vim.g.fzf_preview_use_dev_icons = 1
  vim.g.fzf_preview_dev_icon_prefix_string_length = 3

  -- vim.cmd([[$FZF_PREVIEW_PREVIEW_BAT_THEME = "ansi-dark"]])
end

function plugin.load()
  set_config()
  set_mappings()
end

function plugin.setup(use)
  use {
    "yuki-yano/fzf-preview.vim",
    dir = "~/.fzf",
    -- branch = "release/rpc",
    branch = "release/remote",
    run = ":UpdateRemotePlugins",
    requires = {"junegunn/fzf"}
  }
  plugin.load()
end

return plugin

-- :FzfPreviewProjectFiles
-- :FzfPreviewGitFiles
-- :FzfPreviewDirectoryFiles {path or none}
-- :FzfPreviewBuffers
-- :FzfPreviewAllBuffers
-- :FzfPreviewProjectMruFiles
-- :FzfPreviewProjectMrwFiles
-- :FzfPreviewProjectGrep {args}
-- :FzfPreviewProjectGrepRecall
-- :FzfPreviewCtags
-- :FzfPreviewBufferTags
-- :FzfPreviewOldFiles
-- :FzfPreviewMruFiles
-- :FzfPreviewMrwFiles
-- :FzfPreviewQuickFix
-- :FzfPreviewLocationList
-- :FzfPreviewLines
-- :FzfPreviewBufferLines
-- :FzfPreviewJumps
-- :FzfPreviewChanges
-- :FzfPreviewFromResources
-- :FzfPreviewCommandPalette
-- :FzfPreviewGitActions
-- :FzfPreviewGitStatus
-- :FzfPreviewVistaCtags
-- :FzfPreviewVistaBufferCtags
-- :FzfPreviewBookmarks
-- :FzfPreviewYankround
-- :FzfPreviewMemoList
-- :FzfPreviewMemoListGrep
-- :FzfPreviewBlamePR
