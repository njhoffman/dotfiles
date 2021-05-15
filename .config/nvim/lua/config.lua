Opts = {
  preserve_cursor = true,
  highlight_yank = true,
  relativenumber = true,
  cursorline = true,
  listchars = true,
  wrap = false,
  timeoutlen = 500,
  updatetime = 300,
  scrolloff = 10,
  explorer_side = "right"
}

Theming = {
  -- Press <space>fc to see all available themes
  colorscheme = "neon",
  -- colorscheme = "jellybeans",
  --[[ Some colorscheme have multiple styles to choose from:
  @gruvbox = medium, soft, hard ]]
  colorscheme_style = "",
  -- Options: classic, slant, minimal, vscode, default
  statusline = "vscode",
  -- Options: gruvbox, nord, dark
  statusline_color = "dark"
}

LSP = {
  enabled = true,
  virtual_text = true,
  highlight_word = true,
  ---------------
  -- Autostart --
  ---------------
  bash = true,
  clangd = true,
  json = true,
  latex = true,
  lua = true,
  python = true,
  -- WebDev
  html = true,
  css = true,
  tsserver = true,
  emmet = true
}

Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
  ---------------------------
  -- Sources of Completion --
  ---------------------------
  snippets = true,
  lsp = true,
  buffer = true,
  path = true,
  calc = true,
  spell = true,
  emoji = true
}

Formatting = {
  -- if format_on_save is enable it will always trim trailing white spaces
  format_on_save = true,
  trim_trailing_space = true,
  indent_size = 2
}

Treesitter = {
  enabled = true,
  rainbow = true,
  -------------
  -- Parsers --
  -------------
  parsers = {
    "bash",
    "c",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "tsx",
    "typescript",
    "yaml"
  }
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#vimls
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gopls
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#stylelint_lsp
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sqlls- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#terraformls
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tflint
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#yamlls
