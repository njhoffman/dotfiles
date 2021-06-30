-- npm install -g yaml-language-server
local lspconfig = require "lspconfig"
local lsp_cmds = require("lsp.commands")
local on_attach_hook = require("lsp.on_attach_hook")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require"logger".debug(capabilities)

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = true
  on_attach_hook.common_on_attach(client, bufnr)
  print("'" .. client.name .. "' server attached " .. bufnr)
end

lspconfig.yamlls.setup {
  cmd = lsp_cmds.yaml,
  filetypes = { "yaml", "yml" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(".git")(fname) or
               lspconfig.util.path.dirname(fname)
  end,
  settings = { yaml = { format = { enable = true } } },

  -- redhat.telemetry.enabled: boolean Default: vim.NIL null
  -- yaml.completion: boolean Default: true Enable/disable completion feature
  -- yaml.customTags: array Default: {} Custom tags for the parser to use
  -- yaml.disableAdditionalProperties: boolean Globally set additionalProperties to false for all objects. So if its true, no extra properties are allowed inside yaml.
  -- yaml.format.bracketSpacing: boolean Default: true Print spaces between brackets in objects
  -- yaml.format.enable: boolean Default: true Enable/disable default YAML formatter
  -- yaml.format.printWidth: integer Default: 80 Specify the line length that the printer will wrap on
  -- yaml.format.proseWrap: enum { "preserve", "never", "always" } Default: "preserve" Always: wrap prose if it exeeds the print width, Never: never wrap the prose, Preserve: wrap prose as-is
  -- yaml.format.singleQuote: boolean Use single quotes instead of double quotes
  -- yaml.hover: boolean Default: true Enable/disable hover feature
  -- yaml.maxItemsComputed: integer Default: 5000 The maximum number of outline symbols and folding regions computed (limited for performance reasons).
  -- yaml.schemaStore.enable: boolean Default: true Automatically pull available YAML schemas from JSON Schema Store
  -- yaml.schemaStore.url: string Default: "https://www.schemastore.org/api/json/catalog.json" URL of schema store catalog to use
  -- yaml.schemas: object Default: vim.empty_dict() Associate schemas to YAML files in the current workspace
  -- yaml.trace.server: enum { "off", "messages", "verbose" } Default: "off" Traces the communication between VSCode and the YAML language service.
  -- yaml.validate: boolean Default: true Enable/disable validation feature
  -- filetypes = {"Dockerfile"},
  on_attach = on_attach,
}
