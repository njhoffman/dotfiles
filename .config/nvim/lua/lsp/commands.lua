DATA_PATH = vim.fn.stdpath("data")
local lspinstall = DATA_PATH .. "/lspinstall/"

local lsp_commands = {
  bash = { lspinstall .. "bash/node_modules/.bin/bash-language-server", "start" },
  clangd = { lspinstall .. "cpp/clangd/bin/clangd" },
  css = {
    "node",
    lspinstall ..
        "css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio",
  },
  go = { lspinstall .. "go/gopls" },
  html = {
    "node",
    lspinstall ..
        "html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio",
  },
  json = {
    "node",
    lspinstall ..
        "json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
  efm = { lspinstall .. "efm/efm-langserver" },
  lua = { lspinstall .. "lua/sumneko-lua-language-server", "-E", "./main.lua" },
  python = {
    lspinstall .. "python/node_modules/.bin/pyright-langserver",
    "--stdio",
  },
  ruby = { lspinstall .. "ruby/solargraph" },
  rust = { lspinstall .. "rust/rust-analyzer" },
  tsserver = {
    lspinstall .. "typescript/node_modules/.bin/typescript-language-server",
    "--stdio",
  },
  vim = { lspinstall .. "vim/node_modules/.bin/vim-language-server", "--stdio" },
  yaml = {
    lspinstall .. "yaml/node_modules/.bin/yaml-language-server",
    "--stdio",
  },
}

return lsp_commands
