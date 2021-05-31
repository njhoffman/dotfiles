local config = require("config")
local lsp_status = require("lsp-status")
local f = require("utils.functional")
local utils = require("utils.core")
local lsp_mappings = require('mappings.lsp')

DATA_PATH = vim.fn.stdpath("data")
local lspinstall = DATA_PATH .. "/lspinstall/"
local theme = config.Theme;

local lsp_config = {}

lsp_config.capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_config.capabilities.textDocument.completion.completionItem.snippetSupport = true

function lsp_config.log(msg)
  if (config.LSP.log_stdout) then
    print(string.format("%s", msg))
  end
  utils.log_to_file(config.Opts.log_path)(vim.inspect(msg))
end

vim.lsp.set_log_level(config.LSP.log_level)
lsp_config.log("Setting LSP log level '" .. config.LSP.log_level .. "' at " .. vim.lsp.get_log_path())

local log_capabilities = function(capabilities)
  local reduce = function(filter)
    local result = {}
    for k, _ in pairs(capabilities) do
      table.insert(result, f.map(
        function(v)
          return {v = capabilities[v]}
        end
      )(f.filter(f.contains(k))(filter)))
    end
    return f.flatten(result)
  end

  lsp_config.log(reduce(capabilities))
end

local function assignRootPattern(pattern)
 local cwd  = vim.loop.cwd();
 local root = lsp_config.util.root_pattern("composer.json", ".git")(pattern);
  -- prefer cwd if root is a descendant
  return lsp_config.util.path.is_descendant(cwd, root) and cwd or root;
end

local function documentFormat(client,bufnr)
  if client.resolved_capabilities.document_formatting then
    utils.keymap(
      {
        "n",
        "<Leader>aa",
        "<cmd>lua vim.lsp.buf.formatting()<cr>",
        {}
      }
    )
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
    vim.api.nvim_command([[augroup END]])
    -- vim.cmd([[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 500) ]])
    lsp_config.log(string.format("Formatting supported %s", client.name))
  end
end

local function documentHighlight(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

local function documentHoverDiagnostic(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if config.LSP.hover_diagnostic == "popup" then
    vim.api.nvim_exec(
      [[
      augroup lsp_diagnostic
      autocmd! * <buffer>
      autocmd CursorHold * lua require"lspsaga.diagnostic".show_line_diagnostics()
      autocmd CursorHoldI * silent! lua require"lspsaga.diagnostic".signature_help()
      augroup END
      ]],
      false
    )
  elseif config.LSP.hover_diagnostic == "virtual" then
    vim.api.nvim_exec(
      [[
      augroup lsp_diagnostic
      autocmd! * <buffer>
      autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
      autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
      augroup END
      ]],
      false
    )
  end
end
-- log_capabilities(client.resolved_capabilities)
function lsp_config.common_on_attach(client, bufnr)
  lsp_status.on_attach(client)
  -- vim.cmd([[ setlocal omnifunc=v:lua.vim.lsp.omnifunc ]])
  lsp_config.log("client.name: " .. client.name .. "\n" .. vim.inspect(client.resolved_capabilities))

  documentHoverDiagnostic(client, bufnr)
  documentFormat(client, bufnr)
  lsp_mappings.lsp_attach(client, bufnr)

  if config.LSP.highlight_word == nil or config.LSP.highlight_word == true then
    documentHighlight(client, bufnr)
  end
end

-- Add LSP colors to colorschemes that don't support it yet
-- =========================================================

local config = {}

function lsp_config.hl(name)
  return vim.api.nvim_get_hl_by_name(name, true)
end

function lsp_config.exists(name)
  if vim.fn.hlexists(name) == 1 then
    local hl = lsp_config.hl(name)
    local count = 0
    for key, value in pairs(hl) do
      -- this is needed for groups that only have "cleared"
      if not (key == true and value == 6) then
        count = count + 1
      end
    end
    return count > 0
  end
  return false
end

function lsp_config.link(group, fallbacks, default)
  if not lsp_config.exists(group) then
    for _, fallback in pairs(fallbacks) do
      if lsp_config.exists(fallback) then
        vim.cmd("hi link " .. group .. " " .. fallback)
        return
      end
    end
    if default then
      vim.cmd("hi " .. group .. " " .. default)
    end
  end
end

function lsp_config.fix()
  -- dump({ fix = event })
  -- Default Groups
  for _, lsp in pairs({"Error", "Warning", "Information", "Hint"}) do
    local coc = lsp
    if lsp == "Information" then
      coc = "Info"
    end
    lsp_config.link("LspDiagnosticsDefault" .. lsp, {"Coc" .. coc .. "Sign"}, "guifg=" .. config[lsp])
    lsp_config.link("LspDiagnosticsVirtualText" .. lsp, {"LspDiagnosticsDefault" .. lsp})

    local color = theme.diagnostic_colors[lsp]
    local hl = lsp_config.hl("LspDiagnosticsDefault" .. lsp)
    if hl and hl.foreground then
      color = string.format("#%06x", hl.foreground)
    end
    lsp_config.link("LspDiagnosticsUnderline" .. lsp, {}, "gui=undercurl guisp=" .. color)
  end

  lsp_config.link("LspReferenceText", {"CocHighlightText", "CursorLine"})
  lsp_config.link("LspReferenceRead", {"CocHighlightRead", "LspReferenceText"})
  lsp_config.link("LspReferenceWrite", {"CocHighlightWrite", "LspReferenceText"})
end

return lsp_config
