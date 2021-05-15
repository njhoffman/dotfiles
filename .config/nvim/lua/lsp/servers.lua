local nvim_lsp = require "lspconfig"
local capabilities = require "utils.lsp".capabilities
local common_on_attach = require "utils.lsp".common_on_attach
local cmds = require "utils.lsp".cmds

-- npm i -g bash-language-server
nvim_lsp.bashls.setup {
  cmd = cmds.bash,
  autostart = LSP.bash,
  on_attach = common_on_attach,
  filetypes = {"sh", "zsh"}
}

-- npm i -g pyright
nvim_lsp.pyright.setup {
  cmd = cmds.python,
  autostart = LSP.python,
  on_attach = common_on_attach
}

-- npm i -g vscode-json-languageserver
nvim_lsp.jsonls.setup {
  cmd = cmds.python,
  autostart = LSP.json,
  on_attach = common_on_attach
}

-- pacman -S clang
nvim_lsp.clangd.setup {
  cmd = cmds.clangd,
  autostart = LSP.clangd,
  on_attach = common_on_attach
}

-- npm i -g typescript typescript-language-server
nvim_lsp.tsserver.setup {
  cmd = cmds.tsserver,
  autostart = LSP.tsserver,
  on_attach = common_on_attach,
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

-- npm i -g vscode-html-languageserver-bin
nvim_lsp.html.setup {
  cmd = cmds.html,
  autostart = LSP.html,
  on_attach = common_on_attach,
  capabilities = capabilities
}

-- npm i -g vscode-css-languageserver-bin
nvim_lsp.cssls.setup {
  cmd = cmds.css,
  autostart = LSP.css,
  on_attach = common_on_attach
}

nvim_lsp.texlab.setup {
  cmd = cmds.texlab,
  on_attach = common_on_attach,
  autostart = LSP.latex
}

-- npm i -g emmet-ls
local configs = require "lspconfig/configs"
configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {"html", "css"},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}
nvim_lsp.emmet_ls.setup {autostart = LSP.emmet}

-- lua  https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- git clone https://github.com/sumneko/lua-language-server $HOME/.local/share/nvim/lua/sumneko_lua
-- cd ~/.local/share/nvim/lua/sumneko_lua
-- git submodule update --init --recursive
-- cd 3rd/luamake
-- ninja -f compile/ninja/linux.ninja
-- cd ../..
-- ./3rd/luamake/luamake rebuild
-- ./bin/Linux/lua-language-server -E ./main.lua

local luapath = vim.fn.stdpath("data") .. "/lspinstall/lua"
local luabin = luapath .. "/sumneko-lua-language-server"

nvim_lsp.sumneko_lua.setup {
  cmd = {luabin, "-E", luapath .. "/main.lua"},
  autostart = LSP.lua,
  on_attach = common_on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim", "use", "run", "Theming", "LSP", "Completion", "Opts", "Formatting", "Treesitter"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        },
        maxPreload = 10000
      },
      telemetry = {
        enable = false
      }
    }
  }
}

nvim_lsp.diagnosticls.setup {
  on_attach = common_on_attach,
  capabilities = lsp_status.capabilities,
  cmd = {"diagnostic-languageserver", "--stdio"},
  filetypes = {
    "lua",
    "sh",
    "markdown",
    "json",
    "yaml",
    "toml"
  },
  init_options = {
    linters = {
      shellcheck = {
        command = "shellcheck",
        debounce = 100,
        args = {"--format", "json", "-"},
        sourceName = "shellcheck",
        parseJson = {
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${code}]",
          security = "level"
        },
        securities = {
          error = "error",
          warning = "warning",
          info = "info",
          style = "hint"
        }
      },
      markdownlint = {
        command = "markdownlint",
        isStderr = true,
        debounce = 100,
        args = {"--stdin"},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = "markdownlint",
        formatLines = 1,
        formatPattern = {
          "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
          {
            line = 1,
            column = 3,
            message = {4}
          }
        }
      }
    },
    filetypes = {
      sh = "shellcheck",
      markdown = "markdownlint"
    },
    formatters = {
      shfmt = {
        command = "shfmt",
        args = {"-i", "2", "-bn", "-ci", "-sr"}
      },
      prettier = {
        command = "prettier",
        args = {"--stdin-filepath", "%filepath"},
      }
    },
    formatFiletypes = {
      sh = "shfmt",
      json = "prettier",
      yaml = "prettier",
      toml = "prettier",
      markdown = "prettier",
      lua = "prettier"
    }
  }
}
