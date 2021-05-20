require "utils.packer"
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    use "wbthomason/packer.nvim"

    -- LSP, Autocomplete and snippets
    use {
      {"glepnir/lspsaga.nvim"},
      {"hrsh7th/nvim-compe"},
      {"hrsh7th/vim-vsnip"},
      {"jose-elias-alvarez/nvim-lsp-ts-utils"},
      {"kabouzeid/nvim-lspinstall"},
      {"neovim/nvim-lspconfig"},
      {"nvim-lua/completion-nvim"},
      {"nvim-lua/diagnostic-nvim"},
      {"nvim-lua/lsp-status.nvim"},
      {"mfussenegger/nvim-dap"},
      {"theHamsta/nvim-dap-virtual-text"},
    }
    -- ====================================

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"lewis6991/gitsigns.nvim"},
        {"kyazdani42/nvim-web-devicons"},
        {"ryanoasis/vim-devicons"},
        {"nvim-telescope/telescope-fzy-native.nvim"},
        {"nvim-telescope/telescope.nvim"},
        {"nvim-telescope/telescope-dap.nvim"}
      }
    }
    -- ====================================

    -- Treesitter and syntax
    use {
      {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
      "p00f/nvim-ts-rainbow"
    }
    -- ====================================

    -- Utils
    use {
      "akinsho/nvim-toggleterm.lua",
      "kyazdani42/nvim-tree.lua",
      "b3nj5m1n/kommentary",
      "folke/todo-comments.nvim",
      "sbdchd/neoformat"
    }
    -- ====================================

    -- Interface plugins
    use {
      "folke/trouble.nvim",
      "kevinhwang91/nvim-hlslens",
      "kevinhwang91/nvim-bqf",
      "famiu/feline.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
      }
    }
    -- ====================================

    -- Themes
    use {
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
-- "mbbill/undotree",
-- "folke/which-key.nvim",
-- "machakann/vim-sandwich",
-- "kyazdani42/nvim-tree.lua",
--   'akinsho/nvim-bufferline.lua'
--   "windwp/nvim-autopairs",
--   "norcalli/nvim-colorizer.lua",
--   {"turbio/bracey.vim", run = "npm install --prefix server"},
--   {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
--   {'haorenW1025/completion-nvim'},
-- "~/repos/friendly-snippets"
