-- Install packer
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Install packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local git_clone_cmd =
    vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(git_clone_cmd)
  print("Installed packer.nvim")

  return
end

-- local execute = vim.api.nvim_command
-- local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
-- end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
  local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

  local plugin_path = plugin_prefix .. plugin .. "/"
  --	print('test '..plugin_path)
  local ok, err, code = os.rename(plugin_path, plugin_path)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  --	print(ok, err, code)
  if ok then
    vim.cmd("packadd " .. plugin)
  end
  return ok, err, code
end
