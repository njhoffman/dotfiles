" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["ack.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-preview.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/fzf-preview.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n’\1\0\0\4\1\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1-\0\0\0009\0\5\0B\0\1\1K\0\1\0\0À\fmapping\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  neg = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/neg"
  },
  neoformat = {
    config = { "\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\1-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0À\vconfig\14neoformat\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n7\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\bbqf\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nŒ\1\0\0\3\0\6\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0006\2\3\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\blsp\23plugins.nvim_compe\buse\nsetup\20plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n4\0\0\2\1\2\0\a-\0\0\0009\0\0\0B\0\1\1-\0\0\0009\0\1\0B\0\1\1K\0\1\0\1À\fmapping\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nK\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    config = { "\27LJ\2\nP\0\0\4\1\4\0\n-\0\0\0009\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\1\18\3\0\0B\1\2\1K\0\1\0\0À\nsetup\14telescope\frequire\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\0À\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-HiLinkTrace"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-HiLinkTrace"
  },
  ["vim-action-ag"] = {
    config = { "\27LJ\2\n4\0\0\2\1\2\0\a-\0\0\0009\0\0\0B\0\1\1-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\fmapping\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-action-ag"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n!\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\fmapping\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc"
  },
  ["vim-profiler"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-profiler"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-smoothie"] = {
    config = { "\27LJ\2\nB\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\1-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0À\fmapping\17vim-smoothie\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimade = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimade"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n4\0\0\2\1\2\0\a-\0\0\0009\0\0\0B\0\1\1-\0\0\0009\0\1\0B\0\1\1K\0\1\0\1À\fmapping\vconfig\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: vim-smoothie
time("Config for vim-smoothie", true)
try_loadstring("\27LJ\2\nB\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\1-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0À\fmapping\17vim-smoothie\frequire\0", "config", "vim-smoothie")
time("Config for vim-smoothie", false)
-- Config for: neoformat
time("Config for neoformat", true)
try_loadstring("\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\1-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0À\vconfig\14neoformat\frequire\0", "config", "neoformat")
time("Config for neoformat", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\n’\1\0\0\4\1\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1-\0\0\0009\0\5\0B\0\1\1K\0\1\0\0À\fmapping\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: nvim-web-devicons
time("Config for nvim-web-devicons", true)
try_loadstring("\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time("Config for nvim-web-devicons", false)
-- Config for: splitjoin.vim
time("Config for splitjoin.vim", true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0", "config", "splitjoin.vim")
time("Config for splitjoin.vim", false)
-- Config for: telescope-fzy-native.nvim
time("Config for telescope-fzy-native.nvim", true)
try_loadstring("\27LJ\2\nP\0\0\4\1\4\0\n-\0\0\0009\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\1\18\3\0\0B\1\2\1K\0\1\0\0À\nsetup\14telescope\frequire\vconfig\0", "config", "telescope-fzy-native.nvim")
time("Config for telescope-fzy-native.nvim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\nA\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\0À\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\nŒ\1\0\0\3\0\6\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0006\2\3\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\blsp\23plugins.nvim_compe\buse\nsetup\20plugins.lspsaga\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: vim-easy-align
time("Config for vim-easy-align", true)
try_loadstring("\27LJ\2\n!\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\fmapping\0", "config", "vim-easy-align")
time("Config for vim-easy-align", false)
-- Config for: vim-action-ag
time("Config for vim-action-ag", true)
try_loadstring("\27LJ\2\n4\0\0\2\1\2\0\a-\0\0\0009\0\0\0B\0\1\1-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\fmapping\vconfig\0", "config", "vim-action-ag")
time("Config for vim-action-ag", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\nK\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: nvim-bqf
time("Config for nvim-bqf", true)
try_loadstring("\27LJ\2\n7\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\bbqf\frequire\0", "config", "nvim-bqf")
time("Config for nvim-bqf", false)
-- Config for: vim-hexokinase
time("Config for vim-hexokinase", true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0", "config", "vim-hexokinase")
time("Config for vim-hexokinase", false)
-- Config for: nvim-hlslens
time("Config for nvim-hlslens", true)
try_loadstring("\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time("Config for nvim-hlslens", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)
-- Config for: vimade
time("Config for vimade", true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0", "config", "vimade")
time("Config for vimade", false)
-- Config for: vim-mundo
time("Config for vim-mundo", true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vconfig\0", "config", "vim-mundo")
time("Config for vim-mundo", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n<\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
