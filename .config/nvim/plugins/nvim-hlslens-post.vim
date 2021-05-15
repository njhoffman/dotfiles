lua <<EOF

-- lua
require('hlslens').setup({
  calm_down = true,
  nearest_only = true,
  nearest_float_when = 'always',
  virt_priority = 50
})

EOF

" vim: ft=lua
