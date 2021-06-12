require "surround".setup {}

-- Provides key mapping to add surrounding characters.( visually select then press s<char> or press ys{motion}{char})
-- Provides key mapping to replace surrounding characters.( sr<from><to> )
-- Provides key mapping to delete surrounding characters.( sd<char> )
-- ss repeats last surround command.
-- nsert Mode
-- <c-s><char> will insert both pairs in insert mode.
-- <c-s><char><space> will insert both pairs in insert mode with surrounding whitespace.
-- <c-s><char><c-s> will insert both pairs on newlines insert mode.

-- prefix: prefix for sandwich mode. (default: s)
-- pairs: dictionary or lua table of form { nestable: {{},...}, linear: {{},....} } where linear is an array of arrays which contain non nestable pairs of surrounding characters first opening and second closing like ", ' and nestable is an array of arrays which contain nestable pairs of surrounding characters like (, {, [. (default: { nestable = { {"(", ")"}, {"[", "]"}, {"{", "}"} }, linear = { {"'", "'"}, {'"', '"'} } })
-- context_offset: number of lines to look for above and below the current line while searching for nestable pairs. (default: 100)
-- load_autogroups: whether to load inbuilt autogroups or not. (default: false)
-- mappings_style: "surround" or "sandwich" (default: sandwich)
-- load_keymaps: whether to load inbuilt keymaps or not. (default: true)
-- quotes: an array of items to be considered as quotes while cycling through them. (default: ["'", '"']
-- brackets: an array of items to be considered as brackets while cycling through them. (default: ["(", "{", "["]
