Opts = {
  preserve_cursor = true,
  highlight_yank  = false,
  relativenumber  = true,
  cursorline      = true,
  listchars       = true,
  wrap            = false,
  timeoutlen      = 500,
  updatetime      = 300,
  scrolloff       = 10,
  explorer_side   = "right"
}

Theming = {
  -- Press <space>fc to see all available themes
  -- colorscheme = "neon",
  colorscheme = "material"
}

LSP = {
  enabled          = true,
  underline        = false,
  update_in_insert = false,
  signs            = true,
  virtual_text     = false,
  highlight_word   = false,
  -- virtual_text = { spacing = 4 }
  ---------------
  -- Autostart --
  ---------------
  angular     = false,
  bash        = true,
  cmake       = false,
  cpp         = true,
  csharp      = true,
  css         = true,
  dockerfile  = true,
  elixir      = false,
  elm         = true,
  go          = true,
  graphql     = true,
  html        = true,
  java        = true,
  json        = true,
  kotlin      = false,
  latex       = false,
  lua         = true,
  php         = true,
  python      = true,
  ruby        = true,
  rust        = true,
  svelte      = false,
  tailwindcss = true,
  terraform   = true,
  typescript  = true,
  vim         = true,
  vue         = false,
  yaml        = true,
  --non-language specific
  deno         = false,
  diagnosticls = false,
  efm          = true,
  rome         = false
}

Completion = {
  enabled   = true,
  autopairs = true,
  items     = 10,
  ---------------------------
  -- Sources of Completion --
  ---------------------------
  snippets = true,
  lsp      = true,
  buffer   = true,
  path     = true,
  calc     = true,
  spell    = true,
  emoji    = true
}

Formatting = {
  -- if format_on_save is enable it will always trim trailing white spaces
  format_on_save      = false,
  trim_trailing_space = true,
  indent_size         = 2
}

Treesitter = {
  enabled = true,
  rainbow = false,
  indent = true,
  -------------
  -- Parsers --
  -------------
  parsers = {
    "bash",
    "beancount",
    "bibtex",
    "c",
    "c_sharp",
    "clojure",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "dart",
    "devicetree",
    "dockerfile",
    "elm",
    "erlang",
    "fennel",
    "fish",
    "fortran",
    "go",
    "gomod",
    "graphql",
    "haskell",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "julia",
    "kotlin",
    "latex",
    "ledger",
    "lua",
    "nix",
    "ocaml",
    "ocaml_interface",
    "ocamllex",
    "php",
    "python",
    "ql",
    -- 'Tree-sitter query language',
    "r",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scss",
    "sparql",
    "supercollider",
    "svelte",
    "swift",
    "teal",
    "toml",
    "tsx",
    "turtle",
    "typescript",
    "verilog",
    "vue",
    "yaml",
    "zig"
  }
}

local config = {
  Opts = Opts,
  LSP = LSP,
  Theming = Theming,
  Completion = Completion,
  Treesitter = Treesitter,
  Formatting = Formatting
}

return config
