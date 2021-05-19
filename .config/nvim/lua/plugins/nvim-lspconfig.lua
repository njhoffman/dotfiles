local lsp_config = require "utils.lsp"

local efm_options = {
  documentFormatting = true,
  hover = true,
  documentSymbol = true,
  codeAction = true,
  completion = true
}

local efm_settings = {
  -- Require formatter configuration files to load
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
  }
}

-- Configure lua language server for neovim development
local lua_settings = {
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

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = lsp_config.on_attach
  }
end

-- lsp-install
local function setup_servers()
  require "lspinstall".setup()

  -- get all installed servers
  local servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"} -- we don't want objective-c and objective-cpp!
    end

    if server == "efm" then
      config.init_options = efm_options
      config.settings = efm_settings
    end

    require "lspconfig"[server].setup(config)
  end
end

setup_servers()

-- npm install -g typescript typescript-language-server
-- npm i -g pyright

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- " inoremap <silent><expr> <C-Space> compe#complete()
-- " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

-- " let g:compe = {}
-- " let g:compe.enabled = v:true
-- " let g:compe.autocomplete = v:true
-- " let g:compe.debug = v:false
-- " let g:compe.min_length = 1
-- " let g:compe.preselect = 'enable'
-- " let g:compe.throttle_time = 80
-- " let g:compe.source_timeout = 200
-- " let g:compe.incomplete_delay = 400
-- " let g:compe.max_abbr_width = 100
-- " let g:compe.max_kind_width = 100
-- " let g:compe.max_menu_width = 100
-- " let g:compe.documentation = v:true
-- "
-- " let g:compe.source = {}
-- " let g:compe.source.path = v:true
-- " let g:compe.source.buffer = v:true
-- " let g:compe.source.calc = v:true
-- " let g:compe.source.nvim_lsp = v:true
-- " let g:compe.source.nvim_lua = v:true
-- " let g:compe.source.vsnip = v:true
-- " let g:compe.source.ultisnips = v:true

-- set completeopt=menuone,noselect

-- " inoremap <silent><expr> <C-Space> compe#complete()
-- " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

-- " let g:compe = {}
-- " let g:compe.enabled = v:true
-- " let g:compe.autocomplete = v:true
-- " let g:compe.debug = v:false
-- " let g:compe.min_length = 1
-- " let g:compe.preselect = 'enable'
-- " let g:compe.throttle_time = 80
-- " let g:compe.source_timeout = 200
-- " let g:compe.incomplete_delay = 400
-- " let g:compe.max_abbr_width = 100
-- " let g:compe.max_kind_width = 100
-- " let g:compe.max_menu_width = 100
-- " let g:compe.documentation = v:true
-- "
-- " let g:compe.source = {}
-- " let g:compe.source.path = v:true
-- " let g:compe.source.buffer = v:true
-- " let g:compe.source.calc = v:true
-- " let g:compe.source.nvim_lsp = v:true
-- " let g:compe.source.nvim_lua = v:true
-- " let g:compe.source.vsnip = v:true
-- " let g:compe.source.ultisnips = v:true
