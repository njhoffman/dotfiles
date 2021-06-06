local plugin = {}
local map = require("utils.core").map

-- vim.g.wordmotion_mappings = {
--   w = '<M-w>',
--   b = '<M-b>',
--   e = '<M-e>',
--   ge = 'g<M-e>',
--   aw = 'a<M-w>',
--   iw = 'i<M-w>',
--   '<C-R><C-W>' = '<C-R><M-w>'
-- }
-- vim.g.wordmotion_spaces = ['\w\@<=-\w\@=', '\.']
-- vim.g.wordmotion_uppercase_spaces = ['-']

-- 1 word becomes 6
-- CamelCaseACRONYMWords_underscore1234
-- w--->w-->w----->w---->w-------->w->w
-- e-->e-->e----->e--->e--------->e-->e
-- b<---b<--b<-----b<----b<--------b<-b

function plugin.load()
end

function plugin.setup(use)
  use {"chaoren/vim-wordmotion"}
end

return plugin
