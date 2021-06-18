vim.g.floaterm_autoclose = 2

-- :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=floaterm1 --position=topleft --autoclose=2 ranger --cmd="cd ~"
-- -title see g:floaterm_title
-- width see g:floaterm_width
-- height see g:floaterm_height
-- opener see g:floaterm_opener
-- wintype see g:floaterm_wintype
-- position see g:floaterm_position
-- autoclose see g:floaterm_autoclose
-- borderchars see g:floaterm_borderchars- -- popfix for custom ui creation
-- -- https://github.com/RishabhRD/popfix

-- g:floaterm_autoclose
-- Type Number. Whether to close floaterm window once the job gets finished.
-- 0: Always do NOT close floaterm window
-- 1: Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
-- 2: Always close floaterm window

-- g:floaterm_position
-- Type String. The position of the floating window. Available values:
-- If wintype is split/vsplit: 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright'. Default: 'botright'.
-- It's recommended to have a look at those options meanings, e.g. :help :leftabove.
-- If wintype is float: 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center', 'auto'(at the cursor place). Default: 'center'
-- let g:floaterm_width = 0.8
-- let g:floaterm_height = 0.8

-- -- g:floaterm_rootmarkers
-- -- Example: ['.project', '.git', '.hg', '.svn', '112222.root', '.gitignore'], Default: []--

-- let g:floaterm_gitcommit = 'floaterm'


-- command! Ranger FloatermNew ranger
-- command! NNN FloatermNew nnn
-- command! LF FloatermNew lf
-- command! Vifm FloatermNew vifm
-- command! Lazygit FloatermNew lazygit

-- -- :FloatermNew :FloatermToggle :FloatermNext :FloatermPrev
-- -- :FloatermNew --autoclose=0 g++ -c % && ./a.aout
-- -- g:floaterm_keymap_new
-- -- g:floaterm_keymap_prev
-- -- g:floaterm_keymap_nextvifm
-- -- g:floaterm_keymap_first
-- -- g:floaterm_keymap_last
-- -- g:floaterm_keymap_hide
-- -- g:floaterm_keymap_show
-- -- g:floaterm_keymap_kill
-- -- -- let g:floaterm_keymap_toggle = '<Leader>n'
-- nnoremap   <silent>   <F8>    :FloatermPrev<CR>
-- tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
-- nnoremap   <silent>   <F9>    :FloatermNext<CR>
-- tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
-- nnoremap   <silent>   <F12>   :FloatermToggle<CR>
-- tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
-- -- Set floaterm window's background to black
-- hi Floaterm guibg=#000000

-- -- hi FloatermBorder guibg=orange guifg=cyan
-- hi FloatermBorder guibg=#001122 guifg=#22ccaa
-- -- hi FloatermBorder guibg=#111111 guifg=#00aacc

-- -- Set floaterm window background to gray once the cursor moves out from it
-- hi FloatermNC guibg=#002211

-- -- wrapper scripts must be in: autoload/floaterm/wrapper

-- -- floating window in place code execution
-- let g:floaterm_repl_runner= --~/scratchpads/runner.sh--
-- :FloatermPrev Switch to the previous floaterm instance
-- :FloatermNext Switch to the next floaterm instance
-- :FloatermFirst Switch to the first floaterm instance
-- :FloatermLast Switch to the last floaterm instance
-- :FloatermUpdate [options] Update floaterm window attributes(height, width, etc.).
-- The options is the same as in :FloatermNew (except --silent).
-- Use <TAB> to get completion.
-- :[N]FloatermToggle[!] [floaterm_name] Open or hide the floaterm window.
-- If N is given, toggle the floaterm whose buffer number is N
-- If floaterm_name is given, toggle the floaterm instance whose name attribute is floaterm_name. Otherwise create a new floaterm named floaterm_name.
-- Use <TAB> to get completion.
-- If ! is given, toggle all floaterms (:FloatermHide! or : FloatermShow!)
-- :[N]FloatermShow[!] [floaterm_name] Show the current floaterm window.
-- If N is given, show the floaterm whose buffer number is N
-- If floaterm_name is given, show the floaterm named floaterm_name.
-- If ! is given, show all floaterms (If multiple floaterms have the same position attribute, only one of them will be show)
-- :[N]FloatermHide[!] [floaterm_name] Hide the current floaterms window.
-- If N is given, hide the floaterm whose buffer number is N
-- If floaterm_name is given, show the floaterm named floaterm_name.
-- If ! is given, hide all floaterms
-- :[N]FloatermKill[!] [floaterm_name] Kill the current floaterm instance
-- If N is given, kill the floaterm whose buffer number is N
-- If floaterm_name is given, kill the floaterm instance named floaterm_name.
-- If ! is given, kill all floaterms
-- :FloatermSend[!] [--name=floaterm_name] [cmd] Send command to a job in floaterm.
-- If --name=floaterm_name is given, send lines to the floaterm instance whose name is floaterm_name. Otherwise use the current floaterm.
-- If cmd is given, it will be sent to floaterm and selected lines will be ignored.
-- This command can also be used with a range, i.e., '<,'>:FloatermSend [--name=floaterm_name] to send selected lines to a floaterm.
-- If cmd is given, the selected lines will be ignored.
-- If use this command with a !, i.e., '<,'>:FloatermSend! [--name=floaterm_name] the common white spaces in the beginning of lines will be trimmed while the relative indent between lines will still be kept.
-- Use <TAB> to get completion.
-- Examples
-- :FloatermSend                        " Send current line to the current floaterm (execute the line in the terminal)
-- :FloatermSend --name=ft1             " Send current line to the floaterm named ft1
-- :FloatermSend ls -la                 " Send `ls -la` to the current floaterm
-- :FloatermSend --name=ft1 ls -la      " Send `ls -la` to the floaterm named ft1
-- :23FloatermSend ...                  " Send the line 23 to floaterm
-- :1,23FloatermSend ...                " Send lines between line 1 and line 23 to floaterm
-- :'<,'>FloatermSend ...               " Send lines selected to floaterm(visual block selection are supported)
-- :%FloatermSend ...                   " Send the whole buffer to floaterm
