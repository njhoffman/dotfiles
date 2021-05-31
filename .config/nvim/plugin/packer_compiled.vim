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
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/doom-one.vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nê\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1À\0À\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_fg\f#909090\15default_bg\f#0F1216\nsetup\vfeline\frequire\15get_colors\0" },
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
    config = { "\27LJ\2\n¢\5\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\1\0\2\fnoremap\2\vbuffer\2\nsigns\1\0\5\18sign_priority\3\6\20update_debounce\3È\1\nnumhl\1\23use_decoration_api\1\vlinehl\1\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\bï¤‰\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\bï¤‰\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\bâ–Ž\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\bâ–Ž\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    config = { "\27LJ\2\n–\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0 neoformat_only_msg_on_error neoformat_basic_format_trim!neoformat_basic_format_retab\6g\bvim\0" },
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
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-compe"
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
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\19hlslens_config\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
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
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimŸ\1\1\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0B\0\1\0016\0\4\0B\0\1\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0003\2\a\0B\0\2\1K\0\1\0\0\23on_nvim_tree_ready\21nvim-tree.events\15set_config\17set_mappings\ron_enter\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¥\4\0\0\b\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0009\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\r\0005\6\n\0005\a\v\0=\a\f\6=\6\14\0055\6\15\0=\6\16\5=\5\17\0045\5\19\0009\6\18\0=\6\20\5=\5\18\0045\5\22\0009\6\21\0=\6\20\5=\5\21\0045\5\23\0005\6\24\0=\6\f\5=\5\25\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\1\0\0\frainbow\venable\1\0\0\vindent\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\14highlight\1\0\3\21use_languagetree\2&additional_vim_regex_highlighting\2\venable\2\21ensure_installed\1\0\0\fparsers\nsetup\28nvim-treesitter.configs\15Treesitter\vconfig\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
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
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
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
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\ný\1\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\1\0009\0\4\0005\2\6\0005\3\5\0=\3\a\0025\3\t\0005\4\b\0=\4\3\3=\3\n\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\1\0\2\18prompt_prefix\vÎ» -> \20selection_caret\b|> \nsetup\15fzy_native\19load_extension\14telescope\frequire\0" },
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
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\n3\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\17set_mappings\15set_config\0" },
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
  ["vim-rooter"] = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sayonara"] = {
    config = { "\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-sayonara"
  },
  ["vim-smoothie"] = {
    config = { "\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0" },
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
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimade\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimade"
  }
}

time("Defining packer_plugins", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\ný\1\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\1\0009\0\4\0005\2\6\0005\3\5\0=\3\a\0025\3\t\0005\4\b\0=\4\3\3=\3\n\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\1\0\2\18prompt_prefix\vÎ» -> \20selection_caret\b|> \nsetup\15fzy_native\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: vim-sayonara
time("Config for vim-sayonara", true)
try_loadstring("\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0", "config", "vim-sayonara")
time("Config for vim-sayonara", false)
-- Config for: nvim-hlslens
time("Config for nvim-hlslens", true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\19hlslens_config\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time("Config for nvim-hlslens", false)
-- Config for: splitjoin.vim
time("Config for splitjoin.vim", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "splitjoin.vim")
time("Config for splitjoin.vim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\nA\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\0À\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: nvim-bqf
time("Config for nvim-bqf", true)
try_loadstring("\27LJ\2\n7\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\bbqf\frequire\0", "config", "nvim-bqf")
time("Config for nvim-bqf", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n¥\4\0\0\b\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0009\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\r\0005\6\n\0005\a\v\0=\a\f\6=\6\14\0055\6\15\0=\6\16\5=\5\17\0045\5\19\0009\6\18\0=\6\20\5=\5\18\0045\5\22\0009\6\21\0=\6\20\5=\5\21\0045\5\23\0005\6\24\0=\6\f\5=\5\25\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\1\0\0\frainbow\venable\1\0\0\vindent\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\14highlight\1\0\3\21use_languagetree\2&additional_vim_regex_highlighting\2\venable\2\21ensure_installed\1\0\0\fparsers\nsetup\28nvim-treesitter.configs\15Treesitter\vconfig\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n¢\5\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\1\0\2\fnoremap\2\vbuffer\2\nsigns\1\0\5\18sign_priority\3\6\20update_debounce\3È\1\nnumhl\1\23use_decoration_api\1\vlinehl\1\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\bï¤‰\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\bï¤‰\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\bâ–Ž\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\bâ–Ž\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)
-- Config for: vim-mundo
time("Config for vim-mundo", true)
try_loadstring("\27LJ\2\n3\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\17set_mappings\15set_config\0", "config", "vim-mundo")
time("Config for vim-mundo", false)
-- Config for: vim-rooter
time("Config for vim-rooter", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "vim-rooter")
time("Config for vim-rooter", false)
-- Config for: neoformat
time("Config for neoformat", true)
try_loadstring("\27LJ\2\n–\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0 neoformat_only_msg_on_error neoformat_basic_format_trim!neoformat_basic_format_retab\6g\bvim\0", "config", "neoformat")
time("Config for neoformat", false)
-- Config for: feline.nvim
time("Config for feline.nvim", true)
try_loadstring("\27LJ\2\nê\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1À\0À\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_fg\f#909090\15default_bg\f#0F1216\nsetup\vfeline\frequire\15get_colors\0", "config", "feline.nvim")
time("Config for feline.nvim", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimŸ\1\1\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0B\0\1\0016\0\4\0B\0\1\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0003\2\a\0B\0\2\1K\0\1\0\0\23on_nvim_tree_ready\21nvim-tree.events\15set_config\17set_mappings\ron_enter\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: vim-hexokinase
time("Config for vim-hexokinase", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-hexokinase")
time("Config for vim-hexokinase", false)
-- Config for: nvim-web-devicons
time("Config for nvim-web-devicons", true)
try_loadstring("\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time("Config for nvim-web-devicons", false)
-- Config for: vimade
time("Config for vimade", true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimade\frequire\0", "config", "vimade")
time("Config for vimade", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: vim-smoothie
time("Config for vim-smoothie", true)
try_loadstring("\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0", "config", "vim-smoothie")
time("Config for vim-smoothie", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
