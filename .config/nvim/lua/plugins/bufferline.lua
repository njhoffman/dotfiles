-- " nvim-bufferline post plugin loading
-- " options = {
-- "   view = "multiwindow" | "default",
-- "   numbers = "none" | "ordinal" | "buffer_id",
-- "   number_style = "superscript" | "",
-- "   mappings = true | false,
-- "   buffer_close_icon= '',
-- "   close_icon = '',
-- "   left_trunc_marker = '',
-- "   right_trunc_marker = '',
-- "   max_name_length = 18,
-- "   max_prefix_length = 15,
-- "   tab_size = 18,
-- "   diagnostics = false | "nvim_lsp"
-- "   show_buffer_close_icons = true | false,
-- "   persist_buffer_sort = true,
-- "   separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
-- "   enforce_regular_tabs = false | true,
-- "   always_show_bufferline = true | false,
-- "   sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
-- "     return buffer_a.modified > buffer_b.modified
-- "   end
-- " }


require'bufferline'.setup{
  options = {
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    show_buffer_close_icons = false,
    tab_size = 20,
    max_name_length = 20,
    max_prefix_length = 20,
    separator_style = { '|', '|' },
    enforce_regular_tabs = true,
    sort_by = 'directory',
    always_show_bufferline = true
  }
}


-- " lua require'bufferline'.setup{ options = { tab_size = 12 } }
-- " lua require'bufferline'.setup{}
-- " call s:_('TabLine',             s:base7, s:bg_alt,  'bold')
-- " call s:_('TabLineSel',          s:blue,  s:bg_current, 'bold')
-- " call s:_('TabLineFill',         'none',  s:bg_other,   'bold')
-- "
-- " call s:_('BufferCurrent',       s:base9,          s:bg_current,  'none')
-- " call s:_('BufferCurrentIndex',  s:base6,          s:bg_current,  'none')
-- " call s:_('BufferCurrentMod',    s:yellow,         s:bg_current,  'none')
-- " call s:_('BufferCurrentSign',   s:blue,           s:bg_current,  'none')
-- " call s:_('BufferCurrentTarget', s:red,            s:bg_current,  'bold')
-- "
-- " call s:_('BufferVisible',       s:base7,          s:bg_visible,  'none')
-- " call s:_('BufferVisibleIndex',  s:base9,          s:bg_visible,  'none')
-- " call s:_('BufferVisibleMod',    s:yellow,         s:bg_visible,  'none')
-- " call s:_('BufferVisibleSign',   s:base4,          s:bg_visible,  'none')
-- " call s:_('BufferVisibleTarget', s:red,            s:bg_visible,  'bold')
-- "
-- " call s:_('BufferInactive',       s:base6,          s:bg_other,    'none')
-- " call s:_('BufferInactiveIndex',  s:base6,          s:bg_other,    'none')
-- " call s:_('BufferInactiveMod',    s:yellow,         s:bg_other,    'none')
-- " call s:_('BufferInactiveSign',   s:base4,          s:bg_other,    'none')
-- " call s:_('BufferInactiveTarget', s:red,            s:bg_other,    'bold')
-- "
-- " call s:_('BufferTabpages',       s:blue,           s:bg_statusline, 'bold')
-- " call s:_('BufferTabpageFill',    s:base4,          s:bg_other,    'bold')
-- "
-- " call s:_('BufferPart',        s:diff_info_fg,   s:diff_info_bg0, 'bold')
