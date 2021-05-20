local lsp_config = {}
DATA_PATH = vim.fn.stdpath("data")
local lsp_status = require("lsp-status")
local f = require("utils.functional")
local utils = require("utils.core")
local status = require("utils.lsp_status")
local lspinstall = DATA_PATH .. "/lspinstall/"

lsp_config.capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_config.capabilities.textDocument.completion.completionItem.snippetSupport = true

local log_capabilities = function(capabilities)
  local reduce = function(filter)
    local result = {}
    for k, _ in pairs(capabilities) do
      table.insert(
        result,
        f.map(
          function(v)
            return {v = capabilities[v]}
          end
        )(f.filter(f.contains(k))(filter))
      )
    end
    return f.flatten(result)
  end

  --[[ local log = utils.log_to_file("/tmp/neovim-lsp-capabilities.log")
  log(vim.inspect(reduce(capabilities))) ]]
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
    -- if client.name ~= "tsserver" then
    -- end
    print(string.format("Formatting supported %s", client.name))
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
-- vim.api.nvim_command([[augroup Format]])
-- vim.api.nvim_command([[autocmd! * <buffer>]])
-- vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
-- vim.api.nvim_command([[augroup END]])
-- vim.cmd([[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 500) ]])


-- log_capabilities(client.resolved_capabilities)
function lsp_config.common_on_attach(client, bufnr)
  lsp_status.on_attach(client)
  print("'" .. client.name .. "' language server attached")
  utils.log_to_file("/tmp/nvim-lsp-client.log")(vim.inspect(client))
  -- vim.cmd([[ setlocal omnifunc=v:lua.vim.lsp.omnifunc ]])
  local capLog = utils.log_to_file("/tmp/capabilities.log")
  capLog("client.name: " .. client.name .. "\n" .. vim.inspect(client.resolved_capabilities))

  documentFormat(client, bufnr)

  if LSP.highlight_word == nil or LSP.highlight_word == true then
    documentHighlight(client, bufnr)
  elseif LSP.highlight_word == false then
    return nil
  end
end

-- Add LSP colors to colorschemes that don't support it yet
-- =========================================================
local defaults = {
  Error       = "#db4b4b",
  Warning     = "#e0af68",
  Information = "#0db9d7",
  Hint        = "#10B981",
}

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

    local color = defaults[lsp]
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

function lsp_config.setup(options)
  status.activate()
  config = vim.tbl_deep_extend("force", {}, defaults, options or {})
end


lsp_config.setup()

return lsp_config
