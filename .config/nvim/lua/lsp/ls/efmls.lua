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

-- Formatting and linting via efm
local eslint = require("lsp.efm.eslint")
local lua_format = require("lsp.efm.lua-format")
local eslint_prettier = require("lsp.efm.eslint-prettier")
local prettier = require("lsp.efm.prettier")
local efm_tsserver = require("lsp.efm.tsserver")
local efm_python = require("lsp.efm.python")
local efm_sh = require("lsp.efm.sh")

local languages = {
  conf = {prettier},
  css = { prettier },
  graphql = {prettier},
  html = { prettier },
  javascript = { eslint_prettier, eslint },
  javascriptreact = { eslint_prettier, eslint },
  json = { prettier },
  lua = { lua_format },
  markdown = { prettier },
  python = { efm_python },
  scss = { prettier },
  sh = { efm_sh },
  typescript = { eslint_prettier, eslint },
  typescriptreact = { eslint_prettier, eslint },
  vue = { eslint_prettier, eslint },
  yaml = {prettier},
  -- javascript = efm_tsserver,
  -- javascriptreact = efm_tsserver,
  -- typescript = efm_tsserver,
  -- typescriptreact = efm_tsserver,
}

lspconfig.efm.setup {
  root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = efm_on_attach,
  init_options = {documentFormatting = true, codeAction = true},
  filetypes = vim.tbl_keys(languages),
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
      ".prettier.config.cjs"
    },
    languages = languages,
    log_level = 1,
    log_file = "/tmp/nvim-efm.log"
  }
}

-- local languages = {
--   lua = {luafmt},
--   -- typescript = {prettier, eslint},
--   -- javascript = {prettier, eslint},
--   -- typescriptreact = {prettier, eslint},
--   -- javascriptreact = {prettier, eslint},
--   json = {prettier},
--   html = {prettier},
--   scss = {prettier},
--   css = {prettier},
--   markdown = {prettier},
--   rust = {rustfmt},
--   --
--   -- python = {autopep}
--   -- "c",
--   -- "cpp",
--   -- "help",
--   asciidoc = {},
--   csv = {},
--   dockerfile = {},
--   eruby = {},
--   go = {},
--   graphql = {},
--   less = {},
--   make = {},
--   proto = {},
--   -- python = {},
--   review = {},
--   ruby = {},
--   sass = {},
--   sh = {},
--   sugarss = {},
--   text = {},
--   vim = {},
--   vue = {}
-- }

-- lsp_servers.efm = {
--   init_options = {
--     -- TODO: figure out best way to handle formatting between lsp, efm, and neoformat
--     documentFormatting = true,
--     hover = true,
--     documentSymbol = true,
--     codeAction = true,
--     completion = true
--   },
--   settings = {
--     languages = languages,
--     log_level = 1,
--     log_file = '~/efm.log',
--     rootMarkers = {
--       ".rooter", -- ".eslintrc.cjs",
--       ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".prettierrc",
--       ".prettierrc.js", ".prettierrc.json", ".prettierrc.yml",
--       ".prettierrc.yaml", ".prettier.config.js", ".prettier.config.cjs"
--     }
--   },
--   filetypes = vim.tbl_keys(languages)
-- }
