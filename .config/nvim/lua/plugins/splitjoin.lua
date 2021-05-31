local plugin = {}

function set_config()
  vim.g.splitjoin_align = 1
  vim.g.splitjoin_curly_brace_padding = 1
end

function plugin.load()
  set_config()
end

function plugin.setup(use)
  use {"andrewradev/splitjoin.vim", config = plugin.load}
end

return plugin

-- let g:splitjoin_split_mapping* = gS
-- let g:splitjoin_join_mapping* = gJ
-- let g:splitjoin_quiet = 1
-- let g:splitjoin_disabled_split_callbacks = []
-- let g:splitjoin_disabled_split_callbacks = ['sj#html#SplitAttributes']
-- let g:splitjoin_normalize_whitespace = 0
-- let g:splitjoin_curly_brace_padding = 0
-- let g:splitjoin_trailing_comma = 1
-- let g:splitjoin_ruby_curly_braces = 0
-- let g:splitjoin_ruby_trailing_comma = 0
-- let g:splitjoin_ruby_hanging_args = 0
-- let g:splitjoin_ruby_do_block_split = 1
-- let g:splitjoin_coffee_suffix_if_clause = 1
-- let g:splitjoin_ruby_options_as_arguments = 0
-- let g:splitjoin_php_method_chain_full = 1
-- let g:splitjoin_python_brackets_on_separate_lines = 1
-- let g:splitjoin_ruby_heredoc_type = '<<-'
-- let g:splitjoin_handlebars_closing_bracket_on_same_line = 0
-- let g:splitjoin_handlebars_hanging_arguments = 0
-- let g:splitjoin_html_attributes_bracket_on_new_line = 0
-- let g:splitjoin_html_attributes_hanging = 1

-- nnoremap <Leader>s :SplitjoinSplit<CR>
-- nnoremap <Leader>j :SplitjoinJoin<CR>
-- nnoremap <Leader>S f{:SplitjoinSplit<CR>o
-- nnoremap <Leader>J :SplitjoinJoin<CR>
-- C CSS Coffeescript Elixir Elm Eruby Go HAML HTML (and HTML-like markup) Handlebars Javascript (within JSX, TSX, Vue.js templates as well)
-- JSON Lua PHP Perl Python Ruby Rust SCSS and Less Shell (sh, bash, zsh) Tex Vimscript YAML

-- gS : one-liner to multi-liner
-- gJ : join block into single-line
-- custom jsx ftplugin used to allow use with jsx tags
-- currently only works when you are inside the block/braces
-- check js files for javasdriptreact filetype
