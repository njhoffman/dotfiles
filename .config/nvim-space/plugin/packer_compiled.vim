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
local package_path_str = "/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nicholas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["Brewfile.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/Brewfile.vim"
  },
  ["Dockerfile.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim"
  },
  ["Dusk-til-Dawn.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/Dusk-til-Dawn.nvim"
  },
  ["Jenkinsfile-vim-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/Jenkinsfile-vim-syntax"
  },
  ["Nvim-R"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/Nvim-R"
  },
  ["XSLT-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/XSLT-syntax"
  },
  ["ansible-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/ansible-vim"
  },
  ["apiblueprint.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/apiblueprint.vim"
  },
  ["bats.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/bats.vim"
  },
  ["bracey.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/bracey.vim"
  },
  ["carp-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/carp-vim"
  },
  ["committia.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/committia.vim"
  },
  ["completion-buffers"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/completion-buffers"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  conjure = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/conjure"
  },
  ["cql-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/cql-vim"
  },
  ["cryptol.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/cryptol.vim"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["d.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/d.vim"
  },
  ["dart-vim-plugin"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  delimitMate = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/delimitMate"
  },
  ["dhall-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/dhall-vim"
  },
  ["fennel.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/fennel.vim"
  },
  ["ferm.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/ferm.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.statusline\frequire\0" },
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gina.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/gina.vim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gleam.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/gleam.vim"
  },
  ["gmpl.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/gmpl.vim"
  },
  ["gnuplot-syntax-highlighting"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/gnuplot-syntax-highlighting"
  },
  ["haproxy.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/haproxy.vim"
  },
  ["haskell-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/haskell-vim"
  },
  ["hive.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/hive.vim"
  },
  ["html5.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/html5.vim"
  },
  ["i3config.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/i3config.vim"
  },
  ["icalendar.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/icalendar.vim"
  },
  ["idris-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/idris-vim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["info.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/info.vim"
  },
  ["ion-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/ion-vim"
  },
  ["json5.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/json5.vim"
  },
  ["julia-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/julia-vim"
  },
  ["kotlin-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/kotlin-vim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["mercury-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/mercury-vim"
  },
  ["moonscript-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/moonscript-vim"
  },
  mpvim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/mpvim"
  },
  ["nginx.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nginx.vim"
  },
  ["nim.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nim.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFindFile" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["omnisharp-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/omnisharp-vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/parinfer-rust"
  },
  ["pgsql.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/pgsql.vim"
  },
  ["php.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/php.vim"
  },
  ["plantuml-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/plantuml-syntax"
  },
  ["prolog.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/prolog.vim"
  },
  ["purescript-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/purescript-vim"
  },
  ["qmake-syntax-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/qmake-syntax-vim"
  },
  ["ragel.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/ragel.vim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/rainbow_parentheses.vim"
  },
  ["ron.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/ron.vim"
  },
  ["rspec.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/rspec.vim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["scss-syntax.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/scss-syntax.vim"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/space-nvim"
  },
  ["starlark.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/starlark.vim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["surround.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/surround.nvim"
  },
  ["svg.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/svg.vim"
  },
  ["swift.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/swift.vim"
  },
  ["textile.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/textile.vim"
  },
  ["thrift.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/thrift.vim"
  },
  ["tomdoc.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/tomdoc.vim"
  },
  ["v-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/v-vim"
  },
  ["vala.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vala.vim"
  },
  ["vbnet.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vbnet.vim"
  },
  ["vcl-vim-plugin"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vcl-vim-plugin"
  },
  ["vifm.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vifm.vim"
  },
  ["vim-acpi-asl"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-acpi-asl"
  },
  ["vim-applescript"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-applescript"
  },
  ["vim-arduino-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-arduino-syntax"
  },
  ["vim-asciidoc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-asciidoc"
  },
  ["vim-bazel"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-bazel"
  },
  ["vim-better-sml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-better-sml"
  },
  ["vim-blade"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-blade"
  },
  ["vim-bundle-mako"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-bundle-mako"
  },
  ["vim-caddyfile"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-caddyfile"
  },
  ["vim-cargo-make"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cargo-make"
  },
  ["vim-chef"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-chef"
  },
  ["vim-cjsx"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cjsx"
  },
  ["vim-clojure-highlight"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-clojure-highlight"
  },
  ["vim-clojure-static"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-clojure-static"
  },
  ["vim-closetag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-closetag"
  },
  ["vim-cmake"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cmake"
  },
  ["vim-cmake-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cmake-syntax"
  },
  ["vim-coffee-script"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-coffee-script"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-crates"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-crates"
  },
  ["vim-crystal"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-crystal"
  },
  ["vim-csharp"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-csharp"
  },
  ["vim-cucumber"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cucumber"
  },
  ["vim-cuesheet"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-cuesheet"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-ditto"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ditto"
  },
  ["vim-dotenv"] = {
    commands = { "Dotenv" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-dotenv"
  },
  ["vim-duckscript"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-duckscript"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-emblem"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-emblem"
  },
  ["vim-erlang-runtime"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-erlang-runtime"
  },
  ["vim-eunuch"] = {
    commands = { "Delete", "Unlink", "Move", "Rename", "Chmod", "Mkdir", "Cfind", "Clocate", "Lfind", "Llocate", "Wall", "SudoWrite", "SudoEdit" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-eunuch"
  },
  ["vim-fireplace"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-fireplace"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-flatbuffers"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-flatbuffers"
  },
  ["vim-fountain"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-fountain"
  },
  ["vim-gdscript3"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-gdscript3"
  },
  ["vim-gfm-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-gfm-syntax"
  },
  ["vim-git"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-git"
  },
  ["vim-glsl"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-glsl"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-gradle"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-gradle"
  },
  ["vim-hack"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-hack"
  },
  ["vim-haml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-haml"
  },
  ["vim-haxe"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-haxe"
  },
  ["vim-hcl"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-hcl"
  },
  ["vim-hdl"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-hdl"
  },
  ["vim-helm"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-ispc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ispc"
  },
  ["vim-jinja"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-jinja"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-json"
  },
  ["vim-jst"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-jst"
  },
  ["vim-latex-live-preview"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-latex-live-preview"
  },
  ["vim-ledger"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ledger"
  },
  ["vim-less"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-less"
  },
  ["vim-lexical"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-lexical"
  },
  ["vim-lilypond"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-lilypond"
  },
  ["vim-log-highlighting"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting"
  },
  ["vim-loves-dafny"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-loves-dafny"
  },
  ["vim-ls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ls"
  },
  ["vim-maktaba"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-maktaba"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-markdown-composer"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-markdown-composer"
  },
  ["vim-matlab"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-matlab"
  },
  ["vim-mdx-js"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-mdx-js"
  },
  ["vim-mma"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-mma"
  },
  ["vim-mustache-handlebars"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-mustache-handlebars"
  },
  ["vim-nix"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-nix"
  },
  ["vim-objc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-objc"
  },
  ["vim-ocaml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ocaml"
  },
  ["vim-octave"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-octave"
  },
  ["vim-pandoc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax"
  },
  ["vim-pawn"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pawn"
  },
  ["vim-pencil"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pencil"
  },
  ["vim-perl"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-perl"
  },
  ["vim-pony"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pony"
  },
  ["vim-protobuf"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-protobuf"
  },
  ["vim-ps1"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ps1"
  },
  ["vim-pug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-pug"
  },
  ["vim-puppet"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-puppet"
  },
  ["vim-qml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-qml"
  },
  ["vim-racket"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-racket"
  },
  ["vim-raku"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-raku"
  },
  ["vim-raml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-raml"
  },
  ["vim-razor"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-razor"
  },
  ["vim-reason-plus"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-reason-plus"
  },
  ["vim-restructuredtext"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-restructuredtext"
  },
  ["vim-ruby"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-ruby"
  },
  ["vim-sbt"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-sbt"
  },
  ["vim-scala"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-scala"
  },
  ["vim-sh"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-sh"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\nÅ\1\0\0\2\0\t\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\5\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\bï‘™\24signify_sign_change#signify_sign_delete_first_line\bï‘˜\24signify_sign_delete\bï‘—\21signify_sign_add\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-signify"
  },
  ["vim-slim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-slim"
  },
  ["vim-slime-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-slime-syntax"
  },
  ["vim-smt2"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-smt2"
  },
  ["vim-solidity"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-solidity"
  },
  ["vim-stylus"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-stylus"
  },
  ["vim-sugarss"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-sugarss"
  },
  ["vim-svelte-plugin"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-svelte-plugin"
  },
  ["vim-svg-indent"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-svg-indent"
  },
  ["vim-sxhkdrc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-sxhkdrc"
  },
  ["vim-systemd-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-systemd-syntax"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-terraform"
  },
  ["vim-tptp"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-tptp"
  },
  ["vim-twig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-twig"
  },
  ["vim-velocity"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-velocity"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-vue"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-vue"
  },
  ["vim-which-key"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-which-key"
  },
  ["vim-wordy"] = {
    commands = { "PrevWordy", "Wordy", "NextWordy" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-wordy"
  },
  ["vim-xdc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-xdc-syntax"
  },
  ["vim-xml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-xml"
  },
  ["vim-yaml"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-yaml"
  },
  ["vim-yardoc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-yardoc"
  },
  ["vim-zephir"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-zephir"
  },
  ["vim-zsh"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vim-zsh"
  },
  vimtex = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["yang.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/yang.vim"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/zig.vim"
  },
  ["zinit-vim-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nicholas/.local/share/nvim/site/pack/packer/opt/zinit-vim-syntax"
  }
}

-- Setup for: Dusk-til-Dawn.nvim
try_loadstring("\27LJ\2\n¹\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\a\0=\1\5\0006\0\0\0009\0\1\0)\1\19\0=\1\6\0K\0\1\0\24dusk_til_dawn_night\26dusk_til_dawn_morning\29dusk_til_dawn_dark_theme\15space-nvim\30dusk_til_dawn_light_theme\6g\bvim\0", "setup", "Dusk-til-Dawn.nvim")
-- Config for: completion-nvim
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0", "config", "completion-nvim")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.statusline\frequire\0", "config", "galaxyline.nvim")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Cfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Cfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lfind lua require("packer.load")({'vim-eunuch'}, { cmd = "Lfind", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Llocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Llocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Wall lua require("packer.load")({'vim-eunuch'}, { cmd = "Wall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NextWordy lua require("packer.load")({'vim-wordy'}, { cmd = "NextWordy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Wordy lua require("packer.load")({'vim-wordy'}, { cmd = "Wordy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file PrevWordy lua require("packer.load")({'vim-wordy'}, { cmd = "PrevWordy", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dotenv lua require("packer.load")({'vim-dotenv'}, { cmd = "Dotenv", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType git ++once lua require("packer.load")({'vim-git'}, { ft = "git" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'vim-git'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitconfig ++once lua require("packer.load")({'vim-git'}, { ft = "gitconfig" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitrebase ++once lua require("packer.load")({'vim-git'}, { ft = "gitrebase" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitsendemail ++once lua require("packer.load")({'vim-git'}, { ft = "gitsendemail" }, _G.packer_plugins)]]
vim.cmd [[au FileType thrift ++once lua require("packer.load")({'thrift.vim'}, { ft = "thrift" }, _G.packer_plugins)]]
vim.cmd [[au FileType glsl ++once lua require("packer.load")({'vim-glsl'}, { ft = "glsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType tomdoc ++once lua require("packer.load")({'tomdoc.vim'}, { ft = "tomdoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType gleam ++once lua require("packer.load")({'gleam.vim'}, { ft = "gleam" }, _G.packer_plugins)]]
vim.cmd [[au FileType tptp ++once lua require("packer.load")({'vim-tptp'}, { ft = "tptp" }, _G.packer_plugins)]]
vim.cmd [[au FileType gmpl ++once lua require("packer.load")({'gmpl.vim'}, { ft = "gmpl" }, _G.packer_plugins)]]
vim.cmd [[au FileType twig ++once lua require("packer.load")({'vim-twig'}, { ft = "twig" }, _G.packer_plugins)]]
vim.cmd [[au FileType gnuplot ++once lua require("packer.load")({'gnuplot-syntax-highlighting'}, { ft = "gnuplot" }, _G.packer_plugins)]]
vim.cmd [[au FileType vlang ++once lua require("packer.load")({'v-vim'}, { ft = "vlang" }, _G.packer_plugins)]]
vim.cmd [[au FileType vala ++once lua require("packer.load")({'vala.vim'}, { ft = "vala" }, _G.packer_plugins)]]
vim.cmd [[au FileType vb.net ++once lua require("packer.load")({'vbnet.vim'}, { ft = "vb.net" }, _G.packer_plugins)]]
vim.cmd [[au FileType hack ++once lua require("packer.load")({'vim-hack'}, { ft = "hack" }, _G.packer_plugins)]]
vim.cmd [[au FileType haml ++once lua require("packer.load")({'vim-haml'}, { ft = "haml" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'vim-haml'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType vifm ++once lua require("packer.load")({'vifm.vim'}, { ft = "vifm" }, _G.packer_plugins)]]
vim.cmd [[au FileType handlebars ++once lua require("packer.load")({'vim-mustache-handlebars'}, { ft = "handlebars" }, _G.packer_plugins)]]
vim.cmd [[au FileType mustache ++once lua require("packer.load")({'vim-mustache-handlebars'}, { ft = "mustache" }, _G.packer_plugins)]]
vim.cmd [[au FileType vhdl ++once lua require("packer.load")({'vim-hdl'}, { ft = "vhdl" }, _G.packer_plugins)]]
vim.cmd [[au FileType haproxy ++once lua require("packer.load")({'haproxy.vim'}, { ft = "haproxy" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-vue'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'haskell-vim'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType xdc ++once lua require("packer.load")({'vim-xdc-syntax'}, { ft = "xdc" }, _G.packer_plugins)]]
vim.cmd [[au FileType haxe ++once lua require("packer.load")({'vim-haxe'}, { ft = "haxe" }, _G.packer_plugins)]]
vim.cmd [[au FileType xsl ++once lua require("packer.load")({'XSLT-syntax'}, { ft = "xsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType hcl ++once lua require("packer.load")({'vim-hcl'}, { ft = "hcl" }, _G.packer_plugins)]]
vim.cmd [[au FileType helm ++once lua require("packer.load")({'vim-helm'}, { ft = "helm" }, _G.packer_plugins)]]
vim.cmd [[au FileType hive ++once lua require("packer.load")({'hive.vim'}, { ft = "hive" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'html5.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType zephir ++once lua require("packer.load")({'vim-zephir'}, { ft = "zephir" }, _G.packer_plugins)]]
vim.cmd [[au FileType i3config ++once lua require("packer.load")({'i3config.vim'}, { ft = "i3config" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType icalendar ++once lua require("packer.load")({'icalendar.vim'}, { ft = "icalendar" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'zinit-vim-syntax', 'vim-zsh'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType idris ++once lua require("packer.load")({'idris-vim'}, { ft = "idris" }, _G.packer_plugins)]]
vim.cmd [[au FileType info ++once lua require("packer.load")({'info.vim'}, { ft = "info" }, _G.packer_plugins)]]
vim.cmd [[au FileType ion ++once lua require("packer.load")({'ion-vim'}, { ft = "ion" }, _G.packer_plugins)]]
vim.cmd [[au FileType ispc ++once lua require("packer.load")({'vim-ispc'}, { ft = "ispc" }, _G.packer_plugins)]]
vim.cmd [[au FileType jst ++once lua require("packer.load")({'vim-jst'}, { ft = "jst" }, _G.packer_plugins)]]
vim.cmd [[au FileType jenkins ++once lua require("packer.load")({'Jenkinsfile-vim-syntax'}, { ft = "jenkins" }, _G.packer_plugins)]]
vim.cmd [[au FileType jinja ++once lua require("packer.load")({'vim-jinja'}, { ft = "jinja" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType json5 ++once lua require("packer.load")({'json5.vim'}, { ft = "json5" }, _G.packer_plugins)]]
vim.cmd [[au FileType julia ++once lua require("packer.load")({'julia-vim'}, { ft = "julia" }, _G.packer_plugins)]]
vim.cmd [[au FileType kotlin ++once lua require("packer.load")({'kotlin-vim'}, { ft = "kotlin" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex-live-preview', 'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType bib ++once lua require("packer.load")({'vimtex'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType ledger ++once lua require("packer.load")({'vim-ledger'}, { ft = "ledger" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'vim-less'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType lilypond ++once lua require("packer.load")({'vim-lilypond'}, { ft = "lilypond" }, _G.packer_plugins)]]
vim.cmd [[au FileType ls ++once lua require("packer.load")({'vim-ls'}, { ft = "ls" }, _G.packer_plugins)]]
vim.cmd [[au FileType portfile ++once lua require("packer.load")({'mpvim'}, { ft = "portfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType mako ++once lua require("packer.load")({'vim-bundle-mako'}, { ft = "mako" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType mma ++once lua require("packer.load")({'vim-mma'}, { ft = "mma" }, _G.packer_plugins)]]
vim.cmd [[au FileType matlab ++once lua require("packer.load")({'vim-matlab'}, { ft = "matlab" }, _G.packer_plugins)]]
vim.cmd [[au FileType mdx ++once lua require("packer.load")({'vim-mdx-js'}, { ft = "mdx" }, _G.packer_plugins)]]
vim.cmd [[au FileType mercury ++once lua require("packer.load")({'mercury-vim'}, { ft = "mercury" }, _G.packer_plugins)]]
vim.cmd [[au FileType moon ++once lua require("packer.load")({'moonscript-vim'}, { ft = "moon" }, _G.packer_plugins)]]
vim.cmd [[au FileType nginx ++once lua require("packer.load")({'nginx.vim'}, { ft = "nginx" }, _G.packer_plugins)]]
vim.cmd [[au FileType nim ++once lua require("packer.load")({'nim.vim'}, { ft = "nim" }, _G.packer_plugins)]]
vim.cmd [[au FileType apiblueprint ++once lua require("packer.load")({'apiblueprint.vim'}, { ft = "apiblueprint" }, _G.packer_plugins)]]
vim.cmd [[au FileType objc ++once lua require("packer.load")({'vim-objc'}, { ft = "objc" }, _G.packer_plugins)]]
vim.cmd [[au FileType arduino ++once lua require("packer.load")({'vim-arduino-syntax'}, { ft = "arduino" }, _G.packer_plugins)]]
vim.cmd [[au FileType oasis ++once lua require("packer.load")({'vim-ocaml'}, { ft = "oasis" }, _G.packer_plugins)]]
vim.cmd [[au FileType ocaml ++once lua require("packer.load")({'vim-ocaml'}, { ft = "ocaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType ocamlbuild_tags ++once lua require("packer.load")({'vim-ocaml'}, { ft = "ocamlbuild_tags" }, _G.packer_plugins)]]
vim.cmd [[au FileType omake ++once lua require("packer.load")({'vim-ocaml'}, { ft = "omake" }, _G.packer_plugins)]]
vim.cmd [[au FileType sexplib ++once lua require("packer.load")({'vim-ocaml'}, { ft = "sexplib" }, _G.packer_plugins)]]
vim.cmd [[au FileType bzl ++once lua require("packer.load")({'vim-bazel', 'vim-maktaba'}, { ft = "bzl" }, _G.packer_plugins)]]
vim.cmd [[au FileType octave ++once lua require("packer.load")({'vim-octave'}, { ft = "octave" }, _G.packer_plugins)]]
vim.cmd [[au FileType blade ++once lua require("packer.load")({'vim-blade'}, { ft = "blade" }, _G.packer_plugins)]]
vim.cmd [[au FileType brewfile ++once lua require("packer.load")({'Brewfile.vim'}, { ft = "brewfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType cs ++once lua require("packer.load")({'omnisharp-vim', 'vim-csharp'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'vim-csharp', 'vim-xml'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType cshtml.html ++once lua require("packer.load")({'vim-csharp'}, { ft = "cshtml.html" }, _G.packer_plugins)]]
vim.cmd [[au FileType aspx.html ++once lua require("packer.load")({'vim-csharp'}, { ft = "aspx.html" }, _G.packer_plugins)]]
vim.cmd [[au FileType pgsql ++once lua require("packer.load")({'pgsql.vim'}, { ft = "pgsql" }, _G.packer_plugins)]]
vim.cmd [[au FileType omnisharplog ++once lua require("packer.load")({'omnisharp-vim'}, { ft = "omnisharplog" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'php.vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType caddyfile ++once lua require("packer.load")({'vim-caddyfile'}, { ft = "caddyfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType plantuml ++once lua require("packer.load")({'plantuml-syntax'}, { ft = "plantuml" }, _G.packer_plugins)]]
vim.cmd [[au FileType cargo-make ++once lua require("packer.load")({'vim-duckscript', 'vim-cargo-make'}, { ft = "cargo-make" }, _G.packer_plugins)]]
vim.cmd [[au FileType pony ++once lua require("packer.load")({'vim-pony'}, { ft = "pony" }, _G.packer_plugins)]]
vim.cmd [[au FileType ps1 ++once lua require("packer.load")({'vim-ps1'}, { ft = "ps1" }, _G.packer_plugins)]]
vim.cmd [[au FileType ps1xml ++once lua require("packer.load")({'vim-ps1'}, { ft = "ps1xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType prolog ++once lua require("packer.load")({'prolog.vim'}, { ft = "prolog" }, _G.packer_plugins)]]
vim.cmd [[au FileType pug ++once lua require("packer.load")({'vim-pug'}, { ft = "pug" }, _G.packer_plugins)]]
vim.cmd [[au FileType puppet ++once lua require("packer.load")({'vim-puppet'}, { ft = "puppet" }, _G.packer_plugins)]]
vim.cmd [[au FileType embeddedpuppet ++once lua require("packer.load")({'vim-puppet'}, { ft = "embeddedpuppet" }, _G.packer_plugins)]]
vim.cmd [[au FileType purescript ++once lua require("packer.load")({'purescript-vim'}, { ft = "purescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType qmake ++once lua require("packer.load")({'qmake-syntax-vim'}, { ft = "qmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType qml ++once lua require("packer.load")({'vim-qml'}, { ft = "qml" }, _G.packer_plugins)]]
vim.cmd [[au FileType r ++once lua require("packer.load")({'Nvim-R'}, { ft = "r" }, _G.packer_plugins)]]
vim.cmd [[au FileType carp ++once lua require("packer.load")({'carp-vim'}, { ft = "carp" }, _G.packer_plugins)]]
vim.cmd [[au FileType chef ++once lua require("packer.load")({'vim-chef'}, { ft = "chef" }, _G.packer_plugins)]]
vim.cmd [[au FileType raml ++once lua require("packer.load")({'vim-raml'}, { ft = "raml" }, _G.packer_plugins)]]
vim.cmd [[au FileType razor ++once lua require("packer.load")({'vim-razor'}, { ft = "razor" }, _G.packer_plugins)]]
vim.cmd [[au FileType reason ++once lua require("packer.load")({'vim-reason-plus'}, { ft = "reason" }, _G.packer_plugins)]]
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'fennel.vim', 'parinfer-rust', 'conjure'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType rspec ++once lua require("packer.load")({'rspec.vim'}, { ft = "rspec" }, _G.packer_plugins)]]
vim.cmd [[au FileType ron ++once lua require("packer.load")({'ron.vim'}, { ft = "ron" }, _G.packer_plugins)]]
vim.cmd [[au FileType eruby ++once lua require("packer.load")({'vim-ruby', 'vim-yardoc'}, { ft = "eruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-ruby', 'vim-yardoc'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType log ++once lua require("packer.load")({'vim-log-highlighting'}, { ft = "log" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'vim-scala'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'scss-syntax.vim'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'vim-sh'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType slim ++once lua require("packer.load")({'vim-slim'}, { ft = "slim" }, _G.packer_plugins)]]
vim.cmd [[au FileType slime ++once lua require("packer.load")({'vim-slime-syntax'}, { ft = "slime" }, _G.packer_plugins)]]
vim.cmd [[au FileType sml ++once lua require("packer.load")({'vim-better-sml'}, { ft = "sml" }, _G.packer_plugins)]]
vim.cmd [[au FileType smt2 ++once lua require("packer.load")({'vim-smt2'}, { ft = "smt2" }, _G.packer_plugins)]]
vim.cmd [[au FileType ansible ++once lua require("packer.load")({'ansible-vim'}, { ft = "ansible" }, _G.packer_plugins)]]
vim.cmd [[au FileType solidity ++once lua require("packer.load")({'vim-solidity'}, { ft = "solidity" }, _G.packer_plugins)]]
vim.cmd [[au FileType yang ++once lua require("packer.load")({'yang.vim'}, { ft = "yang" }, _G.packer_plugins)]]
vim.cmd [[au FileType groovy ++once lua require("packer.load")({'vim-gradle'}, { ft = "groovy" }, _G.packer_plugins)]]
vim.cmd [[au FileType asciidoc ++once lua require("packer.load")({'vim-asciidoc'}, { ft = "asciidoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType ragel ++once lua require("packer.load")({'ragel.vim'}, { ft = "ragel" }, _G.packer_plugins)]]
vim.cmd [[au FileType ferm ++once lua require("packer.load")({'ferm.vim'}, { ft = "ferm" }, _G.packer_plugins)]]
vim.cmd [[au FileType sbt ++once lua require("packer.load")({'vim-sbt'}, { ft = "sbt" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'vim-yaml'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType v ++once lua require("packer.load")({'v-vim'}, { ft = "v" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'parinfer-rust'}, { ft = "lisp" }, _G.packer_plugins)]]
vim.cmd [[au FileType scheme ++once lua require("packer.load")({'parinfer-rust'}, { ft = "scheme" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'parinfer-rust', 'vim-racket'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType jbuild ++once lua require("packer.load")({'parinfer-rust'}, { ft = "jbuild" }, _G.packer_plugins)]]
vim.cmd [[au FileType pddl ++once lua require("packer.load")({'parinfer-rust'}, { ft = "pddl" }, _G.packer_plugins)]]
vim.cmd [[au FileType textile ++once lua require("packer.load")({'textile.vim'}, { ft = "textile" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'vim-cmake', 'vim-cmake-syntax'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType proto ++once lua require("packer.load")({'vim-protobuf'}, { ft = "proto" }, _G.packer_plugins)]]
vim.cmd [[au FileType coffee ++once lua require("packer.load")({'vim-coffee-script', 'vim-cjsx'}, { ft = "coffee" }, _G.packer_plugins)]]
vim.cmd [[au FileType systemd ++once lua require("packer.load")({'vim-systemd-syntax'}, { ft = "systemd" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType cql ++once lua require("packer.load")({'cql-vim'}, { ft = "cql" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'vim-nix'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType cryptol ++once lua require("packer.load")({'cryptol.vim'}, { ft = "cryptol" }, _G.packer_plugins)]]
vim.cmd [[au FileType dune ++once lua require("packer.load")({'vim-ocaml'}, { ft = "dune" }, _G.packer_plugins)]]
vim.cmd [[au FileType crystal ++once lua require("packer.load")({'vim-crystal'}, { ft = "crystal" }, _G.packer_plugins)]]
vim.cmd [[au FileType asl ++once lua require("packer.load")({'vim-acpi-asl'}, { ft = "asl" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType perl6 ++once lua require("packer.load")({'vim-perl'}, { ft = "perl6" }, _G.packer_plugins)]]
vim.cmd [[au FileType cucumber ++once lua require("packer.load")({'vim-cucumber'}, { ft = "cucumber" }, _G.packer_plugins)]]
vim.cmd [[au FileType perl ++once lua require("packer.load")({'vim-perl'}, { ft = "perl" }, _G.packer_plugins)]]
vim.cmd [[au FileType cue ++once lua require("packer.load")({'vim-cuesheet'}, { ft = "cue" }, _G.packer_plugins)]]
vim.cmd [[au FileType terraform ++once lua require("packer.load")({'vim-terraform'}, { ft = "terraform" }, _G.packer_plugins)]]
vim.cmd [[au FileType d ++once lua require("packer.load")({'d.vim'}, { ft = "d" }, _G.packer_plugins)]]
vim.cmd [[au FileType dcov ++once lua require("packer.load")({'d.vim'}, { ft = "dcov" }, _G.packer_plugins)]]
vim.cmd [[au FileType dd ++once lua require("packer.load")({'d.vim'}, { ft = "dd" }, _G.packer_plugins)]]
vim.cmd [[au FileType ddoc ++once lua require("packer.load")({'d.vim'}, { ft = "ddoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType dsdl ++once lua require("packer.load")({'d.vim'}, { ft = "dsdl" }, _G.packer_plugins)]]
vim.cmd [[au FileType raku ++once lua require("packer.load")({'vim-raku'}, { ft = "raku" }, _G.packer_plugins)]]
vim.cmd [[au FileType dafny ++once lua require("packer.load")({'vim-loves-dafny'}, { ft = "dafny" }, _G.packer_plugins)]]
vim.cmd [[au FileType pawn ++once lua require("packer.load")({'vim-pawn'}, { ft = "pawn" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'dart-vim-plugin'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType velocity ++once lua require("packer.load")({'vim-velocity'}, { ft = "velocity" }, _G.packer_plugins)]]
vim.cmd [[au FileType dhall ++once lua require("packer.load")({'dhall-vim'}, { ft = "dhall" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'parinfer-rust', 'vim-clojure-static', 'vim-fireplace', 'vim-clojure-highlight', 'conjure'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml.docker-compose ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "yaml.docker-compose" }, _G.packer_plugins)]]
vim.cmd [[au FileType dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType rst ++once lua require("packer.load")({'vim-restructuredtext'}, { ft = "rst" }, _G.packer_plugins)]]
vim.cmd [[au FileType duckscript ++once lua require("packer.load")({'vim-duckscript'}, { ft = "duckscript" }, _G.packer_plugins)]]
vim.cmd [[au FileType vifm-rename ++once lua require("packer.load")({'vifm.vim'}, { ft = "vifm-rename" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType fbs ++once lua require("packer.load")({'vim-flatbuffers'}, { ft = "fbs" }, _G.packer_plugins)]]
vim.cmd [[au FileType emblem ++once lua require("packer.load")({'vim-emblem'}, { ft = "emblem" }, _G.packer_plugins)]]
vim.cmd [[au FileType starlark ++once lua require("packer.load")({'starlark.vim'}, { ft = "starlark" }, _G.packer_plugins)]]
vim.cmd [[au FileType erlang ++once lua require("packer.load")({'vim-erlang-runtime'}, { ft = "erlang" }, _G.packer_plugins)]]
vim.cmd [[au FileType sugarss ++once lua require("packer.load")({'vim-sugarss'}, { ft = "sugarss" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc ++once lua require("packer.load")({'vim-pandoc-syntax', 'vim-pandoc'}, { ft = "pandoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType stylus ++once lua require("packer.load")({'vim-stylus'}, { ft = "stylus" }, _G.packer_plugins)]]
vim.cmd [[au FileType bats ++once lua require("packer.load")({'bats.vim'}, { ft = "bats" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'vim-svelte-plugin'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType applescript ++once lua require("packer.load")({'vim-applescript'}, { ft = "applescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType svg ++once lua require("packer.load")({'svg.vim', 'vim-svg-indent'}, { ft = "svg" }, _G.packer_plugins)]]
vim.cmd [[au FileType vcl ++once lua require("packer.load")({'vcl-vim-plugin'}, { ft = "vcl" }, _G.packer_plugins)]]
vim.cmd [[au FileType fountain ++once lua require("packer.load")({'vim-fountain'}, { ft = "fountain" }, _G.packer_plugins)]]
vim.cmd [[au FileType swift ++once lua require("packer.load")({'swift.vim'}, { ft = "swift" }, _G.packer_plugins)]]
vim.cmd [[au FileType gdscript3 ++once lua require("packer.load")({'vim-gdscript3'}, { ft = "gdscript3" }, _G.packer_plugins)]]
vim.cmd [[au FileType gsl ++once lua require("packer.load")({'vim-gdscript3'}, { ft = "gsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType gd ++once lua require("packer.load")({'vim-gdscript3'}, { ft = "gd" }, _G.packer_plugins)]]
vim.cmd [[au FileType sxhkdrc ++once lua require("packer.load")({'vim-sxhkdrc'}, { ft = "sxhkdrc" }, _G.packer_plugins)]]
  -- Event lazy-loads
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'delimitMate', 'rainbow_parentheses.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
