source /home/nicholas/.config/gdb/.gdbinit.dashboard
source /home/nicholas/.config/gdb/.gdbinit.aliases

# dashboard -layout assembly breakpoints expressions history memory registers source stack threads variables
dashboard -layout registers assembly stack memory source variables
# native, monokai, stata-dark, vim
dashboard -style syntax_highlighting 'stata-dark'

# dashboard -style prompt_running '\\[\\e[1;35m\\]>>>\\[\\e[0m\\]'
# dashboard -style prompt_not_running '\\[\\e[1;30m\\]>>>\\[\\e[0m\\]'
# dashboard -style divider_fill_char_primary '─'
# dashboard -style divider_fill_char_secondary '─'
# dashboard -style divider_fill_style_primary '36'
# dashboard -style divider_fill_style_secondary '1;30'
# dashboard -style divider_label_style_on_primary '1;33'
# dashboard -style divider_label_style_on_secondary '1;37'
# dashboard -style divider_label_style_off_primary '33'
# dashboard -style divider_label_style_off_secondary '1;30'
# dashboard -style divider_label_skip 3
# dashboard -style divider_label_margin 1
# dashboard -style divider_label_align_right False
# dashboard -style style_selected_1 '1;32'
# dashboard -style style_selected_2 '32'
# dashboard -style style_low '1;30'
# dashboard -style style_high '1;37'
# dashboard -style style_error '31'
# dashboard -style style_critical '0;41'

# dashboard registers -style column-major False
dashboard registers -style column-major True

dashboard variables -style align False
dashboard variables -style arguments True
dashboard variables -style locals True
dashboard variables -style compact False

dashboard memory watch $esp 64
dashboard memory -style cumulative true
dashboard memory -style full True

dashboard -style prompt_running '\\[\\e[38;5;202m\\]gdb$\\[\\e[0m\\]'
dashboard -style prompt_not_running '\\[\\e[38;5;102m\\]gdb$\\[\\e[0m\\]'
dashboard -style divider_label_style_on_primary '38;5;208'
dashboard -style divider_label_skip 1
dashboard -style divider_label_align_right True
dashboard -style divider_fill_style_primary '38;5;52'
dashboard -style style_selected_1 '38;5;41'
dashboard -style style_selected_2 '38;5;110'
dashboard -style style_high '38;5;248'
dashboard -style style_low '38;5;240'

dashboard source -style height 20
# dashboard registers -style style_selected_1 '38;5;160'
