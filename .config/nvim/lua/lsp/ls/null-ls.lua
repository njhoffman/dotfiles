local null_ls = require("null-ls")
local b = null_ls.builtins
local on_attach_hook = require("lsp.on_attach_hook")

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  -- if vim.bo.filetype == "lua" then client.resolved_capabilities.document_formatting = false end
  on_attach_hook.common_on_attach(client, bufnr)
  -- print("'" .. vim.inspect(client) .. "' server attached")
end

local sources = {
  -- b.formatting.prettierd.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
  b.formatting.prettierd.with({ filetypes = { "yaml", "markdown" } }),
  -- b.formatting.stylua.with({
  --   args = {
  --     "--config-path",
  --     vim.fn.stdpath("config") .. "/lua/stylua.toml",
  --     "-",
  --   },
  -- }),
  b.formatting.trim_whitespace.with({ filetypes = { "tmux", "fish", "teal" } }),
  b.formatting.shfmt,
  b.diagnostics.write_good,
  b.diagnostics.markdownlint,
  b.diagnostics.teal,
  b.diagnostics.shellcheck,
  b.code_actions.gitsigns,
}

if vim.bo.filetype == "lua" then vim.g.null_ls_disable = true end
if vim.bo.filetype == "html" then vim.g.null_ls_disable = true end
-- vim.g.null_ls_disable = true

null_ls.setup({
  debounce = 250,
  keep_alive_interval = 60000, -- 60 seconds,
  save_after_format = true,
  default_timeout = 5000,
  nvim_executable = "nvim",
  sources = sources,
  on_attach = on_attach,
})
