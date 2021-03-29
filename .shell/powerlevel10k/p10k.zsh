# Generated by Powerlevel10k configuration wizard on 2020-01-12 at 16:52 CST.
# Based on romkatv/powerlevel10k/config/p10k-classic.zsh, checksum 20550.
# Wizard options: nerdfont-complete + powerline, large icons, classic, darkest, time,
# angled separators, sharp heads, blurred tails, 2 lines, disconnected, left frame,
# sparse, many icons, concise, transient_prompt, instant_prompt=verbose.
# Type `p10k configure` to generate another config.
#
# Config for Powerlevel10k with classic powerline prompt style. Type `p10k configure` to generate
# your own config based on it.
#
# Tip: Looking for a nice color? Here's a one-liner to print colormap.
#
#   for i in {0..255}; do print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'}; done

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh
  setopt no_unset extended_glob

  # Unset all configuration options. This allows you to apply configiguration changes without
  # restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
  unset -m 'POWERLEVEL9K_*'

  autoload -Uz is-at-least && is-at-least 5.1 || return

  zmodload zsh/langinfo
  if [[ ${langinfo[CODESET]:-} != (utf|UTF)(-|)8 ]]; then
    local LC_ALL=${${(@M)$(locale -a):#*.(utf|UTF)(-|)8}[1]:-en_US.UTF-8}
  fi

  loaddir=~/.shell/powerlevel10k/classic
  function load {
    if [[ -f "$loaddir/$1.user.zsh" ]]; then
       source "$loaddir/$1.user.zsh"
     elif [[ -f "$loaddir/$1.zsh" ]]; then
       source "$loaddir/$1.zsh"
    fi
  }

  load "elements"
  load "fonts"
  load "general"
  load "segments/os-icon"
  load "segments/prompt-char"
  load "segments/dir"
  load "segments/vcs"
  load "segments/command-execution-time"
  load "segments/background-jobs"
  load "segments/direnv"
  load "segments/nordvpn"
  load "segments/ranger-shell"
  load "segments/nnn-shell"
  load "segments/vim-shell"
  load "segments/midnight-commander-shell"
  load "segments/vi-mode"
  load "segments/ram"
  load "segments/cpu"
  load "segments/todo"
  load "segments/context"
  load "segments/anaconda"
  load "segments/python"
  load "segments/nodejs"
  load "segments/go"
  load "segments/rust"
  load "segments/dotnet"
  load "segments/ruby"
  load "segments/fvm"
  load "segments/lua"
  load "segments/java"
  load "segments/perl"
  load "segments/terraform"
  load "segments/aws"
  load "segments/azure"
  load "segments/google-app"
  load "segments/kubernetes"
  load "segments/network"
  load "segments/battery"
  load "segments/time"
  load "segments/user-example-segment"

  load "segments/tty"
  load "segments/postgresql"

  # If p10k is already loaded, reload configuration.
  # This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
  (( ! $+functions[p10k] )) || p10k reload
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
