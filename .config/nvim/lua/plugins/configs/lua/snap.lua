local M = {}

local snap = require "snap"

-- Basic Example
function M.snapVimGrep()
  -- snap.register.map({"n"}, {"<Leader>f"}, function ()
  snap.run {
    reverse = true,
    producer = snap.get "producer.ripgrep.vimgrep",
    select = snap.get"select.vimgrep".select,
    multiselect = snap.get"select.vimgrep".multiselect,
    views = { snap.get "preview.vimgrep" },
  }
  -- end)
end

function M.snapRipGrepSystem()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.limit"(10000,
                                         snap.get "producer.ripgrep.vimgrep"),
    select = snap.get"select.vimgrep".select,
    multiselect = snap.get"select.vimgrep".multiselect,
    views = { snap.get "preview.vimgrep" },
  }
end

function M.snapFzyRipGrep()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzy"(snap.get "producer.ripgrep.file"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapFzfRipGrep()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzf"(snap.get "producer.ripgrep.file"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapRipGrep()
  snap.run {
    reverse = true,
    producer = snap.get "producer.ripgrep.vimgrep",
    select = snap.get"select.vimgrep".select,
    multiselect = snap.get"select.vimgrep".multiselect,
    views = { snap.get "preview.vimgrep" },
  }
end

function M.snapFindBuffers()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzy"(snap.get "producer.vim.buffer"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapFindOldFiles()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzy"(snap.get "producer.vim.oldfiles"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapFindGitFiles()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzy"(snap.get "producer.git.file"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapFindGitFilesFallback()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzf"(snap.get "consumer.try"(
                                           snap.get "producer.git.file",
                                           snap.get "producer.fd.file")),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapFindHelpTags()
  snap.run {
    prompt = "Help>",
    reverse = true,
    producer = snap.get "consumer.fzy"(snap.get "producer.vim.help"),
    select = snap.get"select.help".select,
    views = { snap.get "preview.help" },
  }
end

-- The following will run the vimgrep producer and upon <C-q> will run fzf on the filtered results.
function M.snapVimGrepFzf()
  snap.run {
    producer = snap.get "producer.ripgrep.vimgrep",
    reverse = true,
    steps = {
      { consumer = snap.get "consumer.fzf", config = { prompt = "FZF>" } },
    },
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

function M.snapSearchMainPaths()
  snap.run {
    reverse = true,
    producer = snap.get "consumer.fzf"(snap.get "consumer.combine"(
                                           snap.get"producer.ripgrep.file".args(
                                               {}, "/directory1"),
                                           snap.get"producer.ripgrep.file"
                                               .args({}, "/directory2"),
                                           snap.get"producer.ripgrep.file"
                                               .args({}, "/directory3"))),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = { snap.get "preview.file" },
  }
end

return M

-- Component	Dependency
-- consumer.fzy	fzy via luarocks
-- consumer.fzf	fzf available on command line
-- producer.ripgrep.*	rg available on commmand line
-- producer.fd.*	fd available on commmand line
-- producer.git.file	git available on commmand line
-- preview.*	file available on commmand line

-- Producers
-- snap.producer.vim.buffer Produces vim buffers.
-- snap.producer.vim.oldfiles Produces vim oldfiles.
-- snap.producer.luv.file Luv (vim.loop) based file producer.
-- snap.producer.luv.directory Luv (vim.loop) based directory producer.
-- snap.producer.ripgrep.file Ripgrep based file producer.
-- snap.producer.ripgrep.vimgrep Ripgrep based grep producer in vimgrep format.
-- snap.producer.fd.file Fd based file producer.
-- snap.producer.fd.directory Fd based directory producer.
-- snap.producer.git.file Git file producer.

-- Consumers
-- snap.consumer.cache General cache for producers whose values don't change in response to request.
-- snap.consumer.limit General limit, will stop consuming a producer when a specified limit is reached.
-- snap.consumer.fzy The workhorse consume for filtering producers that don't themselves filter.
-- NOTE: Requests fzy, e.g. use_rocks 'fzy'
-- snap.consumer.fzy.filter A component piece of fzy that only filters.
-- snap.consumer.fzy.score A component piece of fzy that only attaches score meta data.
-- snap.consumer.fzy.positions A component piece of fzy that only attaches position meta data.
-- snap.consumer.fzf Runs filtering through fzf, only supports basic positions highlighting for now.
-- snap.consumer.try Accepts and arbitrary number of producers and upon the first that
-- yields results then use it and skip the rest:
-- snap.get'consumer.try'(
--   snap.get'producer.git.file',
--   snap.get'producer.ripgrep.file'
-- )

-- snap.consumer.combine
-- Accepts and arbitrary number of producers and combines their results:
-- snap.get'consumer.combine'(
--   snap.get'producer.ripgrep.file'.args({}, "/directory1"),
--   snap.get'producer.ripgrep.file'.args({}, "/directory2"),
-- )

-- keymaps
-- <CR>
-- When a single item is selected, calls the provided select function with the cursor result as the selection.
-- When multiple items are selection, calls the provider multiselect function.
-- Alternatives:
-- <C-x> opens in new split <C-v> opens in new vsplit <C-t> opens in new tab

-- Exit Closes snap
-- <Esc> <C-c>

-- Next Move cursor to the next selection.
-- <Down> <C-n> <C-j>

-- Previous Move cursor to the previous selection.
-- <Up> <C-p> <C-k>

-- Multiselect (enabled when multiselect is provided)
-- <Tab> Add current cursor result to selection list.
-- <S-Tab> Remove current cursor result from selection list.

-- <C-a> Select all
-- <C-b  Results Page Down Moves the results cursor down a page.>
-- <C-f> Results Page Up Moves the results cursor up a page.
-- <C-d> View Page Down Moves the cursor of the first view down a page (if more than one exists).
-- <C-u> View Page Up Moves the cursor of the first view up a page (if more than one exists).
