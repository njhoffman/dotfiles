local plugin = {}

function plugin.load()
  vim.g.jsx_pretty_highlight_close_tag = 1
  vim.g.jsx_pretty_colorful_config = 1
  vim.g.jsx_pretty_disable_tsx = 0
  vim.g.jsx_pretty_disable_jsx = 0
end

function plugin.setup(use)
  use {
    -- jsx/tsx syntax
    "yuezk/vim-js",
    "HerringtonDarkholme/yats.vim",
    "maxmellon/vim-jsx-pretty",
    -- plucked syntax from vim-polyglot
    "moll/vim-node",
    "editorconfig/editorconfig-vim",
    "chrisbra/csv.vim",
    "npxbr/glow.nvim",
    "zinit-zsh/zinit-vim-syntax",
    "neoclide/jsonc.vim",
    "elzr/vim-json",
    "GutenYe/json5.vim",
    "chr4/nginx.vim",
    "rodjek/vim-puppet",
    "hashivim/vim-terraform",
    "wgwoods/vim-systemd-syntax",
    "pearofducks/ansible-vim",
    "ekalinin/Dockerfile.vim",
    "tpope/vim-git",
    "jparise/vim-graphql",
    "arzg/vim-sh",
    "ericpruitt/tmux.vim",
    "andrewstuart/vim-kubernetes",
    "StanAngeloff/php.vim",
    "gisphm/vim-gitignore"
    -- to fix https://github.com/neoclide/coc-snippets/issues/126
    -- 'honza/vim-snippets'
  }
  plugin.load()
end

return plugin
