local plugin = {}
local map = require("utils.core").map

function set_config()
  -- Bbye gives you :Bdelete and :Bwipeout commands that behave like well designed citizens:
  -- Close and remove the buffer.
  -- Show another file in that window.
  -- Show an empty file if you've got no other files open.
  -- Do not leave useless [no file] buffers if you decide to edit another file in that window.
  -- Work even if a file's open in multiple windows.
  -- Work a-okay with various buffer explorers and tabbars.
end

function plugin.setup(use)
  use {"moll/vim-bbye"}
  set_config()
end

return plugin
