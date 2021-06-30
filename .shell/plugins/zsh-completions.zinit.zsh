
# +---------+
# | General |
# +---------+

# zstyle pattern for the completion
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Load more completions
fpath=($DOTFILES/zsh/plugins/zsh-completions/src $fpath)

# Should be called before compinit
zmodload zsh/complist

# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo

# TODO: figure out where this needs to be placed to override certain keys
# showkey -a, zle -al

# treat ":w" like line enter
bindkey -M vicmd -s ':w^M' '^M'

# TODO: make these config and consistent across shell, vim, and rofi
# # Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# define function that retrieves and runs last command
function kill-line-ins {
  zle kill-whole-line
  zle vi-insert
}
zle -N kill-line-ins

# Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search
#
# # Easier, more vim-like editor opening
# bindkey -M vicmd v edit-command-line

# yank line when visually selected
bindkey -M vicmd 'y' vi-yank

yanktoclipboard(){
    echo $BUFFER | xsel -i -b
}
pastefromclipboard(){
    RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
}
zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard

# # `v` is already mapped to visual mode, so we need to use a different key to open Vim
# bindkey -M vicmd "^V" edit-command-line

function asynctask-auto {
  task="$ASYNC_TASK"
  if [ -z "$task" ]; then
    task=$(zenity --entry --title "AsyncTask" --text "Enter AsyncTask for auto-triggering:")
  fi
  asynctask "$task"
  if [ $? -ne 0 ]; then
    unset ASYNC_TASK
  else
    export ASYNC_TASK="$task"
  fi
}

function .fasd-file () {
  local selected
  if selected=$(find . -type f | grep -v .git | grep -v node_modules | fzf-tmux -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}

# option-g to find files and put the result in command

# bindkey "^[u" fzfp-history-widget
# bindkey '^[R' fzfp-root-cd-widget
# bindkey -s '^[T' 'asynctask-auto \n'
# bindkey -s '^[r' 'asynctask-reset \n'
# bindkey '^E' fzfp-home-file-widget
# bindkey -M menuselect '^P' reverse-menu-complete
# bindkey '\CI' expand-or-complete
# bindkey '^@' fzf-completion
# bindkey '^I'   complete-word       # tab          | complete
# bindkey '\t' autosuggest-accept
# bindkey '^ [[Z' autosuggest-accept  # shift + tab  | autosuggest
# bindkey -r '^[[A'
# bindkey '^I'  expand-or-complete-prefix
# bindkey -M vicmd '^M' accept-line
# bindkey '^ ' autosuggest-accept
# bindkey  '^I'   expand-or-complete # tab          | complete
# bindkey  '^ ' fzf-completion
# bindkey  '\CI'  expand-or-complete-prefix
#TODO: why have to double assign this?
# bindkey '^I' expand-or-complete



#  edit dotfiles
setxkbmap -option caps:escape



# +---------+
# | Options |
# +---------+
# ALWAYS_TO_END - Always place the cursor to the end of the word completed.
# LIST_PACKED - The completion menu takes less space.
# AUTO_MENU - Display the completion menu after two use of the TAB key.
# AUTO_COMPLETE - Select the first match given by the completion menu. Override AUTO_MENU.
# AUTO_PARAM_SLASH - When a directory is completed, add a trailing slash instead of a space.
# COMPLETE_IN_WORD - By default, the cursor goes at the end of the word when completion start. Setting this will not move the cursor and the completion will happen on both end of the word completed.
# GLOB_COMPLETE - Trigger the completion after a glob * instead of expanding it.
# LIST_ROWS_FIRST - Matches are sorted in rows instead of columns.
# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
ZSH_DISABLE_COMPFIX=false
setopt complete_in_word
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
# In the line editor, number of matches to show before asking permission
LISTMAX=9999


# twilio autocomplete setup
TWILIO_AC_ZSH_SETUP_PATH=/home/nicholas/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;

fpath=(~/.shell/completions $fpath)

# load autocompletion scripts
[[ -x "$(command -v kubectl)" ]] && source <(kubectl completion zsh)
[[ -x "$(command -v twilio)" ]] && source <(twilio autocomplete:script zsh)
[[ -x "$(command -v stern)" ]] && source <(stern --completion=zsh)
complete -C '/usr/local/bin/aws_completer' aws
zmodload -i zsh/complist


autoload -Uz allopt zed zmv zcalc colors
autoload -Uz add-zsh-hook
autoload -Uz edit-command-line
autoload -Uz select-word-style shell
autoload -Uz url-quote-magic
autoload -Uz compinit; compinit
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

zle -N edit-command-line
zle -N self-insert url-quote-magic

colors
add-zsh-hook chpwd chpwd_recent_dirs

# _comp_options+=(globdots) # With hidden files

# Only work with the Zsh function vman
# See $DOTFILES/zsh/scripts.zsh
compdef vman="man"

# +---------+
# | zstyles |
# +---------+

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C alias-expension complete-word _generic
bindkey '^A' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# Use cache for commands which use it

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

zstyle ':completion:*' file-sort modification


zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix true


zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'





# # zsh-completions: collection of completion scripts not yet added to zsh
# zinit light "zsh-users/zsh-completions"
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# # zstyle ':completion:*:*:*:default' menu yes
# # zstyle ':completion:*:*:kill:*:*' verbose no
# # zstyle ':completion:*:*:*:default' menu select
# # zstyle ':completion:*' fzf-search-display true
# # zstyle ':completion:*:options:*' list-colors '=(#b) #(--[a-z-]#)=34=36=33'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:default' list-colors \
#   "di=36" "ln=35" "so=32" "pi=33" "ex=31" "bd=34;46" "cd=34;43" \
#   "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"

# # zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
# zstyle ':completion:*:parameters'  list-colors '=*=0;38;2;66;180;255'
# zstyle ':completion:*:options' list-colors '=^(-- *)=34'
# zstyle ':completion:*:commands' list-colors '=*=0;38;2;66;140;140'
# zstyle ':completion:*:builtins' list-colors '=*=1;38;5;27'
# zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
# # zstyle -e ':completion:' list-colors 'thingy=${PREFIX##/} reply=( "=(#b)($thingy)(?)*=00=$color[green]=$color[bg-green]" )'

# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# # Fuzzy matching of completions
# # https://grml.org/zsh/zsh-lovers.html
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle -e ':completion:*:approximate:*' \
#   max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# # Have the completion system announce what it is completing
# zstyle ':completion:*' format 'Completing %d'

# # In menu-style completion, give a status bar
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'


# # Menu-style completion
# zstyle ':completion:*' menu select

# zstyle ':completion:*:parameters'  list-colors '=*=32'
# As you can see syntax is '=pattern=format'. Since * matches everything and 32 is ANSI green code, thus all parameters will be green.
# Now lets show all commands in bolded red
#  -zstyle ':completion:*:commands' list-colors '=*=1;31'
# but built-in commands with a little bit more sophisticated color (from 256 palette)
#  -zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
# analogously for aliases
#  -zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
# Now lets go to patterns, and colorize different parts of completion differently, say we want a kill processes in 3 different colors:
#  -zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
# Here syntax is a little bit more complicated, namely '=(#b)(pattern1)(pattern2)=format0=format1=format2' where format0 is used for everything which do not match any patterns. So processes IDs (first pattern) will be in red, processes names (second pattern) in yellow, and the rest in blue:
# Lastly lets try something useful with '--' string which you asked for:
#  -zstyle ':completion:*:options' list-colors '=^(-- *)=34'
# This will present all command options in blue, but description of that options will stay normal.
# Notice that some options starts with '--', so we have to use '-- ' (with space) to match only descriptions, and negate pattern with ^ to apply color for options.

# AFAIK when using completion menu zsh will always place highlighted completion in the command line. However you can make it less hasty.
# unsetopt menucomplete
# setopt automenu
# Changes the behaviour so
#
# first TAB completes the common part
# second lists completions without changing command line
# third starts the menu and completes command line with highlighted completion
# If you prefer no command line changes than fancy menu unset automenu too:
# unsetopt menucomplete automenu


# accounts:          used to look up the users-hosts style
# all-expansions:    used by the _expand completer when adding the single string containing all possible expansions
# all-files:         for the names of all files (as distinct from a particular subset, see the globbed-files tag).
# arguments:         for arguments to a command
# arrays:            for names of array parameters
# association-keys:  for keys of associative arrays; used when completing inside a subscript to a parameter of this type
# bookmarks:         when completing bookmarks (e.g. for URLs and the zftp function suite)
# builtins:          for names of builtin commands
# characters:        for single characters in arguments of commands such as stty. Also used when completing character classes after an opening bracket
# colormapids:       for X colormap ids
# colors:            for color names
# commands:          for names of external commands. Also used by complex commands such as cvs when completing names subcommands.
# contexts:          for contexts in arguments to the zstyle builtin command
# corrections:       used by the _approximate and _correct completers for possible corrections
# cursors:           for cursor names used by X programs
# default:           used in some contexts to provide a way of supplying a default when more specific tags are also valid. Note that this tag is used when only the function field of the context name is set
# descriptions:      used when looking up the value of the format style to generate descriptions for types of matches
# devices:           for names of device special files
# directories:       for names of directories — local-directories is used instead when completing arguments of cd and related builtin commands when the cdpath array is set
# directory-stack:   for entries in the directory stack
# displays:          for X display names
# domains:           for network domains
# email-plugin:      for email addresses from the ‘_email-plugin’ backend of _email_addresses
# expansions:        used by the _expand completer for individual words (as opposed to the complete set of expansions) resulting from the expansion of a word on the command line
# extensions:        for X server extensions
# file-descriptors:  for numbers of open file descriptors
# files:             the generic file-matching tag used by functions completing filenames
# fonts:             for X font names
# fstypes:           for file system types (e.g. for the mount command)
# functions:         names of functions — normally shell functions, although certain commands may understand other kinds of function
# globbed-files:     for filenames when the name has been generated by pattern matching
# groups:            for names of user groups
# history-words:     for words from the history
# hosts:             for hostnames
# indexes:           for array indexes
# jobs:              for jobs (as listed by the ‘jobs’ builtin)
# interfaces:        for network interfaces
# keymaps:           for names of zsh keymaps
# keysyms:           for names of X keysyms
# libraries:         for names of system libraries
# limits:            for system limits
# local-directories: for names of directories that are subdirectories of the current working directory when completing arguments of cd and related builtin commands (compare path-directories) — when the cdpath array is unset, directories is used instead
# manuals:           for names of manual pages
# mailboxes:         for e-mail folders
# maps:              for map names (e.g. NIS maps)
# messages:          used to look up the format style for messages
# modifiers:         for names of X modifiers
# modules:           for modules (e.g. zsh modules)
# my-accounts:       used to look up the users-hosts style
# named-directories: for named directories (you wouldn’t have guessed that, would you?)
# names:             for all kinds of names
# newsgroups:        for USENET groups
# nicknames:         for nicknames of NIS maps
# options:           for command options
# original:          used by the _approximate, _correct and _expand completers when offering the original string as a match
# other-accounts:    used to look up the users-hosts style
# other-files:       for the names of any non-directory files. This is used instead of all-files when the list-dirs-first style is in effect.
# packages:          for packages (e.g. rpm or installed Debian packages)
# parameters:        for names of parameters
# path-directories:  for names of directories found by searching the cdpath array when completing arguments of cd and related builtin commands (compare local-directories)
# paths:             used to look up the values of the expand, ambiguous and special-dirs styles
# pods:              for perl pods (documentation files)
# ports:             for communication ports
# prefixes:          for prefixes (like those of a URL)
# printers:          for print queue names
# processes:         for process identifiers
# processes-names:   used to look up the command style when generating the names of processes for killall
# sequences:         for sequences (e.g. mh sequences)
# sessions:          for sessions in the zftp function suite
# signals:           for signal names
# strings:           for strings (e.g. the replacement strings for the cd builtin command)
# styles:            for styles used by the zstyle builtin command
# suffixes:          for filename extensions
# tags:              for tags (e.g. rpm tags)
# targets:           for makefile targets
# time-zones:        for time zones (e.g. when setting the TZ parameter)
# types:             for types of whatever (e.g. address types for the xhost command)
# urls:              used to look up the urls and local styles when completing URLs
# users:             for usernames
# values:            for one of a set of values in certain lists
# variant:           used by _pick_variant to look up the command to run when determining what program is installed for a particular command name.
# visuals:           for X visuals
# warnings:          used to look up the format style for warnings
# widgets:           for zsh widget names
# windows:           for IDs of X windows
# zsh-options:       for shell options


# gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
# xmodmap -e "remove Lock = Caps_Lock"
# xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
# xmodmap -e "keycode 66 = Escape NoSymbol Escape"
# xmodmap -pke > ~/.xmodmap

# xmodmap -e "remove Lock = Caps_Lock"
# with:
# xmodmap -e "clear Lock"0


# ###########################
# REFERENCE
#
# COMBINATIONS USING JUST THE 'GREY' KEYS:
#
# key[F1]        = '^[[[A'
# key[F2]        = '^[[[B'
# key[F3]        = '^[[[C'
# key[F4]        = '^[[[D'
# key[F5]        = '^[[[E'
# key[F6]        = '^[[17~'
# key[F7]        = '^[[18~'
# key[F8]        = '^[[19~'
# key[F9]        = '^[[20~'
# key[F10]       = '^[[21~'
# key[F11]       = '^[[23~'
# key[F12]       = '^[[24~'
#
# key[Shift-F1]  = '^[[25~'
# key[Shift-F2]  = '^[[26~'
# key[Shift-F3]  = '^[[28~'
# key[Shift-F4]  = '^[[29~'
# key[Shift-F5]  = '^[[31~'
# key[Shift-F6]  = '^[[32~'
# key[Shift-F7]  = '^[[33~'
# key[Shift-F8]  = '^[[34~'
#
# key[Insert]    = '^[[2~'
# key[Delete]    = '^[[3~'
# key[Home]      = '^[[1~'
# key[End]       = '^[[4~'
# key[PageUp]    = '^[[5~'
# key[PageDown]  = '^[[6~'
# key[Up]        = '^[[A'
# key[Down]      = '^[[B'
# key[Right]     = '^[[C'
# key[Left]      = '^[[D'
#
# key[Bksp]      = '^?'
# key[Bksp-Alt]  = '^[^?'
# key[Bksp-Ctrl] = '^H'    console only.
#
# key[Esc]       = '^['
# key[Esc-Alt]   = '^[^['
#
# key[Enter]     = '^M'
# key[Enter-Alt] = '^[^M'
#
# key[Tab] = '^I' or '\t' unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
#
#
# COMBINATIONS USING THE WHITE KEYS:
#
# Anomalies:
# 'Ctrl+`' == 'Ctrl+2', and 'Ctrl+1' == '1' in xterm.
# Several 'Ctrl+number' combinations are void at console, but return codes in xterm. OTOH Ctrl+Bksp returns '^H' at console, but is identical to plain 'Bksp' in xterm. There are no doubt more of these little glitches however, in the main:
#
# White key codes are easy to understand, each of these 'normal' printing keys has six forms:
#
# A            = 'a'    (duhhh)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
# A-Ctrl       = '^A'
# A-Alt-Ctrl   = '^[^A'
# A-Alt-Shift  = '^[A'
# A-Ctrl-Shift = '^A'   (Shift has no effect)
#
# Don't forget that:
#
# /-Shift-Ctrl = Bksp      = '^?'
# [-Ctrl       = Esc       = '^['
# M-Ctrl       = Enter     = '^M'
# I-Ctrl       = Tab       = '^I' or '\t'
#
# And, we can 'stack' keybindings:
#
#   bindkey -s '^Xm' "My mistress\' eyes are nothing like the sun."
#
# ... Bind 'Ctrl-X' followed by 'm' to a nice line of poetry.
#
# And we can flirt with madness:
#
#   bindkey -s '^Pletmenot' 'Let me not, to the marriage of true minds'
#
# ... but you hafta start something like that with a 'modifier' character. Try it, if you like keyboard shortcuts, you can really go to town.
