local lspTsUtils = require('nvim-lsp-ts-utils')
local lsp_status = require('lsp.lspstatus')
local lsp_config = require('lsp.lspconfig')
-- local lsp_config = require "lsp.setup"

local config = require('config')
local theme = config.Theming;

function lsp_config.setup(options)
  lsp_status.activate()
  config = vim.tbl_deep_extend("force", {}, theme.diagnostic_colors, options or {})
end

lsp_config.setup()

local lsp_servers = {}

lsp_servers.efm = {
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    rootMarkers = {
      ".lua-format",
      -- ".eslintrc.cjs",
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
  },
  filetypes = {
    "asciidoc", "c", "cpp", "css", "graphql", "help", "html", "javascript", "json5",
    "less", "markdown", "proto", "python", "review", "rst", "ruby", "sass", "scss",
    "sh", "sugarss", "text", "typescript", "vim", "vue", "yaml"
  }
}

lsp_servers.typescript = {
  on_attach = function(client, bufnr)
    lspTsUtils.setup(
      {
        -- defaults
        disable_commands = false,
        enable_import_on_completion = false,
        import_on_completion_timeout = 5000
      }
    )

    return lsp_config.on_attach(client, bufnr)
  end
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
  end
  return server_config
end

return lsp_servers
