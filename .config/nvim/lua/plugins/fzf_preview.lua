local plugin = {}
local plugin_maps = require('mappings.plugins')


function plugin.config()
  vim.cmd([[let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }]])
  vim.cmd([[let g:fzf_preview_filelist_command = "rg --files --hidden --no-ignore-vcs --follow --no-messages -g \!\"* *\""]])
  -- vim.cmd([[let g:fzf_preview_fzf_color_option = "bg:#000008,bg+:#002222,spinner:#98BC99,hl:#58aeb5,fg:#a3a3b6,header:#586e75,info:#cb4b16,pointer:#07ae71,marker:#07ae71,fg+:#a3d3e6,prompt:#55FFFF,hl+:#07cea1"]])
  vim.cmd([[let g:fzf_preview_directory_files_command = "rg --files --hidden --follow --no-messages -g \!\"* *\""]])
  vim.g.fzf_preview_preview_key_bindings = "Ctrl-/:toggle-preview,ctrl-p:up,ctrl-n:down,tab:down,shift-tab:up,ctrl-b:page-up,ctrl-f:page-down,alt-g:top,alt-b:page-up+page-up+page-up,alt-f:page-down+page-down+page-down,alt-n:toggle-down,alt-p:toggle-up,alt-space:toggle,ctrl-alt-a:toggle-all,alt-a:toggle-all,up:preview-up,down:preview-down,pgup:preview-page-up,pgdn:preview-page-down,shift-up:preview-page-up,shift-down:preview-page-down,ctrl-y:execute-silent(echo {+} | xsel --clipboard),ctrl-e:execute(nvim {+} < /dev/tty > /dev/tty 2>&1),ctrl-v:execute(code {+})"
  vim.g.fzf_preview_command = "bat --color=always --theme=base16 --plain {-1}"
  vim.g.fzf_preview_fzf_preview_window_option = "down:50%"
  vim.g.fzf_preview_dev_icons_limit = 20000
  vim.g.fzf_preview_grep_cmd = 'rg --line-number --no-heading --hidden'
  vim.g.fzf_preview_lines_command = "bat --color=always --theme=base16 --plain --number"
  vim.g.fzf_preview_use_dev_icons = 1
  vim.g.fzf_preview_dev_icon_prefix_string_length = 3

  -- vim.cmd([[$FZF_PREVIEW_PREVIEW_BAT_THEME = "ansi-dark"]])
end


function plugin.load()
  plugin.config()
  plugin_maps.fzf_preview()
end

function plugin.setup(use)
  use {
  'yuki-yano/fzf-preview.vim',
    branch = 'release/remote',
    dir = '~/.fzf',
    run = ':UpdateRemotePlugins',
    requires = {
      'junegunn/fzf',
    }
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
