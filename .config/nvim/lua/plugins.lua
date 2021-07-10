-- require"utils.bootstrap_packer"
local packer = require "packer"
local config = require "config"

return packer.startup({
  function(use)
    use "wbthomason/packer.nvim"

    -- luarocks install luaposix
    -- packer.use_rocks { "luaposix" }

    -- ====================================
    -- Basic key mappings
    use "tpope/vim-repeat"
    use "blackCauldron7/surround.nvim"
    use "moll/vim-bbye"
    use "mhinz/vim-sayonara"
    use "aymericbeaumet/vim-symlink"
    use "lambdalisue/suda.vim"
    use "jkramer/vim-checkbox"

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
        requires = { "nvim-lua/plenary.nvim", "ikatyang/tree-sitter-markdown" },
      }
      use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter" }
      use { "windwp/nvim-ts-autotag", requires = "nvim-treesitter" }
      use { "nvim-treesitter/playground", requires = "nvim-treesitter" }
      use { "romgrk/nvim-treesitter-context", requires = "nvim-treesitter" }
      use { "nvim-treesitter/nvim-treesitter-refactor", requires = "nvim-treesitter" }
      use { "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter" }

    end

    -- ====================================
    -- -- Syntax
    use "vim-pandoc/vim-pandoc-syntax"
    use "yuezk/vim-js"
    use "HerringtonDarkholme/yats.vim"
    use "maxmellon/vim-jsx-pretty"
    -- use { "xolox/vim-lua-ftplugin", requires = "xolox/vim-misc" }
    use "godlygeek/tabular"
    -- use "kchmck/vim-coffee-script"

    use "GutenYe/json5.vim"
    use "StanAngeloff/php.vim"
    use "andrewstuart/vim-kubernetes"
    use "arzg/vim-sh"
    use "chr4/nginx.vim"
    use "chrisbra/csv.vim"
    use "editorconfig/editorconfig-vim"
    use "ekalinin/Dockerfile.vim"
    use "elzr/vim-json"
    use "ericpruitt/tmux.vim"
    use "gisphm/vim-gitignore"
    use "hashivim/vim-terraform"
    use "jparise/vim-graphql"
    use "moll/vim-node"
    use "neoclide/jsonc.vim"
    use "npxbr/glow.nvim"
    use "pearofducks/ansible-vim"
    use "rodjek/vim-puppet"
    use "tpope/vim-git"
    use "wgwoods/vim-systemd-syntax"
    use "zinit-zsh/zinit-vim-syntax"
    use "LnL7/vim-nix"

    use "PotatoesMaster/i3-vim-syntax"
    use "plasticboy/vim-markdown"
    use "bfrg/vim-jq"
    use "mtdl9/vim-log-highlighting"
    use "njhoffman/vim-liquid"
    -- use "tpope/vim-liquid"

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
          "nvim-lua/lsp_extensions.nvim",
          "onsails/lspkind-nvim",
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
        },
      }
      -- use { "tsuyoshicho/vim-efm-langserver-settings", requires = "prabirshrestha/vim-lsp"}
      -- use {"hrsh7th/vim-vsnip", event = "InsertEnter *", config = [[require('config.vsnip')]]}
      -- use {"hrsh7th/nvim-compe", event = "InsertEnter *", config = [[require('config.compe')]]}
      use "ido-nvim/core"
      use "folke/lua-dev.nvim"
      use "kosayoda/nvim-lightbulb"
      use "folke/lsp-colors.nvim"
      use "glepnir/lspsaga.nvim"
      use "ray-x/lsp_signature.nvim"
      use "hrsh7th/nvim-compe"

      -- might have to: cd .local/share/nvim/site/pack/packer/start/compe-tabnine && ./install.sh
      use { "tzachar/compe-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-compe" }

      -- snippets
      use "hrsh7th/vim-vsnip"
      use "rafamadriz/friendly-snippets"
      use "norcalli/snippets.nvim"
      -- use { 'cstrap/python-snippets' }
      -- use { 'ylcnfrht/vscode-python-snippet-pack' }
      use { "xabikos/vscode-javascript" }
      -- use { 'golang/vscode-go' }
      -- use { 'rust-lang/vscode-rust' }

    end

    -- ====================================
    -- DAP
    if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
      use { "rcarriga/nvim-dap-ui", requires = { "theHamsta/nvim-dap-virtual-text", "mfussenegger/nvim-dap" } }
      use { "jbyuki/one-small-step-for-vimkind", requires = { "mfussenegger/nvim-dap" } }
      use { "mfussenegger/nvim-dap-python", requires = { "mfussenegger/nvim-dap" } }
    end

    -- ====================================
    -- Integrations
    use "preservim/vimux"
    -- use "tools-life/taskwiki"
    -- use "xarthurx/vim-taskwarrior"

    -- use {"vimwiki/vimwiki", branch = "dev"}
    -- use "chiefnoah/neuron-v2.vim"
    use { "skywind3000/asynctasks.vim", requires = "skywind3000/asyncrun.vim" }
    use { "vim-test/vim-test" }
    use { "urbainvaes/vim-ripple" }
    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      -- config = [[require('plugins.configs.lua.gitsigns')]]
      "tpope/vim-fugitive",
      -- cmd = {
      --   "GBrowse",
      --   "GDelete",
      --   "GMove",
      --   "GRemove",
      --   "GRename",
      --   "Gblame",
      --   "Gdiff",
      --   "Gdiffsplit",
      --   "Gedit",
      --   "Gfetch",
      --   "Ggrep",
      --   "Git",
      --   "Glgrep",
      --   "Gpull",
      --   "Gpush",
      --   "Gread",
      --   "Gsplit",
      --   "Gstatus",
      --   "Gvdiffsplit",
      --   "Gwrite"
      -- }
      --   "Gvdiffsplit",
      -- { "TimUntersberger/neogit" },
      -- }
    }
    -- { "TimUntersberger/neogit" },

    -- ====================================
    -- Pickers (telescope, fzf)
    use "matbme/JABS.nvim"
    use { "camspiers/snap", rocks = { "fzy" } }
    use { "junegunn/fzf.vim", requires = { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" } }
    use {
      "yuki-yano/fzf-preview.vim",
      dir = "~/.fzf",
      branch = "release/rpc",
      requires = { "junegunn/fzf", "ryanoasis/vim-devicons" },
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        -- {'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim'}
      },
    }
    -- FzyLsAg - list files using the silversearcher, respects .gitignore and .agignore and open it in the current buffer.
    -- FzyTag - list tags, open tag defintion in current buffer - a better :tselect.
    -- FzyWorkingTree - list all currently modified files and open in current buffer.
    -- FzyGem - list all gems, then list all files in the selected gem.
    -- FzyBuffer - fzy select :ls

    use {
      "oberblastmeister/neuron.nvim", -- "njhoffman/neuron.nvim",
      branch = "unstable",
      requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    }
    use { "nvim-telescope/telescope-fzy-native.nvim", requires = { "nvim-telescope/telescope.nvim", "Dkendal/fzy-vim" } }
    --[[ use {
    "nvim-telescope/telescope-project.nvim",
    requires = "nvim-telescope/telescope.nvim"
  } ]]
    use { "nvim-telescope/telescope-fzf-native.nvim", requires = "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-packer.nvim", requires = "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" } }
    use { "rmagatti/session-lens", requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" } }
    use {
      "GustavoKatel/telescope-asynctasks.nvim",
      requires = { "skywind3000/asynctasks.vim", "nvim-telescope/telescope.nvim" },
    }
    use {
      "sudormrfbin/cheatsheet.nvim",
      requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    }

    -- ====================================
    -- Visual enhancements
    use "gerw/vim-HiLinkTrace"
    use "joeysino/vim-plugin-AnsiEsc"
    use { "RRethy/vim-hexokinase", run = "make hexokinase" }
    use "kevinhwang91/nvim-hlslens"
    use "Xuyuanp/scrollbar.nvim"
    use "TaDaa/vimade"
    use "romainl/vim-cool"
    use "Pocco81/TrueZen.nvim"

    -- ====================================
    -- Motion plugins
    use "psliwka/vim-smoothie"
    use "chaoren/vim-wordmotion"
    use { "andymass/vim-matchup", event = "BufEnter" }
    use { "AckslD/nvim-anywise-reg.lua" }
    -- ====================================
    -- Formatting utils
    use "junegunn/vim-easy-align"
    use "andrewradev/splitjoin.vim"
    use "folke/todo-comments.nvim"
    use "b3nj5m1n/kommentary"
    use "terryma/vim-multiple-cursors"
    use "dhruvasagar/vim-table-mode"
    use "nicwest/vim-camelsnek"

    -- ====================================
    -- System utils
    -- Delete, Unlink, Move, Rename, Chmod, Mkdir, Cfind/locate, Lfind/locate, Wall, SudoWrite/Edit
    use "tpope/vim-eunuch"
    use "bchretien/vim-profiler"
    use "tweekmonster/startuptime.vim"
    use "qpkorr/vim-renamer"
    use { "famiu/nvim-reload", branch = "master" } -- experimental
    -- vim-profiler.py nvim -n 10
    -- vim-profiler.py -n 5 nvim foo.cc -c ":exec ':normal ia' | :q\!"
    -- strace gvim -V9log.txt file.tex > stdout.txt 2> stderr.txt

    -- ====================================
    -- Interface plugins
    use "glepnir/dashboard-nvim"
    use "kevinhwang91/nvim-bqf"
    use "folke/trouble.nvim"
    use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
    use "akinsho/nvim-toggleterm.lua"
    use "sindrets/diffview.nvim"
    use "simnalamburt/vim-mundo"
    use "folke/which-key.nvim"
    use "svermeulen/vim-yoink"
    use "ncm2/float-preview.nvim"
    use "voldikss/vim-floaterm"
    use "voldikss/fzf-floaterm"

    -- use { "voldikss/LeaderF-floaterm", requires = "Yggdroot/LeaderF" }
    -- use 'windwp/vim-floaterm-repl'
    -- use "mtth/scratch.vim"
    -- use 'windwp/nvim-spectre'
    --   use 'nacro90/numb.nvim'
    -- use 'dyng/ctrlsf.vim'
    -- use 'dstein64/nvim-scrollview'
    -- use 'chaoren/vim-wordmotion'
    -- ====================================

    -- ====================================
    -- Themes
    use { "romgrk/barbar.nvim", requires = "romgrk/doom-one.vim" }
    use "famiu/feline.nvim"
    use {
      "rktjmp/lush.nvim",
      config = function()
        vim.cmd("colorscheme nord-nick")
        vim.cmd("source $HOME/.config/nvim/colors/barbar-colors.vim")
      end,
    }
  end,
  config = {
    profile = {
      enable = false,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function() return require("packer.util").float({ border = "single" }) end,
      keybindings = { -- Keybindings for the display window
        quit = "<esc>",
        toggle_info = "<CR>",
        diff = "d",
        prompt_revert = "r",
      },
    },
  },
})

-- ====================================
-- Motion
-- vim-wordmotion, vim-sneak, 'terryma/vim-expand-region'
-- Git
-- use {
--   {'tpope/vim-fugitive', cmd = {'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull'}}, {
--     'lewis6991/gitsigns.nvim',
--     requires = {'nvim-lua/plenary.nvim'},
--     config = [[require('config.gitsigns')]],
--     event = 'BufEnter'
--   },
-- }
-- "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
-- "gfanto/fzf-lsp.nvim"
-- -- Terminal
--   use 'voldikss/vim-floaterm'
-- Path navigation
--    use 'tools-life/taskwiki'
-- use 'justinmk/vim-dirvish'
-- Plugin development
--  Plug "rafcamlet/nvim_luapad"
-- "machakann/vim_sandwich",
--   "windwp/nvim_autopairs",
--   {"turbio/bracey.vim", run = "npm install_server"},
--   {"iamcco/markdown_preview.nvim", run = "cd app && yarn install"}
-- "~/repos/friendly_snippets"
