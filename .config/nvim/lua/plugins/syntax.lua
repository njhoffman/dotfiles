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
    "maxmellon/vim-jsx-pretty"
  }
  plugin.load()
end

return plugin
