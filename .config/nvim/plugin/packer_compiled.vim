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
  LeaderF = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/LeaderF"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n†\5\0\0\t\0!\0Q6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\17\0005\5\t\0\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\29\0B\6\2\2=\6\30\5\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\a\4=\4\31\3B\1\2\0016\1 \0B\1\1\1K\0\1\0\15set_config\17key_bindings\6R\18refresh_files\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\1\0\0\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\15file_panel\1\0\2\nwidth\3(\14use_icons\2\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/doom-one.vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nê\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1À\0À\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_bg\f#0F1216\15default_fg\f#909090\nsetup\vfeline\frequire\15get_colors\0" },
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
    config = { "\27LJ\2\n—\6\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\t\17n <leader>hb0<cmd>lua require\"gitsigns\".blame_line()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\vbuffer\2\to ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\nsigns\19signs_config_1\1\0\5\20update_debounce\3È\1\18sign_priority\3\6\vlinehl\1\23use_decoration_api\1\nnumhl\1\nsetup\rgitsigns\frequire\0" },
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
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n7\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\bbqf\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n~\0\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0B\0\3\1K\0\1\0\1\0\2\tmode\15foreground\nnames\1\bcss\1\0\1\tmode\15background\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\nà\3\0\0\6\0\22\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\6\0009\4\5\0=\4\5\0035\4\b\0009\5\a\0=\5\a\0049\5\t\0=\5\t\0049\5\n\0=\5\n\0049\5\v\0=\5\f\0049\5\r\0=\5\14\0049\5\15\0=\5\15\0049\5\16\0=\5\16\0045\5\17\0=\5\18\4=\4\19\3B\1\2\0016\1\20\0B\1\1\0016\1\21\0B\1\1\1K\0\1\0\16set_mapping\15set_config\vsource\rnvim_lua\1\0\1\tmenu\n[îŸ…]\nemoji\nspell\rnvim_lsp\blsp\nvsnip\rsnippets\tcalc\vbuffer\1\0\0\tpath\1\0\v\19max_abbr_width\3d\21incomplete_delay\3\3\19source_timeout\3È\1\18throttle_time\3P\19max_menu_width\3d\14preselect\valways\15min_length\3\2\17autocomplete\2\ndebug\1\18documentation\2\19max_kind_width\3d\fenabled\nsetup\ncompe\15Completion\vconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-compe"
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
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tload\blsp\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-reload"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21reset_highlights\vfeline\frequireE\1\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0K\0\1\0\0\21post_reload_hook\16nvim-reload\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-reload"
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
    config = { "\27LJ\2\nò\6\0\0\b\0\"\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0009\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0004\6\0\0=\6\v\0055\6\f\0=\6\r\5=\5\14\0045\5\18\0005\6\16\0009\a\15\0=\a\17\6=\6\17\5=\5\15\0045\5\22\0005\6\19\0005\a\20\0=\a\21\6=\6\23\0055\6\24\0=\6\25\5=\5\26\0045\5\28\0009\6\27\0=\6\17\5=\5\27\0045\5\30\0009\6\29\0=\6\17\5=\5\29\0045\5\31\0005\6 \0=\6\21\5=\5!\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\1\0\0\frainbow\1\0\0\vindent\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\1\0\2&additional_vim_regex_highlighting\2\21use_languagetree\2\venable\1\0\0\14highlight\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\24toggle_query_editor\6o\vupdate\6R\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\fdisable\1\0\3\20persist_queries\1\venable\2\15updatetime\3\25\16textobjects\1\0\1\venable\2\21ensure_installed\1\0\0\fparsers\nsetup\28nvim-treesitter.configs\15Treesitter\vconfig\frequire\0" },
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
  playground = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/playground"
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
    config = { "\27LJ\2\n™\3\0\0\t\0\19\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0B\2\2\0019\2\5\0015\4\r\0005\5\6\0005\6\n\0005\a\b\0009\b\a\0=\b\t\a=\a\v\6=\6\f\5=\5\14\0045\5\16\0005\6\15\0=\6\4\5=\5\17\4B\2\2\0016\2\18\0B\2\1\1K\0\1\0\17set_mappings\15extensions\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\1\0\0\nclose\1\0\6\20selection_caret\b|> \nwidth\4\0€€€ÿ\3\18prompt_prefix\bÎ» \20scroll_strategy\ncycle\20layout_strategy\tflex\rwinblend\3\n\nsetup\15fzy_native\19load_extension\14telescope\22telescope.actions\frequire\0" },
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
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
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
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  },
  ["vim-yoink"] = {
    config = { "\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-yoink"
  },
  vimade = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimade\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimade"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n£\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vwindow\1\0\0\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\vborder\tnone\rposition\vbottom\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/yats.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-bqf
time("Config for nvim-bqf", true)
try_loadstring("\27LJ\2\n7\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\bbqf\frequire\0", "config", "nvim-bqf")
time("Config for nvim-bqf", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: nvim-web-devicons
time("Config for nvim-web-devicons", true)
try_loadstring("\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time("Config for nvim-web-devicons", false)
-- Config for: vimade
time("Config for vimade", true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimade\frequire\0", "config", "vimade")
time("Config for vimade", false)
-- Config for: nvim-hlslens
time("Config for nvim-hlslens", true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\19hlslens_config\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time("Config for nvim-hlslens", false)
-- Config for: splitjoin.vim
time("Config for splitjoin.vim", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "splitjoin.vim")
time("Config for splitjoin.vim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tload\blsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: feline.nvim
time("Config for feline.nvim", true)
try_loadstring("\27LJ\2\nê\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1À\0À\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_bg\f#0F1216\15default_fg\f#909090\nsetup\vfeline\frequire\15get_colors\0", "config", "feline.nvim")
time("Config for feline.nvim", false)
-- Config for: diffview.nvim
time("Config for diffview.nvim", true)
try_loadstring("\27LJ\2\n†\5\0\0\t\0!\0Q6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\17\0005\5\t\0\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\29\0B\6\2\2=\6\30\5\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\a\4=\4\31\3B\1\2\0016\1 \0B\1\1\1K\0\1\0\15set_config\17key_bindings\6R\18refresh_files\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\1\0\0\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\15file_panel\1\0\2\nwidth\3(\14use_icons\2\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time("Config for diffview.nvim", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n~\0\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0B\0\3\1K\0\1\0\1\0\2\tmode\15foreground\nnames\1\bcss\1\0\1\tmode\15background\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)
-- Config for: vim-mundo
time("Config for vim-mundo", true)
try_loadstring("\27LJ\2\n3\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\17set_mappings\15set_config\0", "config", "vim-mundo")
time("Config for vim-mundo", false)
-- Config for: LeaderF
time("Config for LeaderF", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "LeaderF")
time("Config for LeaderF", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n™\3\0\0\t\0\19\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0B\2\2\0019\2\5\0015\4\r\0005\5\6\0005\6\n\0005\a\b\0009\b\a\0=\b\t\a=\a\v\6=\6\f\5=\5\14\0045\5\16\0005\6\15\0=\6\4\5=\5\17\4B\2\2\0016\2\18\0B\2\1\1K\0\1\0\17set_mappings\15extensions\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\1\0\0\nclose\1\0\6\20selection_caret\b|> \nwidth\4\0€€€ÿ\3\18prompt_prefix\bÎ» \20scroll_strategy\ncycle\20layout_strategy\tflex\rwinblend\3\n\nsetup\15fzy_native\19load_extension\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: nvim-reload
time("Config for nvim-reload", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21reset_highlights\vfeline\frequireE\1\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0K\0\1\0\0\21post_reload_hook\16nvim-reload\frequire\0", "config", "nvim-reload")
time("Config for nvim-reload", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimŸ\1\1\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0B\0\1\0016\0\4\0B\0\1\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0003\2\a\0B\0\2\1K\0\1\0\0\23on_nvim_tree_ready\21nvim-tree.events\15set_config\17set_mappings\ron_enter\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: vim-sayonara
time("Config for vim-sayonara", true)
try_loadstring("\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0", "config", "vim-sayonara")
time("Config for vim-sayonara", false)
-- Config for: vim-smoothie
time("Config for vim-smoothie", true)
try_loadstring("\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0", "config", "vim-smoothie")
time("Config for vim-smoothie", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\nò\6\0\0\b\0\"\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0009\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0004\6\0\0=\6\v\0055\6\f\0=\6\r\5=\5\14\0045\5\18\0005\6\16\0009\a\15\0=\a\17\6=\6\17\5=\5\15\0045\5\22\0005\6\19\0005\a\20\0=\a\21\6=\6\23\0055\6\24\0=\6\25\5=\5\26\0045\5\28\0009\6\27\0=\6\17\5=\5\27\0045\5\30\0009\6\29\0=\6\17\5=\5\29\0045\5\31\0005\6 \0=\6\21\5=\5!\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\1\0\0\frainbow\1\0\0\vindent\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\1\0\2&additional_vim_regex_highlighting\2\21use_languagetree\2\venable\1\0\0\14highlight\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\24toggle_query_editor\6o\vupdate\6R\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\fdisable\1\0\3\20persist_queries\1\venable\2\15updatetime\3\25\16textobjects\1\0\1\venable\2\21ensure_installed\1\0\0\fparsers\nsetup\28nvim-treesitter.configs\15Treesitter\vconfig\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n—\6\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3è\a\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\t\17n <leader>hb0<cmd>lua require\"gitsigns\".blame_line()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\vbuffer\2\to ih2:<C-U>lua require\"gitsigns\".text_object()<CR>\nsigns\19signs_config_1\1\0\5\20update_debounce\3È\1\18sign_priority\3\6\vlinehl\1\23use_decoration_api\1\nnumhl\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n£\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vwindow\1\0\0\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\vborder\tnone\rposition\vbottom\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\nA\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\0À\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: vim-yoink
time("Config for vim-yoink", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0", "config", "vim-yoink")
time("Config for vim-yoink", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
