#!/usr/bin/zsh

home_dir=${(%):-%-2N} # only include two leadining path components
shell_dir="$home_dir/.shell"

TTY=$(tty)

export PROMPT_COMMAND="pwd > /tmp/whereami"
precmd() { eval "$PROMPT_COMMAND" }

export NO_AT_BRIDGE=1 # turn off warning of connection to dbus for a11y features
export TASKRC="$home_dir/.config/taskwarrior/.taskrc"

# export AWS_DEFAULT_PROFILE=$P9K_AWS_DEFAULT_PROFILE
export AWS_PROFILE=$P9K_AWS_DEFAULT_PROFILE

# zsh-autoenv
if [ -f ~/.oh-my-zsh/custom/plugins/zsh-autoenv/autoenv.zsh ]; then
  source ~/.oh-my-zsh/custom/plugins/zsh-autoenv/autoenv.zsh
  export AUTOENV_FILE_ENTER=".autoenv.zsh"
  export AUTOENV_DISABLED=0
  export AUTOENV_DEBUG=0 # 1: generic, 2: verbose, 3: everything (set -x while sourcing env files)
fi

# plugin configuration
export ZSH="$HOME/.oh-my-zsh"

export SSH_KEY_PATH="$home_dir/.ssh/id_rsa"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

local script=${(%):-%x}
_file_success $script


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
# key[Tab]       = '^I' or '\t'  unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
#
# COMBINATIONS USING THE WHITE KEYS:
#
# Anomalies:
# 'Ctrl+`' == 'Ctrl+2', and 'Ctrl+1' == '1' in xterm.
# Several 'Ctrl+number' combinations are void at console, but return codes in xterm. OTOH Ctrl+Bksp returns '^H' at console, but is identical to plain 'Bksp' in xterm. There are no doubt more of these little glitches however, in the main:
#
# White key codes are easy to undertand, each of these 'normal' printing keys has six forms:
#
# A            = 'a'    (duhhh)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
#
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
