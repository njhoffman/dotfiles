local map = require("utils.core").map
map({"x", "n"}, "ga", "<Plug>(EasyAlign)", {noremap = false, silent = true})
vim.g.easy_align_ignore_groups = {"Comment", "String"}
-- nmap <Leader>= <Plug>(EasyAlign)ip=``

-- vipga=  gaip=
-- apple   =red
-- grass+=green
-- sky-=   blue

-- TODO: map Enter to delimiter_align in interactive mode

-- Left-alignment around the FIRST occurrences of delimiters
-- :EasyAlign =

-- Left-alignment around the SECOND occurrences of delimiters
-- :EasyAlign 2=

-- Left-alignment around the LAST occurrences of delimiters
-- :EasyAlign -=

-- Left-alignment around ALL occurrences of delimiters
-- :EasyAlign *=

-- Left-right ALTERNATING alignment around all occurrences of delimiters
-- :EasyAlign **=

-- Right-left ALTERNATING alignment around all occurrences of delimiters
-- :EasyAlign! **=
-- press Ctrl-P in interactive mode for Live interactive mode
-- Start interactive mode with filter option set to g/hello/
-- EasyAlign g/hello/

-- Start live interactive mode with filter option set to v/goodbye/
-- LiveEasyAlign v/goodbye/

-- Align the lines with 'hi' around the first colons
-- EasyAlign:g/hi/

-- ga:
-- ga->:
-- ga2:
-- ga*:
-- testing:  one
-- test: two: three
--
-- ga*|
-- ga**|
-- ga<C-P> *|  <C-D>
-- |Option|Type|Default|Description|
-- |--|--|--|--|
-- |threads|Fixnum|1|number of threads|
-- |queues|Fixnum|1|number of concurrent queues|
-- |batch|Boolean|false|enables batch mode|
