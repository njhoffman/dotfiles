local lsp_status = require("lsp.lspstatus")
local lsp_config = require("lsp.lspconfig")
-- local lsp_config = require "lsp.setup"

local config = require("config")
local theme = config.Theming

function lsp_config.setup(options)
  lsp_status.activate()
  config = vim.tbl_deep_extend("force", {}, theme.diagnostic_colors, options or {})
end

lsp_config.setup()

local lsp_servers = {}

lsp_servers.efm = {
  init_options = {
    -- TODO: figure out best way to handle formatting between lsp, efm, and neoformat
    documentFormatting = false,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    rootMarkers = {
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
    }
  },
  -- TODO: limit this by config and what is being enabled by lsp
  filetypes = {
    "asciidoc",
    -- "c",
    -- "cpp",
    "css",
    "csv",
    "dockerfile",
    "eruby",
    "go",
    "graphql",
    -- "help",
    "html",
    -- "javascript",
    "json",
    "less",
    -- "lua",
    "make",
    "markdown",
    "proto",
    "python",
    "review",
    "rust",
    "ruby",
    "sass",
    "scss",
    "sh",
    "sugarss",
    "text",
    -- "typescript",
    -- "vim",
    "vue",
    "yaml"
  }
}
vim.g.null_ls_disable = true

-- enable null-ls integration (optional)
require("null-ls").setup {
  {
    debounce = 250,
    keep_alive_interval = 60000, -- 60 seconds,
    save_after_format = true,
    default_timeout = 5000,
    sources = nil,
    on_attach = nil
  }
}

lsp_servers.typescript = {
  on_attach = function(client, bufnr)
    local lspTsUtils = require("nvim-lsp-ts-utils")

    lspTsUtils.setup(
      {
        -- defaults
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,
        import_on_completion_timeout = 5000,
        -- eslint
        eslint_enable_code_actions = true,
        -- eslint_bin = "eslint",
        eslint_bin = "eslint_d",
        eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
        eslint_enable_disable_comments = true,
        -- experimental settings!
        -- eslint diagnostics
        eslint_enable_diagnostics = true,
        eslint_diagnostics_debounce = 250,
        -- formatting
        enable_formatting = false,
        formatter = "prettier",
        formatter_args = {"--stdin-filepath", "$FILENAME"},
        format_on_save = false,
        no_save_after_format = false,
        -- parentheses completion
        complete_parens = false,
        signature_help_in_parens = true,
        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = false,
        -- watch_dir = "/src"
        watch_dir = "/"
      }
    )

    lspTsUtils.setup_client(client)
    return lsp_config.common_on_attach(client, bufnr)
  end,
  -- autostart = LSP.tsserver
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

lsp_servers.lua = {
  settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim", "use"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      },
      telemetry = {
        enable = false
      }
    }
  }
}

-- config that activates keymaps and enables snippet support
function lsp_servers.make_config(server_name)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local server_config = {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = lsp_config.common_on_attach
  }
  -- TODO: deep merge customized server configs
  -- language specific config
  if server_name == "lua" then
    server_config.settings = lsp_servers.lua.settings
  elseif server_name == "clangd" then
    server_config.filetypes = {"c", "cpp"} -- we don't want objective-c and objective-cpp!
  elseif server_name == "efm" then
    server_config.init_options = lsp_servers.efm.init_options
    server_config.settings = lsp_servers.efm.settings
    server_config.filetypes = lsp_servers.efm.filetypes
  elseif server_name == "typescript" then
    server_config.on_attach = lsp_servers.typescript.on_attach
    server_config.filetypes = lsp_servers.typescript.filetypes
  end
  return server_config
end

return lsp_servers
