vim.g.wiki = {}
vim.g.wiki.path = "~/wiki/"
vim.g.wiki.syntax = "markdown"
vim.g.wiki.ext = ".md"
vim.g.wiki.maxhi = 1
vim.g.wiki.auto_tags = 1
vim.g.wiki.auto_generate_tags = 1
vim.g.wiki.links_space_char = "_"
vim.g.wiki.nested_syntaxes = {
  python = "python",
  js = "javascript",
  sh = "sh",
  bash = "sh",
  javascript = "javascript",
  html = "html",
  css = "css",
  zsh = "zsh",
  terraform = "terraform",
  ansible = "ansible"
}
-- let vimwiki = {}
-- let vimwiki.path = '~/vimwiki/'
-- let vimwiki.syntax = 'default'
-- let vimwiki.ext = '.wiki'
-- let vimwiki.maxhi = 1
-- let vimwiki.links_space_char = '_'
-- let vimwiki.nested_syntaxes =
-- \ {
-- \ 'python': 'python', 'c++': 'cpp', 'js': 'javascript',
-- \ 'sh': 'sh', 'bash': 'sh', 'javascript' :'javascript',
-- \ 'html': 'html', 'css': 'css', 'zsh': 'zsh',
-- \ 'terraform': 'terraform', 'ansible': 'ansible'
-- \ }
-- let g:vimwiki_list = [wiki, vimwiki]
-- let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
-- let g:vimwiki_global_ext = 1
-- let g:vimwiki_hl_headers = 0
-- let g:vimwiki_hl_cb_checked = 1

-- autocmd! FileType markdown set ft=vimwiki syn=vimwiki

-- if configured correctly should show proper highlighting for wiki and md
-- files with ft=vimwiki
-- possibly use joplin, syncthing

-- TODO: trim ending new line when creating new link

-- :h vimwiki-mappings
-- <Leader>ww    => open default wiki index file
-- <Leader>ws    => select available wiki index files
-- <Leader>wd/wr => Delete / rename current wikifile
-- (Shift)+Enter => (Split) follow/create link
-- <Backspace>   => Go back to previous link
-- <C-Space>     => Toggle checkbox on/off
-- <Tab>         => Cycle throw links
-- = / -         => Add / remove header level
-- [[ / ]]       => Go to previous/next header in the buffer
-- [= / ]=       => Go to previous/next header of same level
-- gl* / gl#     => Make a list out of a normal line [* # - 1 a A i I]
--
-- !! location list disappear bug: https://github.com/vimwiki/vimwiki/issues/923
-- :VimwikiSearch /pattern/
--   :lope (view all matches) :lnext :lprev
-- :VimWikiRebuildTags
-- :VimwikiSearchTags \(\h\|[-]\)\{2,8} => list all tags between 2 and 8 words
--  :tag-example-one:tag-two:
--
-- If placed in the first two lines of a file, the whole file is tagged.  If
-- placed under a header, within the 2 lines below it, the header is then tagged
-- with this tag, and the tag search commands will jump to this specific header.
-- Otherwise, the tag stands of its own and the search command jumps directly to
-- it.
--
-- Vimwiki2HTML, VimWikiAll2HTML
--
-- % git submodule add <repository> external/<name>
-- [Link Text](external/<name>/<page>.md)
--
-- TODO:
--  - explore converting vimwiki to markdown
--  - explore converting commands list to markdown (only if syntax looks good)
--  - add tags to command files
--  - add additional step in bin/rsc to check for exact tags

-- https://github.com/vim-pandoc/vim-pandoc
-- https://github.com/vim-pandoc/vim-pandoc-syntax
-- augroup pandoc_syntax
--   autocmd! FileType vimwiki set syntax=markdown.pandoc
-- augroup END
