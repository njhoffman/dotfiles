local config = require"config"
local Plugins = config.Plugins

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- ====================================
    -- Base packages
    require "plugins.packer"
    require "plugins.gitsigns"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use "tpope/vim-unimpaired"
    use "tpope/vim-sensible"
    use "nvim-lua/popup.nvim"

    -- ====================================
    -- LSP, Autocomplete and snippets
    if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
      use "jose-elias-alvarez/nvim-lsp-ts-utils"
      use "kabouzeid/nvim-lspinstall"
      use "neovim/nvim-lspconfig"
      use "nvim-lua/lsp-status.nvim"
      use "hrsh7th/vim-vsnip"
      require"plugins.lspsaga".setup(use)
      require"plugins.nvim-compe".setup(use)
      -- start lsp servers
      require"lsp".setup(use)
    end

    -- ====================================
    -- DAP
    if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
      use {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim"
      }
    end

    -- ====================================
    -- Fuzzy search (telescope, fzf)
    use {
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    }

    -- ====================================
    -- Treesitter and syntax
    use {
      {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
      "p00f/nvim-ts-rainbow"
    }

    -- ====================================
    -- Utils
    if Plugins.todo_comments ~= 0 and Plugins.todo_comments ~= false then
      require"plugins.todo-comments".setup(use)
    end
    if Plugins.neoformat ~= 0 and Plugins.neoformat ~= false then
      require"plugins.neoformat".setup(use)
    end
    if Plugins.kommentary ~= 0 and Plugins.kommentary ~= false then
      require"plugins.kommentary".setup(use)
    end
    if Plugins.nvim_hlslens ~= 0 and Plugins.nvim_hlslens ~= false then
      require"plugins.nvim-hlslens".setup(use)
    end

    -- ====================================
    -- Interface plugins
    if Plugins.nvim_bqf ~= 0 and Plugins.nvim_bqf ~= false then
      require"plugins.nvim-bqf".setup(use)
    end
    if Plugins.trouble ~= 0 and Plugins.trouble ~= false then
      require"plugins.trouble".setup(use)
    end
    if Plugins.mundo ~= 0 and Plugins.mundo ~= false then
      require"plugins.mundo".setup(use)
    end
    if Plugins.nvim_tree ~= 0 and Plugins.nvim_tree ~= false then
      require"plugins.nvim-tree".setup(use)
    end
    if Plugins.nvim_toggleterm ~= 0 and Plugins.nvim_toggleterm ~= false then
      require"plugins.nvim-toggleterm".setup(use)
    end

    -- ====================================
    -- Themes
    use {
      "famiu/feline.nvim",
      "kyazdani42/blue-moon",
      "rockerBOO/boo-colorscheme-nvim",
      {"npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim"},
      "marko-cerovac/material.nvim",
      "shaunsingh/moonlight.nvim",
      "neg-serg/neg",
      "rafamadriz/neon",
      "bluz71/vim-nightfly-guicolors",
      "arcticicestudio/nord-vim",
      "christianchiarulli/nvcode-color-schemes.vim",
      "rakr/vim-one"
    }

  end
)
-- {'glepnir/galaxyline.nvim', branch = 'main'},
-- "folke/which-key.nvim",
-- "machakann/vim-sandwich",
--   'akinsho/nvim-bufferline.lua'
--   "windwp/nvim-autopairs",
--   "norcalli/nvim-colorizer.lua",
--   {"turbio/bracey.vim", run = "npm install --prefix server"},
--   {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
--   {'haorenW1025/completion-nvim'},
-- "~/repos/friendly-snippets"
