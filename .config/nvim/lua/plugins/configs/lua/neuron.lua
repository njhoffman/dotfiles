-- neuron.nvim
-- these are all the default values
require"neuron".setup {
  virtual_titles = true,
  mappings = true,
  run = nil, -- function to run when in neuron dir
  neuron_dir = "~/zettelkasten",
  leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}
vim.cmd([[nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>]])
-- " click enter on [[my_link]] or [[[my_link]]] to enter it
-- nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>
-- " create a new note
-- nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>
-- " find your notes, click enter to create the note if there are not notes that match
-- nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
-- " insert the id of the note that is found
-- nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>
-- " find the backlinks of the current note all the note that link this note
-- nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
-- " same as above but insert the found id
-- nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>
-- " find all tags and insert
-- nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>
-- " start the neuron server and render markdown, auto reload on save
-- nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>
-- " go to next [[my_link]] or [[[my_link]]]
-- nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
-- " go to previous
-- nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]

-- neuron.vim
-- gzZ shows a list of backlinks. Selecting one will navigate to it.
-- gzz shows a list of all zettels, you can search their titles. Selecting one will navigate to it.
-- Type gzi to show the same gzz list. Selecting one will insert a link to it right in front of the your cursor. gzI instead will insert a folgezettel link ([[[...]]]). You can also select a zettel from insert mode with <c-x><c-u> or <c-x><c-y> and then insert a normal link or a folgezettel link respectively.
-- If you put your cursor on top of a link to another zettel and press gzo you'll navigate to that.
-- gzl inserts a link to the previous zettel you visited.
-- gzL will do the same but with a folgezettel.
-- gzu goes back after editing another zettel type.
-- gzu repeatedly will cycle between the two last visited zettels.
-- gzU goes back multiple times in the history of visited zettels (and gzP will go forward).
-- gzn creates a new blank zettel
-- gzN creates a new zettel using the current word under the cursor as its title.
-- if you're in visual selection mode gzN will instead use the selected text (only the first line if there are more than one selected). This will replace the selected text or current word with a link to the newly-created zettel.
-- gzs works like gzz, but instead it searches the content of the zettels, not only the title. For this it calls the external command ag.
-- gzt will allow you to insert new tags or gzT will show you a list of existing tags to then insert.
--
