
require('hlslens').setup{
  -- enable hlslens after searching
  -- type: boolean
  auto_enable = true,
  -- if calm_down is true, stop hlslens when cursor is out of position range
  -- type: boolean
  calm_down = false,
  -- hackable function for customizing the virtual text
  -- type: function(lnum, loc, idx, r_idx, count, hls_ns)
  override_line_lens = nil,
  calm_down = true,
  nearest_only = true,
  nearest_float_when = 'always',
  virt_priority = 50
}

-- " integrate with vim-visual-multi multiple cursors
-- aug VMlens
--   au!
--   au User visual_multi_start lua require('vmlens').start()
--   au User visual_multi_exit lua require('vmlens').exit()
-- aug END
