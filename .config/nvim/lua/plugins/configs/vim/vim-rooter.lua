-- FindRootDirectory()
vim.g.rooter_patterns = {
  "package.json", ".git", "Makefile", "_darcs", ".hg", ".bzr", ".svn",
  "node_modules", "CMakeLists.txt", ".rooter"
}
vim.g.rooter_change_directory_for_non_project_files = "current" -- "current" -- current, home, ''
vim.g.rooter_resolve_links = true
