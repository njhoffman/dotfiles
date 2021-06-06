local plugin = {}

plugin.load = function()
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
end

function plugin.setup(use)
  use {
    "liuchengxu/vim-clap",
    run = ":Clap install-binary",
    config = plugin.load
  }
end
return plugin
