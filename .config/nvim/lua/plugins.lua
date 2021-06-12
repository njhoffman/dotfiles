-- require"utils.bootstrap_packer"

local packer = require "packer"
local config = require "config"
local log = require "logger"

packer.startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- ====================================
    -- Basic key mappings
    use "tpope/vim-repeat"
    use "blackCauldron7/surround.nvim"
    use "moll/vim-bbye"
    use "mhinz/vim-sayonara"

    -- Project management
    use "airblade/vim-rooter"
    use "rmagatti/auto-session"
    use "wakatime/vim-wakatime" -- WakaTimeToday, WakaTimeApiKey, WakaTimeDebugEnable

    -- ====================================
    -- -- Treesitter
    if config.Treesitter.enabled ~= 0 and config.Treesitter.enabled ~= false then
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = "nvim-lua/plenary.nvim"
      }
      use {"p00f/nvim-ts-rainbow", requires = "nvim-treesitter"}
      use {"windwp/nvim-ts-autotag", requires = "nvim-treesitter"}
      use {"nvim-treesitter/playground", requires = "nvim-treesitter"}
      use {"nvim-treesitter/nvim-treesitter-refactor", requires = "nvim-treesitter"}
    end

    -- ====================================
    -- LSP, Autocomplete and snippets
    if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
      use {
        "neovim/nvim-lspconfig",
        requires = {
          "jose-elias-alvarez/nvim-lsp-ts-utils",
          "jose-elias-alvarez/null-ls.nvim",
          "kabouzeid/nvim-lspinstall",
          "nvim-lua/lsp-status.nvim",
          "onsails/lspkind-nvim",
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim"
        }
      }
      -- use {"hrsh7th/vim-vsnip", event = "InsertEnter *", config = [[require('config.vsnip')]]}
      -- use {"hrsh7th/nvim-compe", event = "InsertEnter *", config = [[require('config.compe')]]}
      use "rafamadriz/friendly-snippets"
      use "kosayoda/nvim-lightbulb"
      use "glepnir/lspsaga.nvim"
      use "ray-x/lsp_signature.nvim"
      use {"hrsh7th/vim-vsnip"}
      use {"hrsh7th/nvim-compe"}
    end

    -- ====================================
    -- -- Syntax add-ons
    use {
      -- jsx/tsx syntax
      "yuezk/vim-js",
      "HerringtonDarkholme/yats.vim",
      "maxmellon/vim-jsx-pretty",
      -- plucked syntax from vim-polyglot
      "GutenYe/json5.vim",
      "StanAngeloff/php.vim",
      "andrewstuart/vim-kubernetes",
      "arzg/vim-sh",
      "chr4/nginx.vim",
      "chrisbra/csv.vim",
      "editorconfig/editorconfig-vim",
      "ekalinin/Dockerfile.vim",
      "elzr/vim-json",
      "ericpruitt/tmux.vim",
      "gisphm/vim-gitignore",
      "hashivim/vim-terraform",
      "jparise/vim-graphql",
      "moll/vim-node",
      "neoclide/jsonc.vim",
      "npxbr/glow.nvim",
      "pearofducks/ansible-vim",
      "rodjek/vim-puppet",
      "tpope/vim-git",
      "tpope/vim-liquid",
      "wgwoods/vim-systemd-syntax",
      "zinit-zsh/zinit-vim-syntax"
      -- to fix https://github.com/neoclide/coc-snippets/issues/126
      -- 'honza/vim-snippets'
    }

    -- ====================================
    -- DAP
    if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
      use {
        "rcarriga/nvim-dap-ui",
        requires = {
          "theHamsta/nvim-dap-virtual-text",
          "mfussenegger/nvim-dap"
        }
      }
    end

    -- ====================================
    -- Integrations
    use "preservim/vimux"
    use {"vimwiki/vimwiki", branch = "dev"}
    use {"skywind3000/asynctasks.vim", requires = "skywind3000/asyncrun.vim"}
    use {"urbainvaes/vim-ripple", requires = "machakann/vim-highlightedyank"}
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- ====================================
    -- Pickers (telescope, fzf)
    use "matbme/JABS.nvim"
    use {"junegunn/fzf.vim", requires = {"junegunn/fzf", dir = "~/.fzf", run = "./install --all"}}
    use {
      "yuki-yano/fzf-preview.vim",
      dir = "~/.fzf",
      branch = "release/rpc",
      requires = {"junegunn/fzf", "ryanoasis/vim-devicons"}
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
        -- {'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim'}
      }
    }
    use {"nvim-telescope/telescope-fzy-native.nvim", requires = "nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-project.nvim", requires = "nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-fzf-native.nvim", requires = "nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-packer.nvim", requires = "nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-dap.nvim", requires = {"mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim"}}
    use {"rmagatti/session-lens", requires = {"rmagatti/auto-session", "nvim-telescope/telescope.nvim"}}
    use {
      "GustavoKatel/telescope-asynctasks.nvim",
      requires = {"skywind3000/asynctasks.vim", "nvim-telescope/telescope.nvim"}
    }

    -- ====================================
    -- Visual enhancements
    use "gerw/vim-HiLinkTrace"
    use "joeysino/vim-plugin-AnsiEsc"
    use {"RRethy/vim-hexokinase", run = "make hexokinase"}
    use "kevinhwang91/nvim-hlslens"
    use "Xuyuanp/scrollbar.nvim"
    use "TaDaa/vimade"

    -- ====================================
    -- Motion plugins
    use "psliwka/vim-smoothie"
    use "chaoren/vim-wordmotion"
    use {"andymass/vim-matchup", event = "BufEnter"}

    -- ====================================
    -- Formatting utils
    use "junegunn/vim-easy-align"
    use "andrewradev/splitjoin.vim"
    use "folke/todo-comments.nvim"
    use "sbdchd/neoformat"
    use "b3nj5m1n/kommentary"
    use "terryma/vim-multiple-cursors"

    -- ====================================
    -- System utils
    -- Delete, Unlink, Move, Rename, Chmod, Mkdir, Cfind/locate, Lfind/locate, Wall, SudoWrite/Edit
    use "tpope/vim-eunuch"
    use "bchretien/vim-profiler"
    use "tweekmonster/startuptime.vim"
    use "qpkorr/vim-renamer"
    -- vim-profiler.py nvim -n 10
    -- vim-profiler.py -n 5 nvim foo.cc -c ":exec ':normal ia' | :q\!"
    -- strace gvim -V9log.txt file.tex > stdout.txt 2> stderr.txt

    -- ====================================
    -- Interface plugins
    use "glepnir/dashboard-nvim"
    use "kevinhwang91/nvim-bqf"
    use "folke/trouble.nvim"
    use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}
    use "akinsho/nvim-toggleterm.lua"
    use "sindrets/diffview.nvim"
    use "simnalamburt/vim-mundo"
    use "folke/which-key.nvim"
    use "svermeulen/vim-yoink"
    -- use 'windwp/nvim-spectre'
    --   use 'nacro90/numb.nvim'
    -- use 'dyng/ctrlsf.vim'
    -- use 'dstein64/nvim-scrollview'
    -- use 'chaoren/vim-wordmotion'
    -- ====================================

    -- ====================================
    -- Themes
    -- use "shaunsingh/nord.nvim"
    -- use "arcticicestudio/nord-vim"
    -- use "neg-serg/neg"
    -- use "kyazdani42/blue-moon"
    -- use "rockerBOO/boo-colorscheme-nvim"
    -- use "marko-cerovac/material.nvim"
    -- use "shaunsingh/moonlight.nvim"
    -- use "rafamadriz/neon"
    -- use "bluz71/vim-nightfly-guicolors"
    -- use "christianchiarulli/nvcode-color-schemes.vim"
    -- use "rakr/vim-one"
    -- lush themes
    -- use  {"npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim"}
    use {"romgrk/barbar.nvim", requires = "romgrk/doom-one.vim"}
    use "famiu/feline.nvim"

    use {
      "rktjmp/lush.nvim",
      config = function()
        vim.cmd("colorscheme nord")
        vim.cmd("source $HOME/.config/nvim/colors/barbar-colors.vim")
      end
    }
    -- use {"metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim"}
    -- use {
    --   "kunzaatko/nord.nvim",
    --   requires = "rktjmp/lush.nvim",
    --   config = function()
    --     vim.cmd("colorscheme nord")
    --   end
    -- }

    -- ====================================
    -- Motion
    -- vim-wordmotion, vim-sneak, 'terryma/vim-expand-region'
  end
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
-- "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
-- "gfanto/fzf-lsp.nvim"
-- -- Terminal
--   use 'voldikss/vim-floaterm'
-- Path navigation
-- use 'justinmk/vim-dirvish'
-- Plugin development
-- use 'folke/lua-dev.nvim'
--  Plug "rafcamlet/nvim_luapad"
-- "machakann/vim_sandwich",
--   "windwp/nvim_autopairs",
--   {"turbio/bracey.vim", run = "npm install_server"},
--   {"iamcco/markdown_preview.nvim", run = "cd app && yarn install"}
-- "~/repos/friendly_snippets"
