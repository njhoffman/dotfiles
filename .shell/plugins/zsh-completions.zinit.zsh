# zsh-completions: collection of completion scripts not yet added to zsh
zinit light "zsh-users/zsh-completions"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:*:*:default' menu yes
# zstyle ':completion:*:*:kill:*:*' verbose no
# zstyle ':completion:*:*:*:default' menu select
# zstyle ':completion:*' fzf-search-display true
# zstyle ':completion:*:options:*' list-colors '=(#b) #(--[a-z-]#)=34=36=33'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors \
  "di=36" "ln=35" "so=32" "pi=33" "ex=31" "bd=34;46" "cd=34;43" \
  "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"

# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*:parameters'  list-colors '=*=0;38;2;66;180;255'
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:commands' list-colors '=*=0;38;2;66;140;140'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;27'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
# zstyle -e ':completion:' list-colors 'thingy=${PREFIX##/} reply=( "=(#b)($thingy)(?)*=00=$color[green]=$color[bg-green]" )'

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
unsetopt menucomplete
setopt automenu
# Changes the behaviour so
#
# first TAB completes the common part
# second lists completions without changing command line
# third starts the menu and completes command line with highlighted completion
# If you prefer no command line changes than fancy menu unset automenu too:
# unsetopt menucomplete automenu

# autoload -U compinit && compinit

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
