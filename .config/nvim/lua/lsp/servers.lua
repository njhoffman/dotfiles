local lspconfig = require "lspconfig"
local capabilities = require "utils.lsp".capabilities
local common_on_attach = require "utils.lsp".common_on_attach

-- LspInstall cpp dockerfile json lua python yaml
-- LspInstall bash diagnosticls typescript go ruby rust
-- angular bash cmake cpp csharp css dockerfile elixir elm go graphql html java json kotlin latex lua php
-- python ruby rust svelte tailwindcss terraform typescript vim vue yaml -- deno diagnosticls efm rome

function setup_tsserver(client, bufnr)
  local ts_utils = require("nvim-lsp-ts-utils")

  -- defaults
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,
    import_on_completion_timeout = 5000,

    -- eslint
    eslint_enable_code_actions = true,
    eslint_bin = "eslint",
    eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
    eslint_enable_disable_comments = true,

    -- experimental settings!
    -- eslint diagnostics
    eslint_enable_diagnostics = false,
    eslint_diagnostics_debounce = 250,

    -- formatting
    enable_formatting = false,
    formatter = "prettier",
    formatter_args = {"--stdin-filepath", "$FILENAME"},
    format_on_save = false,
    no_save_after_format = false,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = false,

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = "/src",
  }

  -- required to enable ESLint code actions and formatting
  ts_utils.setup_client(client)

  -- no default maps, so you may want to define some here
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
end

local custom_lsp = {
  --[[ go = {
    root_dir = nvim_lsp.util.root_pattern("go.mod", ".vim/", ".git/", ".hg/"),
  }, ]]
  typescript = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      setup_tsserver(client, bufnr)
    end
  },
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim", "use", "LSP"},
          disable = {"lowercase-global"}
        },
      },
    },
  }
}

--[[ require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, lsp in ipairs(servers) do
  local config = {
    on_attach = custom_lsp.typescript.on_attach,
    autostart = LSP[lsp],
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('.project')
  }

  if custom_lsp[lsp] ~= nil then
    for k,v in pairs(custom_lsp[lsp]) do
      -- print(vim.inspect(k))
      config[k] = v
    end
  end

  lspconfig[lsp].setup(config)
end ]]



-- LSP commands
-- ==================================================
-- lsp_config.cmds = {
  -- bash = {lspinstall .. "bash/node_modules/.bin/bash-language-server", "start"},
  -- css = { "node", lspinstall .. "css/vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio" },
  -- clangd = {lspinstall .. "cpp/clangd/bin/clangd"},
  -- diagnosticls = { "node", lspinstall .. "diagnosticls/node_modules/.bin/diagnostic-languageserver", "--stdio", },
  -- gopls = {"gopls"},
  -- html = { "node", lspinstall .. "html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio" },
  -- json = { "node", lspinstall .. "json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js", "--stdio" },
  -- lua = {lspinstall .. "lua/sumneko_lua/bin/Linux/lua-language-server -E ./main.lua"},
  -- python = {lspinstall .. "python/node_modules/.bin/pyright-langserver", "--stdio"},
  -- texlab = {lspinstall .. "latex/texlab"},
  -- tsserver = {lspinstall .. "typescript/node_modules/.bin/typescript-language-server", "--stdio"}
-- }

-- npm i -g bash-language-server
-- nvim_lsp.bashls.setup {
--   cmd = cmds.bash,
--   autostart = LSP.bash,
--   on_attach = common_on_attach,
--   filetypes = {"sh", "zsh"}
-- }

-- npm i -g pyright
-- nvim_lsp.pyright.setup {
--   cmd = cmds.python,
--   autostart = LSP.python,
--   on_attach = common_on_attach
-- }

-- npm i -g vscode-json-languageserver
-- nvim_lsp.jsonls.setup {
--   cmd = cmds.python,
--   autostart = LSP.json,
--   on_attach = common_on_attach
-- }

-- pacman -S clang
-- nvim_lsp.clangd.setup {
--   cmd = cmds.clangd,
--   autostart = LSP.clangd,
--   on_attach = common_on_attach
-- }

-- npm i -g typescript typescript-language-server
-- nvim_lsp.tsserver.setup {
--   cmd = cmds.tsserver,
--   autostart = LSP.tsserver,
--   on_attach = common_on_attach,
--   filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
-- }

-- npm i -g vscode-html-languageserver-bin
-- nvim_lsp.html.setup {
--   cmd = cmds.html,
--   autostart = LSP.html,
--   on_attach = common_on_attach,
--   capabilities = capabilities
-- }

-- go get golang.org/x/tools/gopls@latest
-- nvim_lsp.gopls.setup {
--   cmd = cmds.gopls,
--   autostart = LSP.gopls,
--   on_attach = common_on_attach,
--   capabilities = capabilities,
--   filetypes = { "go", "gomod" },
--   root_dir = nvim_lsp.util.root_pattern("go.mod", ".vim/", ".git/", ".hg/"),
-- }

-- npm i -g vscode-css-languageserver-bin
-- nvim_lsp.cssls.setup {
--   cmd = cmds.css,
--   autostart = LSP.css,
--   on_attach = common_on_attach
-- }

-- nvim_lsp.texlab.setup {
--   cmd = cmds.texlab,
--   on_attach = common_on_attach,
--   autostart = LSP.latex
-- }

-- npm i -g emmet-ls
-- local configs = require "lspconfig/configs"
-- configs.emmet_ls = {
--   default_config = {
--     cmd = {"emmet-ls", "--stdio"},
--     filetypes = {"html", "css"},
--     root_dir = function()
--       return vim.loop.cwd()
--     end,
--     settings = {}
--   }
-- }
-- nvim_lsp.emmet_ls.setup {autostart = LSP.emmet}


--[[ nvim_lsp.diagnosticls.setup {
  capabilities = capabilities,
  -- cmd = cmds.diagnosticls,
  autostart = LSP.diagnosticls,
  on_attach = common_on_attach,
  filetypes = {
    "javascript",
    "json",
    "lua",
    "markdown",
    "sh",
    "toml",
    "yaml",
    "vimwiki"
  },
} ]]
