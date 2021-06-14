local execute = vim.api.nvim_command
local fn = vim.fn
local userSettings = require("settings")

local DAP = userSettings.DAP
local LSP = userSettings.LSP
local Opts = userSettings.Opts
local Completion = userSettings.Completion
local Treesitter = userSettings.Treesitter

-- all available LSP from lspinstall
local servers = {
  "angular",
  "bash",
  "cmake",
  "cpp",
  "csharp",
  "css",
  "dockerfile",
  "elixir",
  "elm",
  "go",
  "graphql",
  "html",
  "java",
  "json",
  "kotlin",
  "latex",
  "lua",
  "php",
  "python",
  "ruby",
  "rust",
  "svelte",
  "tailwindcss",
  "terraform",
  -- "typescript",
  "vim",
  "vue",
  "yaml",
  --non-language specific
  "deno",
  "diagnosticls",
  "efm",
  "rome"
}

for _, v in pairs(servers) do
  if LSP[v] == nil then
    LSP[v] = false
  end
end

if LSP.log_level == nil then
  -- trace, debug, info, warn, error
  LSP.log_level = "info"
end

if LSP.hover_diagnostic == nil then
  LSP.hover_diagnostic = false
end

if LSP.virtual_text == nil then
  LSP.virtual_text = {
    spacing = 2,
    severity_limit = "Error"
  }
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

if Opts.log_path == nil then
  Opts.log_path = "/tmp/nvim.log"
end

if Opts.log_stdout == nil then
  Opts.log_stdout = false
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

-- Dap
if DAP.enabled == nil then
  DAP.enabled = false
end

-- Treesitter
if Treesitter.enabled == nil then
  Treesitter.enabled = true
end

userSettings.Completion = Completion
userSettings.Opts = Opts
userSettings.LSP = LSP
userSettings.DAP = DAP
userSettings.Treesitter = Treesitter

return userSettings
