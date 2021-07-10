local lspconfig = require "lspconfig"
local lsp_status = require("lsp-status")
local on_attach_hook = require "lsp.on_attach_hook"
local lsp_cmds = require("lsp.commands")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
local on_attach = function(client, server)
  client.resolved_capabilities.document_formatting = true
  on_attach_hook.common_on_attach(client, server)
  print("'" .. client.name .. "' server attached")
end

lspconfig.jsonls.setup {
  cmd = lsp_cmds.json,
  filetypes = { "json" },
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = on_attach,
  commands = { Format = { function() vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 }) end } },
}

-- -- JSON lsp
-- lsp_servers.jsonls.setup {
--     on_attach = on_attach,
--     settings = {
--         json = {
--             -- Schemas https://www.schemastore.org
--             schemas = {
--                 {
--                     fileMatch = {"package.json"},
--                     url = "https://json.schemastore.org/package.json"
--                 }, {
--                     fileMatch = {"tsconfig*.json"},
--                     url = "https://json.schemastore.org/tsconfig.json"
--                 }, {
--                     fileMatch = {
--                         ".prettierrc", ".prettierrc.json",
--                         "prettier.config.json"
--                     },
--                     url = "https://json.schemastore.org/prettierrc.json"
--                 }, {
--                     fileMatch = {".eslintrc", ".eslintrc.json"},
--                     url = "https://json.schemastore.org/eslintrc.json"
--                 }, {
--                     fileMatch = {
--                         ".babelrc", ".babelrc.json", "babel.config.json"
--                     },
--                     url = "https://json.schemastore.org/babelrc.json"
--                 },
--                 {
--                     fileMatch = {"lerna.json"},
--                     url = "https://json.schemastore.org/lerna.json"
--                 }, {
--                     fileMatch = {"now.json", "vercel.json"},
--                     url = "https://json.schemastore.org/now.json"
--                 }, {
--                     fileMatch = {
--                         ".stylelintrc", ".stylelintrc.json",
--                         "stylelint.config.json"
--                     },
--                     url = "http://json.schemastore.org/stylelintrc.json"
--                 }
--             }
--         }
--     }
-- }
