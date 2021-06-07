local plugin = {}

plugin.load = function()
  vim.g.clap_theme = "material_design_dark"
  -- Providers
  -- Command	List	Requirement
  -- Clap bcommits	Git commits for the current buffer	git
  -- Clap blines	Lines in the current buffer	none
  -- Clap buffers	Open buffers	none
  -- Clap colors	Colorschemes	none
  -- Clap command	Command	none
  -- Clap hist: or Clap command_history	Command history	none
  -- Clap hist/ or Clap search_history	Search history	none
  -- Clap commits	Git commits	git
  -- Clap files	Files	fd/git/rg/find
  -- Clap filetypes	File types	none
  -- Clap gfiles or Clap git_files	Files managed by git	git
  -- Clap git_diff_files	Files managed by git and having uncommitted changes	git
  -- Clap grep+	Grep on the fly	rg
  -- Clap grep2+	Grep on the fly with cache and dynamic results	maple
  -- Clap history	Open buffers and v:oldfiles	none
  -- Clap help_tags	Help tags	none
  -- Clap jumps	Jumps	none
  -- Clap lines	Lines in the loaded buffers	none
  -- Clap marks	Marks	none
  -- Clap maps	Maps	none
  -- Clap quickfix	Entries of the quickfix list	none
  -- Clap loclist	Entries of the location list	none
  -- Clap registers	Registers	none
  -- Clap tags	Tags in the current buffer	vista.vim
  -- Clap proj_tags	Tags in the current project	maple and universal-ctags with JSON output support
  -- Clap yanks	Yank stack of the current vim session	none
  -- Clap filer	Ivy-like file explorer	maple
  -- Clap dumb_jump	Definitions/References using regexp with grep fallback	rg with --pcre2
  -- Clap providers	List the vim-clap providers	none
  -- Clap windows	Windows	none
  -- g:clap_layout: Dict, { 'width': '67%', 'height': '33%', 'row': '33%', 'col': '17%' } by default. This variable controls the size and position of vim-clap window. By default, the vim-clap window is placed relative to the currently active window. To make it relative to the whole editor modify this variable as shown below:
  -- let g:clap_layout = { 'relative': 'editor' }
  -- g:clap_open_action: Dict, { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }, extra key bindings for opening the selected file in a different way. NOTE: do not define a key binding which is conflicted with the other default bindings of vim-clap, and only ctrl-* is supported for now.
  -- g:clap_provider_alias: Dict, if you don't want to invoke some clap provider by its id(name), as it's too long or somehow, you can add an alias for that provider.
  -- " The provider name is `command_history`, with the following alias config,
  -- " now you can call it via both `:Clap command_history` and `:Clap hist:`.
  -- let g:clap_provider_alias = {'hist:': 'command_history'}
  -- g:clap_selected_sign: Dict, { 'text': ' >', 'texthl': "ClapSelectedSign", "linehl": "ClapSelected"}.
  -- g:clap_current_selection_sign: Dict, { 'text': '>>', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}.
  -- g:clap_no_matches_msg: String, 'NO MATCHES FOUND', message to show when there is no matches found.
  -- g:clap_popup_input_delay: Number, 200ms by default, delay for actually responsing to the input, vim only.
  -- g:clap_disable_run_rooter: Bool, v:false, vim-clap by default will try to run from the project root by changing cwd temporarily. Set it to v:true to run from the origin cwd. The project root here means the git base directory. Create an issue if you want to see more support about the project root.
  -- The option naming convention for provider is g:clap_provider_{provider_id}_{opt}.
  -- g:clap_provider_grep_delay: 300ms by default, delay for actually spawning the grep job in the background.
  -- g:clap_provider_grep_blink: [2, 100] by default, blink 2 times with 100ms timeout when jumping the result. Set it to [0, 0] to disable the blink.
  -- g:clap_provider_grep_opts: An empty string by default, allows you to enable flags such as '--hidden -g "!.git/"'

  -- highlights

  -- let s:palette = {}
  -- let s:palette.display = { 'ctermbg': '235', 'guibg': '#272d3D' }
  -- " Let ClapInput, ClapSpinner and ClapSearchText use the same background.
  -- let s:bg0 = { 'ctermbg': '60', 'guibg': '#3e4461' }
  -- let s:palette.input = s:bg0
  -- let s:palette.indicator = extend({ 'ctermfg': '238', 'guifg':'#676b83' }, s:bg0)
  -- let s:palette.spinner = extend({ 'ctermfg': '11', 'guifg':'#ffe500', 'cterm': 'bold', 'gui': 'bold'}, s:bg0)
  -- let s:palette.search_text = extend({ 'ctermfg': '195', 'guifg': '#CADFF3', 'cterm': 'bold', 'gui': 'bold' }, s:bg0)
  -- let s:palette.preview = { 'ctermbg': '238', 'guibg': '#363c55' }
  -- let s:palette.selected = { 'ctermfg': '81', 'guifg': '#5FD7d7', 'cterm': 'bold,underline', 'gui': 'bold,underline' }
  -- let s:palette.current_selection = { 'ctermbg': '236', 'guibg': '#31364D', 'cterm': 'bold', 'gui': 'bold' }
  -- let s:palette.selected_sign = { 'ctermfg': '196', 'guifg': '#f2241f' }
  -- let s:palette.current_selection_sign = s:palette.selected_sign
  -- let g:clap#themes#material_design_dark#palette = s:palette
end

function plugin.setup(use)
  use {
    "liuchengxu/vim-clap",
    run = ":Clap install-binary"
  }
  plugin.load()
end

return plugin
