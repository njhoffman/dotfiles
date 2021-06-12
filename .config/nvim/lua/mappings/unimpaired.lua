-- disabled unimpaired mappings commented out
-- TODO: toggle neoformat au, lsp_diagnostic, gitsigns
local unimpaired_map = {
  ["yo"] = {
    name = "+toggle options",
    ["b"] = "light/dark background",
    ["c"] = "cursorline",
    ["d"] = "diff this / diffoff",
    ["h"] = "search highlight",
    ["i"] = "search case ignore",
    ["l"] = "list",
    ["n"] = "number",
    ["r"] = "relative number",
    ["s"] = "spell check",
    ["u"] = "cursorcolumn",
    ["v"] = "virtualedit text",
    ["w"] = "word wrap",
    ["x"] = "crosshairs"
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
  ["[a"] = "ed prev files (args)",
  ["]a"] = "ed next files (args)",
  ["[b"] = "prev buf (list)",
  ["]b"] = "next buf (list)",
  ["[l"] = "loc prev",
  ["]l"] = "loc next",
  ["[<C-L>"] = "loc prev in file",
  ["]<C-L>"] = "loc next in file",
  ["[q"] = "qf prev",
  ["]q"] = "qf next",
  ["[<C-Q>"] = "qf prev in file",
  ["]<C-Q>"] = "qf next in file",
  ["[t"] = "tag previous",
  ["]t"] = "tag next",
  ["[<C-T>"] = "tag prev in prev window",
  ["]<C-T>"] = "tag next in prev window"
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
