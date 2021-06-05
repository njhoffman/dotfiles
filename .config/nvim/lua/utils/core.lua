vim = vim
local utils = {}

-- autocommands
function utils.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.cmd(command)
    end

    vim.cmd("augroup END")
  end
end

-- local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(o, v, scopes)
  scopes = scopes or {vim.o}
  for _, s in ipairs(scopes) do
    s[o] = v
  end
end

-- mappings
function utils.map(modes, key, result, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  if type(modes) == "string" then
    modes = {modes}
  end
  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, key, result, options)
  end
end

-- Terminal
local has_toggleterm, toggleterm = pcall(require, "toggleterm")
if has_toggleterm then
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit =
    Terminal:new(
    {
      cmd = "lazygit",
      direction = "float",
      hidden = true
    }
  )

  function utils._lazygit_toggle()
    lazygit:toggle()
  end
end

-- Telescope
function utils.search_nvim()
  require("telescope.builtin").find_files(
    {
      prompt_title = "Neovim Config",
      cwd = "$HOME/.config/nvim/lua"
    }
  )
end

-- @param map {{mode, lhs, rhs, opts}, ..}
-- @param mode string 'n' | 'i' | 'v'
-- @param lhs string key to map
-- @param rhs string command to run
utils.keymap = function(map)
  map = map or {}
  local opts = map[4] or {}
  return vim.api.nvim_set_keymap(map[1], map[2], map[3], opts)
end

-- @param maps list of keymaps
utils.keymaps = function(maps)
  for _, m in ipairs(maps) do
    utils.keymap(m)
  end
end

-- Skip these servers for formatting
local skip_formatting_lsp = {"diagnosticls", "sumneko_lua", "tsserver"}

-- Format the file using the lsp formatter
utils.lsp_format = function()
  -- @param client lsp client
  local format = function(client)
    print(string.format("Formatting for attached client: %s", client.name))

    vim.lsp.buf.formatting_sync(nil, 1000)
  end

  -- Run the function if it passes all the checks
  -- @param client lsp client
  local once = function(client)
    return function(skip, f)
      for _, key in ipairs(skip) do
        if client.name == key then
          return
        end
      end

      f(client)
    end
  end

  -- Run our formatters
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    once(client)(skip_formatting_lsp, format)
  end
end

utils.log_to_file = function(logfile)
  return function(log_value)
    local file = io.open(logfile, "a")
    if not file then
      file:close()
      return
    end

    file:write(log_value .. "\n")
    file:close()
  end
end

return utils
