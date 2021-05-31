local log = require("debug.log")

local user_config = {
  -- Name of the plugin. Prepended to log messages
  plugin = 'vlog.nvim',
  -- Should print the output to neovim while running
  use_console = false,
  -- Should highlighting be used in console (using echohl)
  highlights = true,
  -- Should write to a file
  use_file = true,
  -- Any messages above this level will be logged.
  level = "trace",
  -- Level configuration
  modes = {
    { name = "trace", hl = "Comment", },
    { name = "debug", hl = "Comment", },
    { name = "info",  hl = "None", },
    { name = "warn",  hl = "WarningMsg", },
    { name = "error", hl = "ErrorMsg", },
    { name = "fatal", hl = "ErrorMsg", },
  },
  -- Can limit the number of decimals displayed for floats
  float_precision = 0.01,
}

log.new(user_config, true)
return log


--   6   - /home/nicholas/.local/share/nvim/site/plugged/ack.vim/      │~compe#confirm('
-- ')    1 - /home/nicholas/.local/share/nvim/site/plugged/asyncrun.vim/ │~compe#confirm('
-- ')    2 - /home/nicholas/.local/share/nvim/site/plugged/asynctasks.vim│~compe#confirm('
-- ')    3 - /home/nicholas/.local/share/nvim/site/plugged/bclose.vim/   │~compe#confirm('
-- ')    4 - /home/nicholas/.local/share/nvim/site/plugged/bufexplorer/  │~compe#confirm('
-- ')    5 - /home/nicholas/.local/share/nvim/site/plugged/bufmru.vim/   │~compe#confirm('
-- ')    6 - /home/nicholas/.local/share/nvim/site/plugged/codi.vim/     │~compe#confirm('
-- ')    7 - /home/nicholas/.local/share/nvim/site/plugged/editorconfig-v│~compe#confirm('
-- ')    8 - /home/nicholas/.local/share/nvim/site/plugged/far.vim/      │~compe#confirm('
-- ')    9 - /home/nicholas/.local/share/nvim/site/plugged/fzf-floaterm/ │~compe#confirm('
-- ')   10 - /home/nicholas/.local/share/nvim/site/plugged/notifications.│~compe#confirm('
-- ')   11 - /home/nicholas/.local/share/nvim/site/plugged/nvim-reload/  │~compe#confirm('
-- ')   12 - /home/nicholas/.local/share/nvim/site/plugged/ranger.vim/   │~compe#confirm('
-- ')   13 - /home/nicholas/.local/share/nvim/site/plugged/sidepanel.vim/│~compe#confirm('
-- ')   14 - /home/nicholas/.local/share/nvim/site/plugged/startuptime.vi│~compe#confirm('
-- ')   15 - /home/nicholas/.local/share/nvim/site/plugged/suda.vim/     │~compe#confirm('
-- ')   16 - /home/nicholas/.local/share/nvim/site/plugged/ultisnips/    │~compe#confirm('
-- ')   17 - /home/nicholas/.local/share/nvim/site/plugged/vim-action-ag/│~compe#confirm('
-- ')   18 - /home/nicholas/.local/share/nvim/site/plugged/vim-browser-se│~compe#confirm('
-- ')   19 - /home/nicholas/.local/share/nvim/site/plugged/vim-bufmru/   │~compe#confirm('
-- ')   20 - /home/nicholas/.local/share/nvim/site/plugged/vim-easyclip/ │~compe#confirm('
-- ')   21 - /home/nicholas/.local/share/nvim/site/plugged/vim-endwise/  │~compe#confirm('
-- ')   22 - /home/nicholas/.local/share/nvim/site/plugged/vim-es2015-sni│~compe#confirm('
-- ')   23 - /home/nicholas/.local/share/nvim/site/plugged/vim-eunuch/   │~compe#confirm('
-- ')   24 - /home/nicholas/.local/share/nvim/site/plugged/vim-floaterm-r│~compe#confirm('
-- ')   25 - /home/nicholas/.local/share/nvim/site/plugged/vim-floaterm/ │~compe#confirm('
-- ')   26 - /home/nicholas/.local/share/nvim/site/plugged/vim-fugitive/ │~compe#confirm('
-- ')   27 - /home/nicholas/.local/share/nvim/site/plugged/vim-highlighte│~compe#confirm('
-- ')   28 - /home/nicholas/.local/share/nvim/site/plugged/vim-js-arrow-f│~compe#confirm('
-- ')   29 - /home/nicholas/.local/share/nvim/site/plugged/vim-matchup/  │~compe#confirm('
-- ')   30 - /home/nicholas/.local/share/nvim/site/plugged/vim-node/     │~compe#confirm('
-- ')   31 - /home/nicholas/.local/share/nvim/site/plugged/vim-obsession/│~compe#confirm('
-- ')   32 - /home/nicholas/.local/share/nvim/site/plugged/vim-over/     │~compe#confirm('
-- ')   33 - /home/nicholas/.local/share/nvim/site/plugged/vim-package-js│~compe#confirm('
-- ')   34 - /home/nicholas/.local/share/nvim/site/plugged/vim-pasta/    │~compe#confirm('
-- ')   35 - /home/nicholas/.local/share/nvim/site/plugged/vim-profiler/ │~compe#confirm('
-- ')   36 - /home/nicholas/.local/share/nvim/site/plugged/vim-prosession│~compe#confirm('
-- ')   37 - /home/nicholas/.local/share/nvim/site/plugged/vim-qf-preview│~compe#confirm('
-- ')   38 - /home/nicholas/.local/share/nvim/site/plugged/vim-qf/       │~compe#confirm('
-- ')   39 - /home/nicholas/.local/share/nvim/site/plugged/vim-rabbit-ui/│~compe#confirm('
-- ')   40 - /home/nicholas/.local/share/nvim/site/plugged/vim-radical/  │~compe#confirm('
-- ')   41 - /home/nicholas/.local/share/nvim/site/plugged/vim-react-snip│~compe#confirm('
-- ')   42 - /home/nicholas/.local/share/nvim/site/plugged/vim-renamer/  │~compe#confirm('
-- ')   43 - /home/nicholas/.local/share/nvim/site/plugged/vim-repeat/   │~compe#confirm('
-- ')   44 - /home/nicholas/.local/share/nvim/site/plugged/vim-ripple/   │~compe#confirm('
-- ')   45 - /home/nicholas/.local/share/nvim/site/plugged/vim-rooter/   │~compe#confirm('
-- ')   46 - /home/nicholas/.local/share/nvim/site/plugged/vim-sandwich/ │~compe#confirm('
-- ')   47 - /home/nicholas/.local/share/nvim/site/plugged/vim-sayonara/ │~compe#confirm('
-- ')   48 - /home/nicholas/.local/share/nvim/site/plugged/vim-slime/    │~compe#confirm('
-- ')   49 - /home/nicholas/.local/share/nvim/site/plugged/vim-speeddatin│~compe#confirm('
-- ')   50 - /home/nicholas/.local/share/nvim/site/plugged/vim-superman/ │~compe#confirm('
-- ')   51 - /home/nicholas/.local/share/nvim/site/plugged/vim-table-mode│~compe#confirm('
-- ')   52 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux-clipb│~compe#confirm('
-- ')   53 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux-navig│~compe#confirm('
-- ')   54 - /home/nicholas/.local/share/nvim/site/plugged/vim-tmux/     │~compe#confirm('
-- ')   55 - /home/nicholas/.local/share/nvim/site/plugged/vim-visual-mul│~compe#confirm('
-- ')   56 - /home/nicholas/.local/share/nvim/site/plugged/vim-wakatime/ │~compe#confirm('
-- ')   57 - /home/nicholas/.local/share/nvim/site/plugged/vim-wordmotion│~compe#confirm('
-- ')   58 - /home/nicholas/.local/share/nvim/site/plugged/vimux/        │~compe#confirm('
-- ')   59 - /home/nicholas/.local/share/nvim/site/plugged/vimwiki/      │~compe#confirm('
-- ')   60 - /home/nicholas/.local/share/nvim/site/plugged/vista.vim/    │~compe#confirm('
-- ')   61 - /home/nicholas/.local/share/nvim/site/plugged/yankround.vim/│~compe#confirm('
-- ')
