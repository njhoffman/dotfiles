local plugin = {}

local execute = vim.api.nvim_command
local fn = vim.fn

function plugin.bootstrap_packer()
  --bootstrap packer
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
  end

end

function plugin.setup(use)
  use "wbthomason/packer.nvim"
  vim.api.nvim_exec([[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]], false)
end

return plugin
