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
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["Dockerfile.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/Dockerfile.vim"
  },
  ["JABS.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/JABS.nvim"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/ansible-vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nä\2\0\0\4\0\n\0\0165\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2'\2\5\0&\1\2\1=\1\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\17auto-session\frequire\26auto_session_root_dir\15/sessions/\tdata\fstdpath\afn\bvim\1\0\5\14log_level\tinfo\25auto_restore_enabled\2\22auto_save_enabled\2\25auto_session_enabled\2%auto_session_enable_last_session\1\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nÜ\5\0\0\t\0!\0Q6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\17\0005\5\t\0\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\29\0B\6\2\2=\6\30\5\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\a\4=\4\31\3B\1\2\0016\1 \0B\1\1\1K\0\1\0\15set_config\17key_bindings\6R\18refresh_files\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\1\0\0\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\15file_panel\1\0\2\14use_icons\2\nwidth\3(\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/doom-one.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1¿\0¿\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_fg\f#909090\15default_bg\f#0F1216\nsetup\vfeline\frequire\15get_colors\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/friendly-snippets"
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
    config = { "\27LJ\2\n√\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\nsigns\19signs_config_1\1\0\5\20update_debounce\3»\1\nnumhl\1\18sign_priority\3\6\vlinehl\1\23use_decoration_api\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["json5.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/json5.vim"
  },
  ["jsonc.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/jsonc.vim"
  },
  kommentary = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nginx.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nginx.vim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-compe"] = {
    after_files = { "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n‡\3\0\0\6\0\22\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\6\0009\4\5\0=\4\5\0035\4\b\0009\5\a\0=\5\a\0049\5\t\0=\5\t\0049\5\n\0=\5\n\0049\5\v\0=\5\f\0049\5\r\0=\5\14\0049\5\15\0=\5\15\0049\5\16\0=\5\16\0045\5\17\0=\5\18\4=\4\19\3B\1\2\0016\1\20\0B\1\1\0016\1\21\0B\1\1\1K\0\1\0\16set_mapping\15set_config\vsource\rnvim_lua\1\0\1\tmenu\n[ÓüÖ]\nemoji\nspell\rnvim_lsp\blsp\nvsnip\rsnippets\tcalc\vbuffer\1\0\0\tpath\1\0\v\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\2\17autocomplete\2\ndebug\1\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\fenabled\nsetup\ncompe\15Completion\vconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nó\4\0\0\5\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\15\0005\4\14\0=\4\f\3=\3\16\0025\3\17\0=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0005\3\23\0B\0\3\0016\0\19\0009\0\20\0009\0\21\0'\2\24\0005\3\25\0B\0\3\1K\0\1\0\1\0\4\vlinehl\5\vtexthl\5\nnumhl\5\ttext\tüõë\15DapStopped\1\0\4\vlinehl\5\vtexthl\22DAPBreakpointSign\nnumhl\5\ttext\b‚ñ†\18DapBreakpoint\16sign_define\afn\bvim\rfloating\1\0\0\ttray\1\0\2\vheight\3\n\rposition\vbottom\1\2\0\0\trepl\fsidebar\relements\1\0\2\rposition\tleft\nwidth\3(\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\rmappings\vexpand\1\0\3\topen\6o\vremove\6d\tedit\6e\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\aŒª\rexpanded\a|>\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
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
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
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
  ["nvim-reload"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21reset_highlights\vfeline\frequireE\1\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0K\0\1\0\0\21post_reload_hook\16nvim-reload\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimä\1\1\0\3\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0003\2\5\0B\0\2\0016\0\6\0B\0\1\1K\0\1\0\15set_config\0\23on_nvim_tree_ready\21nvim-tree.events\ron_enter\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‚\n\0\0\b\0004\0D6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\2\5\0015\4\6\0005\5\a\0004\6\0\0=\6\b\0055\6\t\0=\6\n\5=\5\v\0045\5\15\0005\6\r\0009\a\f\0=\a\14\6=\6\14\5=\5\f\0045\5\19\0005\6\16\0005\a\17\0=\a\18\6=\6\20\0055\6\21\0=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\29\0009\6\28\0=\6\14\5=\5\28\0045\5 \0005\6\30\0005\a\31\0=\a\18\6=\6!\0055\6\"\0005\a#\0=\a$\0065\a%\0=\a&\6=\6'\0055\6(\0005\a)\0=\a*\0065\a+\0=\a,\6=\6-\5=\5.\0045\0050\0009\6/\0=\6\14\5=\5/\0045\0051\0005\0062\0=\6\18\5=\0053\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\21node_incremental\bgrn\1\0\1\venable\2\1\0\0\frainbow\16textobjects\tmove\24goto_previous_start\1\0\2\a[f\20@function.outer\a[c\17@class.outer\20goto_next_start\1\0\2\a]c\17@class.outer\a]f\20@function.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\6\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\aaa\21@parameter.outer\aac\17@class.outer\aif\20@function.inner\1\0\1\venable\2\1\0\0\vindent\fautotag\1\0\1\venable\2\fmatchup\1\0\1\venable\2\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\1\0\2&additional_vim_regex_highlighting\2\21use_languagetree\2\venable\1\0\0\14highlight\15playground\16keybindings\1\0\n\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\vupdate\6R\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\fdisable\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\20nvim-ts-autotag\15Treesitter\vconfig\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["php.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/php.vim"
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
  ["scrollbar.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/scrollbar.nvim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\2\1\0\2\14previewer\2\17shorten_path\2\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÃ\t\0\0\v\0-\0D6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\3'\6\6\0B\4\2\0019\4\5\3'\6\a\0B\4\2\0019\4\5\3'\6\b\0B\4\2\0019\4\5\3'\6\t\0B\4\2\0019\4\5\3'\6\n\0B\4\2\0019\4\v\0035\6(\0005\a\r\0005\b\f\0=\b\14\a5\b\15\0=\b\16\a5\b\17\0=\b\18\a5\b\19\0=\b\20\a5\b\26\0005\t\22\0009\n\21\2=\n\23\t9\n\24\2=\n\25\t=\t\27\b5\t\28\0009\n\21\2=\n\23\t=\t\29\b=\b\30\a9\b\31\0=\b \a9\b!\0019\b\"\b=\b#\a9\b$\0019\b\"\b=\b%\a9\b&\0019\b\"\b=\b'\a=\a)\0065\a+\0005\b*\0=\b\b\a=\a,\6B\4\2\1K\0\1\0\15extensions\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\16file_sorter\19get_fzy_sorter\rmappings\6n\1\0\0\6i\1\0\0\n<C-q>\19send_to_qflist\n<esc>\1\0\0\nclose\rvertical\1\0\3\19height_padding\3\1\18width_padding\4ö≥ÊÃ\tô≥¶˝\3\19preview_height\4\0ÄÄÄˇ\3\15horizontal\1\0\3\19height_padding\4ö≥ÊÃ\tô≥Ê˝\3\18width_padding\4ö≥ÊÃ\tô≥Ê˝\3\18preview_width\4≥ÊÃô\3≥Êåˇ\3\17find_command\1\5\0\0\arg\r--ignore\r--hidden\31--files prompt_prefix=üîç\22vimgrep_arguments\1\0\v\nwidth\4\0ÄÄÄˇ\3\rwinblend\3\15\19color_devicons\2\20scroll_strategy\ncycle\20layout_strategy\tflex\21sorting_strategy\14ascending\23selection_strategy\nreset\20selection_caret\b|> \18prompt_prefix\bŒª \20prompt_position\btop\17shorten_path\2\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\15asynctasks\fproject\15fzy_native\bdap\17session-lens\19load_extension\14telescope\22telescope.actions\25telescope.previewers\22telescope.sorters\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/tmux.vim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n≥\a\0\0\6\0)\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\0025\3\23\0=\3\24\0025\3\26\0005\4\25\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0005\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\18\\b(KEYWORDS):\vcolors\fdefault\1\3\0\0\15Identifier\f#7C6AED\thint\1\3\0\0\30LspDiagnosticsDefaultHint\f#10B981\tinfo\1\3\0\0%LspDiagnosticsDefaultInformation\f#2593FB\fwarning\1\4\0\0!LspDiagnosticsDefaultWarning\15WarningMsg\f#CBAF24\nerror\1\0\0\1\4\0\0\31LspDiagnosticsDefaultError\rErrorMsg\f#DC2626\14highlight\1\0\5\fpattern\22.*<(KEYWORDS)\\s*:\18comments_only\2\nafter\afg\fkeyword\afg\vbefore\5\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\bÔ°ß\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\bÔôë\tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\bÔÅ±\tHACK\1\0\2\ticon\bÔíê\ncolor\fwarning\tTODO\1\0\2\ticon\bÔÄå\ncolor\tinfo\bFIX\1\0\0\balt\1\6\0\0\nFIXME\bBUG\nFIXIT\bFIX\nISSUE\1\0\2\ncolor\nerror\ticon\t ÔÜà\1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-HiLinkTrace"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-HiLinkTrace"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-bbye"
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
  ["vim-git"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-git"
  },
  ["vim-gitignore"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-gitignore"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-graphql"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-kubernetes"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-kubernetes"
  },
  ["vim-matchup"] = {
    after_files = { "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\nz\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen matchup_matchparen_deferred\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-multiple-cursors"] = {
    config = { "\27LJ\2\n∂\3\0\0\2\0\18\0%6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\4\0=\1\v\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0'\1\17\0=\1\16\0K\0\1\0\n<Esc>\26multi_cursor_quit_key\n<C-x>\26multi_cursor_skip_key\n<C-p>\26multi_cursor_prev_key\26multi_cursor_next_key\vg<A-n> multi_cursor_select_all_key\vg<C-n>\27multi_cursor_start_key\n<A-n>%multi_cursor_select_all_word_key\n<C-n> multi_cursor_start_word_key%multi_cursor_use_default_mapping\6g\bvim\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-node"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-node"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc"
  },
  ["vim-profiler"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-profiler"
  },
  ["vim-puppet"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-puppet"
  },
  ["vim-renamer"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-renamer"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-ripple"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-ripple"
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
  ["vim-sh"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-sh"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-systemd-syntax"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-systemd-syntax"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["vim-yoink"] = {
    config = { "\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-yoink"
  },
  vimade = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimade"
  },
  vimux = {
    config = { "\27LJ\2\n–\2\0\0\2\0\16\0%6\0\0\0009\0\1\0)\1\30\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0)\1\0\0=\1\15\0K\0\1\0\21VimuxCloseOnExit\22VimuxCommandShell\ttmux\21VimuxTmuxCommand\rvimuxout\20VimuxRunnerName\tpane\20VimuxRunnerType\5\22VimuxPromptString\nq C-u\23VimuxResetSequence\20VimuxUseNearest\16VimuxHeight\6g\bvim\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimux"
  },
  vimwiki = {
    config = { "\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÑ\4\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\1\fspacing\3\5\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\1\3\1\3\1\3\1\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\rposition\vbottom\vborder\vsingle\nicons\1\0\3\15breadcrumb\a¬ª\ngroup\6+\14separator\b‚ûú\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\6z\2\6g\2\bnav\2\fwindows\2\17text_objects\2\fmotions\2\14operators\2\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/yats.vim"
  },
  ["zinit-vim-syntax"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/zinit-vim-syntax"
  }
}

time("Defining packer_plugins", false)
-- Config for: auto-session
time("Config for auto-session", true)
try_loadstring("\27LJ\2\nä\2\0\0\4\0\n\0\0165\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2'\2\5\0&\1\2\1=\1\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\17auto-session\frequire\26auto_session_root_dir\15/sessions/\tdata\fstdpath\afn\bvim\1\0\5\14log_level\tinfo\25auto_restore_enabled\2\22auto_save_enabled\2\25auto_session_enabled\2%auto_session_enable_last_session\1\0", "config", "auto-session")
time("Config for auto-session", false)
-- Config for: session-lens
time("Config for session-lens", true)
try_loadstring("\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15theme_conf\1\0\1\vborder\2\1\0\2\14previewer\2\17shorten_path\2\nsetup\17session-lens\frequire\0", "config", "session-lens")
time("Config for session-lens", false)
-- Config for: surround.nvim
time("Config for surround.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time("Config for surround.nvim", false)
-- Config for: vim-yoink
time("Config for vim-yoink", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0", "config", "vim-yoink")
time("Config for vim-yoink", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\nÃ\t\0\0\v\0-\0D6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\3'\6\6\0B\4\2\0019\4\5\3'\6\a\0B\4\2\0019\4\5\3'\6\b\0B\4\2\0019\4\5\3'\6\t\0B\4\2\0019\4\5\3'\6\n\0B\4\2\0019\4\v\0035\6(\0005\a\r\0005\b\f\0=\b\14\a5\b\15\0=\b\16\a5\b\17\0=\b\18\a5\b\19\0=\b\20\a5\b\26\0005\t\22\0009\n\21\2=\n\23\t9\n\24\2=\n\25\t=\t\27\b5\t\28\0009\n\21\2=\n\23\t=\t\29\b=\b\30\a9\b\31\0=\b \a9\b!\0019\b\"\b=\b#\a9\b$\0019\b\"\b=\b%\a9\b&\0019\b\"\b=\b'\a=\a)\0065\a+\0005\b*\0=\b\b\a=\a,\6B\4\2\1K\0\1\0\15extensions\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\16file_sorter\19get_fzy_sorter\rmappings\6n\1\0\0\6i\1\0\0\n<C-q>\19send_to_qflist\n<esc>\1\0\0\nclose\rvertical\1\0\3\19height_padding\3\1\18width_padding\4ö≥ÊÃ\tô≥¶˝\3\19preview_height\4\0ÄÄÄˇ\3\15horizontal\1\0\3\19height_padding\4ö≥ÊÃ\tô≥Ê˝\3\18width_padding\4ö≥ÊÃ\tô≥Ê˝\3\18preview_width\4≥ÊÃô\3≥Êåˇ\3\17find_command\1\5\0\0\arg\r--ignore\r--hidden\31--files prompt_prefix=üîç\22vimgrep_arguments\1\0\v\nwidth\4\0ÄÄÄˇ\3\rwinblend\3\15\19color_devicons\2\20scroll_strategy\ncycle\20layout_strategy\tflex\21sorting_strategy\14ascending\23selection_strategy\nreset\20selection_caret\b|> \18prompt_prefix\bŒª \20prompt_position\btop\17shorten_path\2\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\15asynctasks\fproject\15fzy_native\bdap\17session-lens\19load_extension\14telescope\22telescope.actions\25telescope.previewers\22telescope.sorters\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: lsp_signature.nvim
time("Config for lsp_signature.nvim", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "lsp_signature.nvim")
time("Config for lsp_signature.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\nÑ\4\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\1\fspacing\3\5\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\1\3\1\3\1\3\1\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\rposition\vbottom\vborder\vsingle\nicons\1\0\3\15breadcrumb\a¬ª\ngroup\6+\14separator\b‚ûú\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\6z\2\6g\2\bnav\2\fwindows\2\17text_objects\2\fmotions\2\14operators\2\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimä\1\1\0\3\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0003\2\5\0B\0\2\0016\0\6\0B\0\1\1K\0\1\0\15set_config\0\23on_nvim_tree_ready\21nvim-tree.events\ron_enter\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: vim-multiple-cursors
time("Config for vim-multiple-cursors", true)
try_loadstring("\27LJ\2\n∂\3\0\0\2\0\18\0%6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\4\0=\1\v\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0'\1\17\0=\1\16\0K\0\1\0\n<Esc>\26multi_cursor_quit_key\n<C-x>\26multi_cursor_skip_key\n<C-p>\26multi_cursor_prev_key\26multi_cursor_next_key\vg<A-n> multi_cursor_select_all_key\vg<C-n>\27multi_cursor_start_key\n<A-n>%multi_cursor_select_all_word_key\n<C-n> multi_cursor_start_word_key%multi_cursor_use_default_mapping\6g\bvim\0", "config", "vim-multiple-cursors")
time("Config for vim-multiple-cursors", false)
-- Config for: vimux
time("Config for vimux", true)
try_loadstring("\27LJ\2\n–\2\0\0\2\0\16\0%6\0\0\0009\0\1\0)\1\30\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0)\1\0\0=\1\15\0K\0\1\0\21VimuxCloseOnExit\22VimuxCommandShell\ttmux\21VimuxTmuxCommand\rvimuxout\20VimuxRunnerName\tpane\20VimuxRunnerType\5\22VimuxPromptString\nq C-u\23VimuxResetSequence\20VimuxUseNearest\16VimuxHeight\6g\bvim\0", "config", "vimux")
time("Config for vimux", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\n>\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: nvim-hlslens
time("Config for nvim-hlslens", true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\19hlslens_config\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time("Config for nvim-hlslens", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n‚\n\0\0\b\0004\0D6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\2\5\0015\4\6\0005\5\a\0004\6\0\0=\6\b\0055\6\t\0=\6\n\5=\5\v\0045\5\15\0005\6\r\0009\a\f\0=\a\14\6=\6\14\5=\5\f\0045\5\19\0005\6\16\0005\a\17\0=\a\18\6=\6\20\0055\6\21\0=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\29\0009\6\28\0=\6\14\5=\5\28\0045\5 \0005\6\30\0005\a\31\0=\a\18\6=\6!\0055\6\"\0005\a#\0=\a$\0065\a%\0=\a&\6=\6'\0055\6(\0005\a)\0=\a*\0065\a+\0=\a,\6=\6-\5=\5.\0045\0050\0009\6/\0=\6\14\5=\5/\0045\0051\0005\0062\0=\6\18\5=\0053\4B\2\2\1K\0\1\0\26incremental_selection\1\0\4\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\21node_incremental\bgrn\1\0\1\venable\2\1\0\0\frainbow\16textobjects\tmove\24goto_previous_start\1\0\2\a[f\20@function.outer\a[c\17@class.outer\20goto_next_start\1\0\2\a]c\17@class.outer\a]f\20@function.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\6\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\aaa\21@parameter.outer\aac\17@class.outer\aif\20@function.inner\1\0\1\venable\2\1\0\0\vindent\fautotag\1\0\1\venable\2\fmatchup\1\0\1\venable\2\rrefactor\26highlight_definitions\1\0\1\venable\2\17smart_rename\1\0\0\fkeymaps\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\1\0\2&additional_vim_regex_highlighting\2\21use_languagetree\2\venable\1\0\0\14highlight\15playground\16keybindings\1\0\n\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\vupdate\6R\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\fdisable\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\20nvim-ts-autotag\15Treesitter\vconfig\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: feline.nvim
time("Config for feline.nvim", true)
try_loadstring("\27LJ\2\nÍ\1\0\0\6\2\v\0\0206\0\0\0B\0\1\0026\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0-\4\0\0=\4\5\3-\4\1\0=\4\6\0039\4\a\0=\4\a\0039\4\b\0=\4\b\0036\4\t\0B\4\1\2=\4\n\3B\1\2\1K\0\1\0\1¿\0¿\15components\19get_components\19vi_mode_colors\vcolors\15separators\15properties\1\0\2\15default_fg\f#909090\15default_bg\f#0F1216\nsetup\vfeline\frequire\15get_colors\0", "config", "feline.nvim")
time("Config for feline.nvim", false)
-- Config for: nvim-dap-ui
time("Config for nvim-dap-ui", true)
try_loadstring("\27LJ\2\nó\4\0\0\5\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\15\0005\4\14\0=\4\f\3=\3\16\0025\3\17\0=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0005\3\23\0B\0\3\0016\0\19\0009\0\20\0009\0\21\0'\2\24\0005\3\25\0B\0\3\1K\0\1\0\1\0\4\vlinehl\5\vtexthl\5\nnumhl\5\ttext\tüõë\15DapStopped\1\0\4\vlinehl\5\vtexthl\22DAPBreakpointSign\nnumhl\5\ttext\b‚ñ†\18DapBreakpoint\16sign_define\afn\bvim\rfloating\1\0\0\ttray\1\0\2\vheight\3\n\rposition\vbottom\1\2\0\0\trepl\fsidebar\relements\1\0\2\rposition\tleft\nwidth\3(\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\rmappings\vexpand\1\0\3\topen\6o\vremove\6d\tedit\6e\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\aŒª\rexpanded\a|>\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time("Config for nvim-dap-ui", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\n≥\a\0\0\6\0)\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\0025\3\23\0=\3\24\0025\3\26\0005\4\25\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0005\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\18\\b(KEYWORDS):\vcolors\fdefault\1\3\0\0\15Identifier\f#7C6AED\thint\1\3\0\0\30LspDiagnosticsDefaultHint\f#10B981\tinfo\1\3\0\0%LspDiagnosticsDefaultInformation\f#2593FB\fwarning\1\4\0\0!LspDiagnosticsDefaultWarning\15WarningMsg\f#CBAF24\nerror\1\0\0\1\4\0\0\31LspDiagnosticsDefaultError\rErrorMsg\f#DC2626\14highlight\1\0\5\fpattern\22.*<(KEYWORDS)\\s*:\18comments_only\2\nafter\afg\fkeyword\afg\vbefore\5\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\bÔ°ß\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\bÔôë\tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\bÔÅ±\tHACK\1\0\2\ticon\bÔíê\ncolor\fwarning\tTODO\1\0\2\ticon\bÔÄå\ncolor\tinfo\bFIX\1\0\0\balt\1\6\0\0\nFIXME\bBUG\nFIXIT\bFIX\nISSUE\1\0\2\ncolor\nerror\ticon\t ÔÜà\1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: vim-hexokinase
time("Config for vim-hexokinase", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-hexokinase")
time("Config for vim-hexokinase", false)
-- Config for: vimwiki
time("Config for vimwiki", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "vimwiki")
time("Config for vimwiki", false)
-- Config for: asynctasks.vim
time("Config for asynctasks.vim", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "asynctasks.vim")
time("Config for asynctasks.vim", false)
-- Config for: vim-mundo
time("Config for vim-mundo", true)
try_loadstring("\27LJ\2\n\30\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\15set_config\0", "config", "vim-mundo")
time("Config for vim-mundo", false)
-- Config for: vim-sayonara
time("Config for vim-sayonara", true)
try_loadstring("\27LJ\2\n\31\0\0\2\0\1\0\0036\0\0\0B\0\1\1K\0\1\0\16set_mapping\0", "config", "vim-sayonara")
time("Config for vim-sayonara", false)
-- Config for: nvim-web-devicons
time("Config for nvim-web-devicons", true)
try_loadstring("\27LJ\2\nE\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1¿\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time("Config for nvim-web-devicons", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n√\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\nsigns\19signs_config_1\1\0\5\20update_debounce\3»\1\nnumhl\1\18sign_priority\3\6\vlinehl\1\23use_decoration_api\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: diffview.nvim
time("Config for diffview.nvim", true)
try_loadstring("\27LJ\2\nÜ\5\0\0\t\0!\0Q6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\17\0005\5\t\0\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\29\0B\6\2\2=\6\30\5\18\6\0\0'\b\b\0B\6\2\2=\6\n\5\18\6\0\0'\b\v\0B\6\2\2=\6\f\5\18\6\0\0'\b\r\0B\6\2\2=\6\14\5\18\6\0\0'\b\15\0B\6\2\2=\6\16\5=\5\a\4=\4\31\3B\1\2\0016\1 \0B\1\1\1K\0\1\0\15set_config\17key_bindings\6R\18refresh_files\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\1\0\0\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\15file_panel\1\0\2\14use_icons\2\nwidth\3(\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time("Config for diffview.nvim", false)
-- Config for: nvim-reload
time("Config for nvim-reload", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21reset_highlights\vfeline\frequireE\1\0\3\0\4\0\0066\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0K\0\1\0\0\21post_reload_hook\16nvim-reload\frequire\0", "config", "nvim-reload")
time("Config for nvim-reload", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\2\0\2\0\0056\0\0\0B\0\1\0016\0\1\0B\0\1\1K\0\1\0\16set_mapping\15set_config\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "BufEnter *" }, _G.packer_plugins)]]
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
