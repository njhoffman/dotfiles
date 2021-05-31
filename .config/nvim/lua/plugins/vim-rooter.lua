local plugin = {}

function set_config()
  vim.g.rooter_patterns = {'package.json', '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt'}
  vim.g.rooter_change_directory_for_non_project_files = 'current' -- current, home, ''
  vim.g.rooter_resolve_links = true
end

function plugin.load()
  -- echo FindRootDirectory()
  set_config()
end

function plugin.setup(use)
  use { "airblade/vim-rooter" }
  plugin.load()
end

return plugin
