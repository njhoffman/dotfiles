#!/bin/zsh
#
if [[ ${ZSH_HIGHLIGHT_VERSION:+set} = set ]] ; then
  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=#77aaff'
  ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[path_prefix]=none
  ZSH_HIGHLIGHT_STYLES[cursor]='bg=#000000'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#44ccaa'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#44aaaa'

  typeset -A ZSH_HIGHLIGHT_REGEXP
  ZSH_HIGHLIGHT_REGEXP+=('\bsudo\b' fg=123,bold)
  # ZSH_HIGHLIGHT_PATTERNS+=('sudo' 'fg=white,bold,bg=red')

  typeset -A ZSH_HIGHLIGHT_PATTERNS
  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
fi

if [[ ${FAST_HIGHLIGHT:+set} = set ]] ; then
  typeset -gA FAST_HIGHLIGHT_STYLES
  FAST_HIGHLIGHT_STYLES[unknown-token]="fg=red"
  FAST_HIGHLIGHT_STYLES[alias]="fg=012"
  FAST_HIGHLIGHT_STYLES[path]="fg=blue"
  FAST_HIGHLIGHT_STYLES[path-to-dir]="fg=blue,underline"
  FAST_HIGHLIGHT_STYLES[suffix-alias]="fg=012"
  FAST_HIGHLIGHT_STYLES[builtin]="fg=012"
  FAST_HIGHLIGHT_STYLES[function]="fg=012"
  FAST_HIGHLIGHT_STYLES[precommand]="fg=red,underline,bold"
  FAST_HIGHLIGHT_STYLES[command]="fg=012"
  FAST_HIGHLIGHT_STYLES[commandseparator]="fg=012"
  FAST_HIGHLIGHT_STYLES[comment]="fg=011,bold,italic"
  FAST_HIGHLIGHT_STYLES[single-quoted-argument]="fg=011"
  FAST_HIGHLIGHT_STYLES[double-quoted-argument]="fg=011"
  FAST_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=011"
  FAST_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
  FAST_HIGHLIGHT_STYLES[double-hyphen-option]="fg=215"
# FAST_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta,bold'
# FAST_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta,bold'
# FAST_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,bold'
# FAST_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
# FAST_HIGHLIGHT_STYLES[commandseparator]='fg=red,bold'
# FAST_HIGHLIGHT_STYLES[hashed-command]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[reserved-word]='fg=bold'
# FAST_HIGHLIGHT_STYLES[unknown-token]='bg=brown'
# FAST_HIGHLIGHT_STYLES[precommand]='fg=yellow,bold,underline'
# FAST_HIGHLIGHT_STYLES[function]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[globbing]='fg=cyan,bold'
# FAST_HIGHLIGHT_STYLES[command]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[path]='fg=underline'
fi

# unknown-token - unknown tokens / errors
# reserved-word - shell reserved words (if, for)
# alias - aliases
# suffix-alias - suffix aliases (requires zsh 5.1.1 or newer)
# global-alias - global aliases
# builtin - shell builtin commands (shift, pwd, zstyle)
# function - function names
# command - command names
# precommand - precommand modifiers (e.g., noglob, builtin)
# commandseparator - command separation tokens (;, &&)
# hashed-command - hashed commands
# autodirectory - a directory name in command position when the AUTO_CD option is set
# path - existing filenames
# path_pathseparator - path separators in filenames (/); if unset, path is used (default)
# path_prefix - prefixes of existing filenames
# path_prefix_pathseparator - path separators in prefixes of existing filenames (/); if unset, path_prefix is used (default)
# globbing - globbing expressions (*.txt)
# history-expansion - history expansion expressions (!foo and ^foo^bar)
# command-substitution - command substitutions ($(echo foo))
# command-substitution-unquoted - an unquoted command substitution ($(echo foo))
# command-substitution-quoted - a quoted command substitution ("$(echo foo)")
# command-substitution-delimiter - command substitution delimiters ($( and ))
# command-substitution-delimiter-unquoted - an unquoted command substitution delimiters ($( and ))
# command-substitution-delimiter-quoted - a quoted command substitution delimiters ("$( and )")
# process-substitution - process substitutions (<(echo foo))
# process-substitution-delimiter - process substitution delimiters (<( and ))
# arithmetic-expansion - arithmetic expansion $(( 42 )))
# single-hyphen-option - single-hyphen options (-o)
# double-hyphen-option - double-hyphen options (--option)
# back-quoted-argument - backtick command substitution (`foo`)
# back-quoted-argument-unclosed - unclosed backtick command substitution (`foo)
# back-quoted-argument-delimiter - backtick command substitution delimiters (`)
# single-quoted-argument - single-quoted arguments ('foo')
# single-quoted-argument-unclosed - unclosed single-quoted arguments ('foo)
# double-quoted-argument - double-quoted arguments ("foo")
# double-quoted-argument-unclosed - unclosed double-quoted arguments ("foo)
# dollar-quoted-argument - dollar-quoted arguments ($'foo')
# dollar-quoted-argument-unclosed - unclosed dollar-quoted arguments ($'foo)
# rc-quote - two single quotes inside single quotes when the RC_QUOTES option is set ('foo''bar')
# dollar-double-quoted-argument - parameter expansion inside double quotes ($foo inside "")
# back-double-quoted-argument - backslash escape sequences inside double-quoted arguments (\" in "foo\"bar")
# back-dollar-quoted-argument - backslash escape sequences inside dollar-quoted arguments (\x in $'\x48')
# assign - parameter assignments (x=foo and x=( ))
# redirection - redirection operators (<, >, etc)
# comment - comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
# comment - elided parameters in command position ($x ls when $x is unset or empty)
# named-fd - named file descriptor (the fd in echo foo {fd}>&2)
# numeric-fd - numeric file descriptor (the 2 in echo foo {fd}>&2)
# arg0 - a command word other than one of those enumerated above (other than a command, precommand, alias, function, or shell builtin command).
# default - everything else


