highlight BqfPreviewBorder guifg=#50a14f ctermfg=71
highlight link BqfPreviewRange IncSearch

lua <<EOF
require('bqf').setup({
  auto_enable = true,
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border_chars = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'}
    -- border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
  },
  func_map = {
    vsplit = '',
    ptogglemode = 'z,',
    stoggleup = ''
  },
  filter = {
    fzf = {
      extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
    }
  }
})

-- root = {
--     auto_enable = {
--         description = [[enable nvim-bqf in quickfix window automatically]],
--         default = true
--     },
--     magic_window = {
--         description = [[give the window magic, when the window is splited horizontally, keep
--             the distance between the current line and the top/bottom border of neovim unchanged.
--             It's a bit like a floating window, but the window is indeed a normal window, without
--             any floating attributes.]],
--         default = true
--     },
--     auto_resize_height = {
--         description = [[resize quickfix window height automatically.
--             Shrink higher height to size of list in quickfix window, otherwise extend height
--             to size of list or to default height (10)]],
--         default = true
--     },
--     preview = {
--         auto_preview = {
--             description = [[enable preview in quickfix window automatically]],
--             default = true
--         },
--         border_chars = {
--             description = [[border and scroll bar chars, they respectively represent:
--                 vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar]],
--             default = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'}
--         },
--         delay_syntax = {
--             description = [[delay time, to do syntax for previewed buffer, unit is millisecond]],
--             default = 50
--         },
--         win_height = {
--             description = [[the height of preview window for horizontal layout]],
--             default = 15
--         },
--         win_vheight = {
--             description = [[the height of preview window for vertical layout]],
--             default = 15
--         }
--     },
--     func_map = {
--         description = [[the table for {function = key}]],
--         default = [[see ###Function table for detail]],
--     },
--     filter = {
--         fzf = {
--             action_for = {
--                 ['ctrl-t'] = {
--                     description = [[press ctrl-t to open up the item in a new tab]],
--                     default = 'tabedit'
--                 },
--                 ['ctrl-v'] = {
--                     description = [[press ctrl-v to open up the item in a new vertical split]],
--                     default = 'vsplit'
--                 },
--                 ['ctrl-x'] = {
--                     description = [[press ctrl-x to open up the item in a new horizontal split]],
--                     default = 'split'
--                 },
--                 ['ctrl-s'] = {
--                     description = [[press ctrl-s to toggle sign for the selected items]],
--                     default = 'signtoggle'
--                 }
--             },
--             extra_opts = {
--                 description = 'extra options for fzf',
--                 default = {'--bind', 'ctrl-o:toggle-all'}
--             }
--         }
--     }
-- }

EOF

" vim:ft=lua
