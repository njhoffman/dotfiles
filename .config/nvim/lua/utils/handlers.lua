-- Auto install plugin manager if doesn't exist
local execute = vim.api.nvim_command
local fn = vim.fn
local config = require "config"

local LSP = config.LSP
local Opts = config.Opts
local Completion = config.Completion

-- Theming
local default = "jellybeans"

local function color_style_or_empty(check)
  local v
  if check ~= nil then
    v = check:gsub("%s+", "")
  else
    v = ""
  end
  return v
end

-- LSP

local servers = {
  "bash",
  "clangd",
  "css",
  "diagnosticls",
  "gopls",
  "json",
  "lua",
  "python",
  "tsserver",
  "html",
  "latex",
}

for _, v in pairs(servers) do
  if LSP[v] == nil then
    LSP[v] = false
  end
end

-- Options
if Opts.relativenumber == nil then
  Opts.relativenumber = true
end

if Opts.timeoutlen == nil or Opts.timeoutlen < 0 then
  Opts.timeoutlen = 500
end

if Opts.scrolloff == nil or Opts.scrolloff < 0 then
  Opts.scrolloff = 10
end

if Opts.wrap == nil then
  Opts.wrap = false
end

if Opts.cursorline == nil then
  Opts.cursorline = true
end

if Opts.explorer_side == nil then
  Opts.explorer_side = "left"
end

-- Completion
if Completion.items < 1 or Completion.items == nil then
  Completion.items = 15
end

if Completion.enabled == nil then
  Completion.enabled = true
end

local function compe_menu(source, str, src, prio, ft)
  if source == nil or source == true then
    if ft == nil then
      return {kind = str, menu = src, priority = prio}
    elseif prio == nil and ft == nil then
      return {kind = str, menu = src}
    elseif str == nil and prio == nil then
      return {menu = src, filetypes = ft}
    elseif str == nil and prio == nil and ft == nil then
      return {menu = str}
    end
  end
  return false
end

Completion.buffer = compe_menu(Completion.buffer, "  (Buffer)", "[B]", nil, nil)
Completion.spell = compe_menu(Completion.spell, "  (Spell)", "[E]", nil, nil)
Completion.path = compe_menu(Completion.path, "  (Path)", nil, nil, nil)
Completion.calc = compe_menu(Completion.calc, "  (Calc)", "[C]", nil, nil)
Completion.snippets = compe_menu(Completion.snippets, " ﬌ (Snippet)", "[S]", 1500, nil)
Completion.emoji = compe_menu(Completion.emoji, nil, "[ ﲃ ]", nil, {"markdown", "text"})
Completion.lsp = compe_menu(Completion.lsp, nil, "[L]", nil, nil)
