local config = require("config")

DATA_PATH = vim.fn.stdpath("data")
local theme = config.Theme

-- Add LSP colors to colorschemes that don't support it yet
-- =========================================================

local lsp_config = {}

function lsp_config.hl(name)
  return vim.api.nvim_get_hl_by_name(name, true)
end

function lsp_config.exists(name)
  if vim.fn.hlexists(name) == 1 then
    local hl = lsp_config.hl(name)
    local count = 0
    for key, value in pairs(hl) do
      -- this is needed for groups that only have "cleared"
      if not (key == true and value == 6) then count = count + 1 end
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
    if default then vim.cmd("hi " .. group .. " " .. default) end
  end
end

function lsp_config.fix()
  -- dump({ fix = event })
  -- Default Groups
  for _, lsp in pairs({"Error", "Warning", "Information", "Hint"}) do
    local coc = lsp
    if lsp == "Information" then coc = "Info" end
    lsp_config.link("LspDiagnosticsDefault" .. lsp, {"Coc" .. coc .. "Sign"}, "guifg=" .. config[lsp])
    lsp_config.link("LspDiagnosticsVirtualText" .. lsp, {"LspDiagnosticsDefault" .. lsp})

    local color = theme.diagnostic_colors[lsp]
    local hl = lsp_config.hl("LspDiagnosticsDefault" .. lsp)
    if hl and hl.foreground then color = string.format("#%06x", hl.foreground) end
    lsp_config.link("LspDiagnosticsUnderline" .. lsp, {}, "gui=undercurl guisp=" .. color)
  end

  lsp_config.link("LspReferenceText", {"CocHighlightText", "CursorLine"})
  lsp_config.link("LspReferenceRead", {"CocHighlightRead", "LspReferenceText"})
  lsp_config.link("LspReferenceWrite", {"CocHighlightWrite", "LspReferenceText"})
end

return lsp_config
