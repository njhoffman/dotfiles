local config = require("config")

local status = {"classic", "default", "slant", "nicholas", "minimal", "vscode"}

if config.Theming.statusline == nil or config.Theming.statusline:gsub("%s+", "") == "" then
  require("plugins/statusline/styles/" .. status[1])
else
  for _, v in pairs(status) do
    if config.Theming.statusline:gsub("%s+", "") == v then
      require("plugins/statusline/styles/" .. v)
      break
    elseif config.Theming.statusline:gsub("%s+", "") == "default" then
      require("feline").setup()
      break
    end
  end
end
