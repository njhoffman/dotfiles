local util = require "lsp.util"
local lspconfig = require "lspconfig"

require "lsp.efm.formatting"
local M = require "lsp.efm.handlers"

local efm_on_attach = function(client, bufnr)
  -- Disable some capabilities
  client.resolved_capabilities.goto_definition = false
  client.resolved_capabilities.code_action = false

  client.resolved_capabilities.document_formatting = true
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.efm.formatting'.format()]]
    vim.cmd [[augroup END]]
  end
  M.common_on_attach(client, bufnr)
end

-- missing: puppet-lint, haskell (hlint), erlang (elvis), rust (rust-clippy), sql (sqlfluff), php
-- (phplint), perlcritic, perltidy, npm-package-json-lint, graphql-schema-linter, dotenv-linter,
-- clang-format, clang-tidy, ansible-lint,
-- kubernetes lint

-- Formatting and linting via efm
local eslint = require("lsp.efm.eslint")
local efm_tsserver = require("lsp.efm.tsserver")
local efm_python = require("lsp.efm.python")
local node_utils = require("utils.node")

local eslint_prettier = {
  formatCommand = node_utils.get_formatter_command(),
  formatStdin = true,
}

local prettier = {
  -- parser <flow|babel|babel-flow|babel-ts|typescript|espree|meriyah|css|less|scss|
  -- json|json5|json-stringify|graphql|markdown|mdx|vue|yaml|glimmer|html|angular|lwc|ruby|rbs|haml>
  formatCommand = "prettier --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true,
}

local languages = {
  conf = { prettier },
  css = { prettier },
  graphql = { prettier },
  html = { prettier },
  json = { prettier },
  markdown = { prettier },
  scss = { prettier },
  yaml = { prettier },
  -- python = {black, isort, flake8, mypy},
  -- python = { efm_python },
  typescript = { eslint_prettier, eslint },
  typescriptreact = { eslint_prettier, eslint },
  -- javascript = { eslint_prettier, eslint },
  -- javascriptreact = { eslint_prettier, eslint },
  javascript = efm_tsserver,
  javascriptreact = efm_tsserver,
  rust = { { formatCommand = "rustfmt", formatStdin = true } },
  vue = { eslint_prettier, eslint },
  csv = {},
  eruby = {},
  less = {},
  proto = {},
}

-- local filetypes = vim.tbl_keys(languages)
-- print(vim.inspect(filetypes))
local filetypes = {
  "c",
  "cpp",
  "css",
  "csv",
  "dockerfile",
  "eruby",
  "go",
  "graphql",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "less",
  "lua",
  "make",
  -- "markdown",
  "proto",
  "python",
  "ruby",
  "rust",
  "scss",
  "sh",
  "terraform",
  "typescript",
  "typescriptreact",
  "vim",
  "vue",
  "yaml",
  "zsh",
}

lspconfig.efm.setup {
  root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = efm_on_attach,
  init_options = { documentFormatting = true, codeAction = true },
  filetypes = filetypes,
  settings = {
    lintDebounce = 500,
    rootMarkers = {
      ".git",
      "nvim",
      ".rooter", -- ".eslintrc.cjs",
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".prettierrc",
      ".prettierrc.js",
      ".prettierrc.json",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettier.config.js",
      ".prettier.config.cjs",
    },
    -- languages = languages,
    log_level = 5,
    log_file = "~/.local/log/nvim-efm.log",
  },
}
