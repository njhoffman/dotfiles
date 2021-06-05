-- require"utils.bootstrap_packer"

local packer = require "packer"
local config = require "config"
local log = require "logger"

packer.startup(
  function()
    use "wbthomason/packer.nvim"

    -- ====================================
    -- DAP
    if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
      require "plugins.dap".setup(use)
    end

    -- ====================================
    -- Basic key mappings and shared icon sets
    use "tpope/vim-repeat"
    use "ryanoasis/vim-devicons"
    require "plugins.vim_unimpaired".setup(use)
    require "plugins.vim_surround".setup(use)
    require "plugins.sayonara".setup(use)
    require "plugins.nvim_web_devicons".setup(use)
    require "plugins.gitsigns".setup(use)

    -- Project management
    require "plugins.vim-rooter".setup(use)
    require "plugins.auto-session".setup(use)
    use {"wakatime/vim-wakatime"} -- WakaTimeToday, WakaTimeApiKey, WakaTimeDebugEnable

    -- ====================================
    -- Treesitter and syntax
    if config.Treesitter.enabled ~= 0 and config.Treesitter.enabled ~= false then
      require "plugins.treesitter".setup(use)
    end
    require "plugins.syntax".setup(use)

    -- ====================================
    -- LSP, Autocomplete and snippets
    if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
      require "plugins.nvim_compe".setup(use)
      require "plugins.nvim-lightbulb".setup(use)
      require "plugins.lspsaga".setup(use)
      require "plugins.lsp_signature".setup(use)
      use {
        "neovim/nvim-lspconfig",
        requires = {
          "jose-elias-alvarez/nvim-lsp-ts-utils",
          "kabouzeid/nvim-lspinstall",
          "nvim-lua/lsp-status.nvim",
          "hrsh7th/vim-vsnip",
          "onsails/lspkind-nvim",
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim"
        }
      }
    end
    -- "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp

    -- "gfanto/fzf-lsp.nvim"
    -- ====================================
    -- Fuzzy search (telescope, fzf)
    require "plugins.fzf".setup(use)
    require "plugins.fzf_preview".setup(use)
    require "plugins.telescope".setup(use)
    -- require "plugins.leaderf".setup(use)

    -- ====================================
    -- Visual enhancements
    use {"gerw/vim-HiLinkTrace"}
    require "plugins.vim_plugin_AnsiEsc".setup(use)
    require "plugins.vim_hexokinase".setup(use)
    -- require "plugins.nvim_colorizer".setup(use)
    require "plugins.vimade".setup(use)

    -- ====================================
    -- Motion plugins
    require "plugins.vim_smoothie".setup(use)
    require "plugins.vim_sneak".setup(use)

    -- ====================================
    -- Formatting utils
    require "plugins.easyalign".setup(use)
    require "plugins.splitjoin".setup(use)
    require "plugins.todo_comments".setup(use)
    require "plugins.neoformat".setup(use)
    require "plugins.kommentary".setup(use)
    require "plugins.vim_multiple_cursors".setup(use)

    -- ====================================
    -- System utils
    -- Delete, Unlink, Move, Rename, Chmod, Mkdir, Cfind/locate, Lfind/locate, Wall, SudoWrite/Edit
    use {"tpope/vim-eunuch"}
    use {"bchretien/vim-profiler"}
    use {"tweekmonster/startuptime.vim"}
    use {"qpkorr/vim-renamer"}
    require "plugins.nvim_reload".setup(use)
    -- vim-profiler.py nvim -n 10
    -- vim-profiler.py -n 5 nvim foo.cc -c ":exec ':normal ia' | :q\!"

    -- ====================================
    -- Interface plugins
    require "plugins.dashboard-nvim".setup(use)
    require "plugins.nvim_bqf".setup(use)
    require "plugins.trouble".setup(use)
    require "plugins.diffview".setup(use)
    require "plugins.vim_mundo".setup(use)
    require "plugins.nvim_tree".setup(use)
    require "plugins.nvim_toggleterm".setup(use)
    require "plugins.nvim_hlslens".setup(use)
    require "plugins.which_key".setup(use)
    require "plugins.vim_yoink".setup(use)

    -- ====================================
    -- Integrations
    require "plugins.vimwiki".setup(use)
    require "plugins.vimux".setup(use)
    require "plugins.asynctasks".setup(use)
    require "plugins.nvim-gdb".setup(use)

    -- ====================================

    -- ====================================
    -- Themes
    use {
      "shaunsingh/nord.nvim"
      -- "arcticicestudio/nord-vim"
      -- "neg-serg/neg",
      -- "kyazdani42/blue-moon",
      -- "rockerBOO/boo-colorscheme-nvim",
      -- {"npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim"},
      -- "marko-cerovac/material.nvim",
      -- "shaunsingh/moonlight.nvim",
      -- "rafamadriz/neon",
      -- "bluz71/vim-nightfly-guicolors",
      -- "christianchiarulli/nvcode-color-schemes.vim",
      -- "rakr/vim-one"
    }
    require "plugins.feline".setup(use)
    require "plugins.barbar".setup(use)

    -- ====================================
    -- Motion
    -- vim-wordmotion, vim-sneak, 'terryma/vim-expand-region'
  end
)

local plugins =
  setmetatable(
  {},
  {
    __index = function(_, key)
      init()
      return packer[key]
    end
  }
)

return packer
-- Git
-- use {
--   {'tpope/vim-fugitive', cmd = {'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull'}}, {
--     'lewis6991/gitsigns.nvim',
--     requires = {'nvim-lua/plenary.nvim'},
--     config = [[require('config.gitsigns')]],
--     event = 'BufEnter'
--   }, {'TimUntersberger/neogit', opt = true}
-- }
-- -- Terminal
--   use 'voldikss/vim-floaterm'

--   -- REPLs
--   use {
--     'hkupty/iron.nvim',
--     setup = [[vim.g.iron_map_defaults = 0]],
--     config = [[require('config.iron')]],
--     cmd = {'IronRepl', 'IronSend', 'IronReplHere'}
-- }
-- Wrapping/delimiters
-- use {
--   'machakann/vim-sandwich',
--   {'andymass/vim-matchup', setup = [[require('config.matchup')]], event = 'BufEnter'}
-- }
--
-- Path navigation
-- use 'justinmk/vim-dirvish'

-- Plugin development
-- use 'folke/lua-dev.nvim'
--  Plug "rafcamlet/nvim_luapad"
-- "machakann/vim_sandwich",
--   "windwp/nvim_autopairs",
--   "norcalli/nvim_colorizer.lua",
--   {"turbio/bracey.vim", run = "npm install_server"},
--   {"iamcco/markdown_preview.nvim", run = "cd app && yarn install"}
-- "~/repos/friendly_snippets"

-- " automatically save sessions
-- Plug 'tpope/vim-obsession'
-- " :Obsess / :Obsess! <file> to record a sessoin
-- " vim -S <file> / :source <file>

-- " switch/manage sessions cleanly
-- Plug 'dhruvasagar/vim-prosession'
-- " Prosession {dir} -> switch to session in dir
-- " update tmux window with session
-- let g:prosession_tmux_title = 1
-- let g:prosession_tmux_title_format = "vim - @@@"
-- let g:prosession_on_startup = 1
-- " different sessions per branch
-- let g:prosession_per_branch = 0
