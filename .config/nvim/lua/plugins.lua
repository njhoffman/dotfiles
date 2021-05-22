local config = require"config"

local Plugins = config.Plugins

require"utils.bootstrap_packer"

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  use "wbthomason/packer.nvim"

  --  Plug "rafcamlet/nvim_luapad"

  -- ====================================
  -- Key mapping
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "tpope/vim-sensible"
  use "ryanoasis/vim-devicons"
  require"plugins.nvim_web_devicons".setup(use)
  require"plugins.gitsigns".setup(use)


  -- ====================================
  -- LSP, Autocomplete and snippets
  if config.LSP.enabled ~= 0 and config.LSP.enabled ~= false then
    use {
      "neovim/nvim-lspconfig",
      requires = {
        { "nvim_lua/popup.nvim"},
        { "nvim_lua/plenary.nvim"},
        { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        { "kabouzeid/nvim-lspinstall" },
        { "nvim-lua/lsp-status.nvim" },
        { "hrsh7th/vim-vsnip" }
      },
      config = function()
        -- start lsp servers
        require"plugins.lspsaga".setup(use)
        require"plugins.nvim_compe".setup(use)
        require"lsp".setup(use)
      end
    }
  end

  -- ====================================
  -- DAP
  if config.DAP.enabled ~= 0 and config.DAP.enabled ~= false then
    use {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      requires = "nvim-telescope/telescope.nvim"
    }
  end

  -- ====================================
  -- Visual enhancements
  if Plugins.vim_smoothie ~= 0 and Plugins.vim_smoothie ~= false then
    use { 'gerw/vim-HiLinkTrace' }
    require"plugins.vim_plugin_AnsiEsc".setup(use)
    require"plugins.vim_hexokinase".setup(use)
    require"plugins.vim_smoothie".setup(use)
    require"plugins.vimade".setup(use)
  end

  -- ====================================
  -- Fuzzy search (telescope, fzf)
  if Plugins.telescope ~= 0 and Plugins.telescope ~= false then
    require"plugins.ack".setup(use)
    require"plugins.fzf".setup(use)
    require"plugins.fzf_preview".setup(use)
    require"plugins.telescope".setup(use)
  end

  -- ====================================
  -- Treesitter and syntax
  if config.Treesitter.enabled == nil or config.Treesitter.enabled == true then
    require"plugins.treesitter".setup(use)
  end

  -- ====================================
  -- Utils
  if Plugins.easyalign ~= 0 and Plugins.easyalign ~= false then
    require"plugins.easyalign".setup(use)
  end
  if Plugins.splitjoin ~= 0 and Plugins.splitjoin ~= false then
    require"plugins.splitjoin".setup(use)
  end
  if Plugins.todo_comments ~= 0 and Plugins.todo_comments ~= false then
    require"plugins.todo_comments".setup(use)
  end
  if Plugins.neoformat ~= 0 and Plugins.neoformat ~= false then
    require"plugins.neoformat".setup(use)
  end
  if Plugins.kommentary ~= 0 and Plugins.kommentary ~= false then
    require"plugins.kommentary".setup(use)
  end
  if Plugins.vim_profiler ~= 0 and Plugins.vim_profiler ~= false then
    use { 'bchretien/vim-profiler' }
    use { 'tweekmonster/startuptime.vim' }
    -- vim-profiler.py nvim -n 10
    -- vim-profiler.py -n 5 nvim foo.cc -c ":exec ':normal ia' | :q\!"
  end

  -- ====================================
  -- Interface plugins
  if Plugins.nvim_bqf ~= 0 and Plugins.nvim_bqf ~= false then
    require"plugins.nvim_bqf".setup(use)
  end
  if Plugins.trouble ~= 0 and Plugins.trouble ~= false then
    require"plugins.trouble".setup(use)
  end
  if Plugins.vim_mundo ~= 0 and Plugins.vim_mundo ~= false then
    require"plugins.vim_mundo".setup(use)
  end
  if Plugins.nvim_tree ~= 0 and Plugins.nvim_tree ~= false then
    require"plugins.nvim_tree".setup(use)
  end
  if Plugins.nvim_toggleterm ~= 0 and Plugins.nvim_toggleterm ~= false then
    require"plugins.nvim_toggleterm".setup(use)
  end
  if Plugins.nvim_hlslens ~= 0 and Plugins.nvim_hlslens ~= false then
    require"plugins.nvim_hlslens".setup(use)
  end

  -- ====================================
  -- Themes
  use {
    "famiu/feline.nvim",
    "neg-serg/neg",
    "arcticicestudio/nord-vim",
    -- "kyazdani42/blue_moon",
    -- "rockerBOO/boo_colorscheme_nvim",
    -- {"npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim"},
    -- "marko_cerovac/material.nvim",
    -- "shaunsingh/moonlight.nvim",
    -- "rafamadriz/neon",
    -- "bluz71/vim_nightfly_guicolors",
    -- "christianchiarulli/nvcode_color_schemes.vim",
    -- "rakr/vim_one"
  }

end
)
-- {'glepnir/galaxyline.nvim', branch = 'main'},
-- "folke/which_key.nvim",
-- "machakann/vim_sandwich",
--   'akinsho/nvim_bufferline.lua'
--   "windwp/nvim_autopairs",
--   "norcalli/nvim_colorizer.lua",
--   {"turbio/bracey.vim", run = "npm install_server"},
--   {"iamcco/markdown_preview.nvim", run = "cd app && yarn install"}
--   {'haorenW1025/completion_nvim'},
-- "~/repos/friendly_snippets"
