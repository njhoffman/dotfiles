config = require("main.config-loader")

if config.LSP.enabled == nil or config.LSP.enabled == false then
  return
elseif config.LSP.enabled == true then
  require("lsp/setup")
  require("lsp/lspsaga")
  require("lsp/diagnostics")
end
