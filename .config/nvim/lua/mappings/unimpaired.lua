-- disabled unimpaired mappings commented out
local unimpaired_map = {
  ["yo"] = {
    name = "+options toggle",
    ["b"] = {"background", "light/dark background"},
    ["c"] = {"cursorline", "cursorline"},
    ["d"] = {"diff", "diff this / diffoff"},
    ["h"] = {"hlsearch", "search highlight"},
    ["i"] = {"ignorecase", "search case ignore"},
    ["l"] = {"list", "list"},
    ["n"] = {"number", "number"},
    ["r"] = {"relativenumber", "relative number"},
    ["s"] = {"spell", "spell check"},
    ["u"] = {"cursorcolumn", "cursorcolumn"},
    ["v"] = {"virtualedit", "virtualedit text"},
    ["w"] = {"wrap", "word wrap"},
    ["x"] = {"cursorline", "crosshairs"}
  },
  ------- pasting
  ["]p"] = "Paste after line incr indent.",
  ["[p"] = "Paste before line incr indent.",
  ["[P"] = "Paste after line decr indent.",
  ["]P"] = "Paste before line decr indent.",
  [">p"] = "Paste after line incr indent.",
  [">P"] = "Paste before line incr indent.",
  ["<p"] = "Paste after line decr indent.",
  ["<P"] = "Paste before line decr indent.",
  ["=p"] = "hPaste after line reindenting.",
  ["=P"] = " Paste before line reindenting.",
  ["[op"] = "new line paste after ",
  ["]op"] = "new line paste before",
  ["yop"] = "paste within",
  -- next/prev pairs
  ["[a"] = {":previous", "ed prev files (args)"},
  ["]a"] = {":next", "ed next files (args)"},
  ["[b"] = {":bprevious", "prev buf (list)"},
  ["]b"] = {":bnext", "next buf (list)"},
  ["[l"] = {":lprevious", "loc prev"},
  ["]l"] = {":lnext", "loc next"},
  ["[<C-L>"] = {":lpfile", "loc prev in file"},
  ["]<C-L>"] = {":lnfile", "loc next in file"},
  ["[q"] = {":cprevious", "qf prev"},
  ["]q"] = {":cnext", "qf next"},
  ["[<C-Q>"] = {":cpfile", "qf prev in file"},
  ["]<C-Q>"] = {":cnfile", "qf next in file"},
  ["[t"] = {":tprevious", "tag previous"},
  ["]t"] = {":tnext", "tag next"},
  ["[<C-T>"] = {":ptprevious", "tag prev in prev window"},
  ["]<C-T>"] = {":ptnext", "tag next in prev window"}
}

local opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

require("which-key").register(unimpaired_map, opts)

-- disabled unimpaired mappings for reference
-- ["[A"]       = { ":first", "ed first file in (args)"},
-- ["]A"]       = { ":last", "ed last file in (args)"},
-- ["[B"]       = { ":bfirst","first buf (list)"},
-- ["]B"]       = { ":blast", "last buf (list)"},
-- ["[L"]       = { ":lfirst", "loc first"},
-- ["]L"]       = { ":llast", "loc last"},
-- ["[Q"]       = { ":cfirst", "qfirst"},
-- ["]Q"]       = { ":clast", "qf last"},
-- ["[T"]       = { ":tfirst", "tag first"},
-- ["]T"]       = { ":tlast", "tag last"},
-- ["[f"]       = { "<Plug>unimpairedDirectoryPrevious", "prev file alpha"},  -- **
-- ["]f"]       = { "<Plug>unimpairedDirectoryNext", "next file alpha"}, -- **
-- ["[n"]       = { "<Plug>unimpairedContextPrev", "prev scm/git hunk"},
-- ["]n"]       = { "<Plug>unimpairedContextNext", "next scm/git hunk"},
-- ["[<Space>"] = { "<Plug>unimpairedBlankUp", "add lines above"},
-- ["]<Space>"] = { "<Plug>unimpairedBlankDown", "add lines below"},
-- ["[e"]       = { "<Plug>unimpairedMoveUp", "exchange with line above"}, --**
-- ["]e"]       = { "<Plug<unimpairedMoveDown", "exchange with line below"}, --**
