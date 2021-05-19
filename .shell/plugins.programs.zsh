#!/usr/bin/zsh

# Common ICE modifiers
  z_lucid() {
    zinit ice lucid ver'master' "$@"
  }
  zi0a() {
    z_lucid wait'0a' "$@"
  }

  zi0b() {
    z_lucid wait'0b' "$@"
  }

  zi0c() {
    z_lucid wait'0c' "$@"
  }


############
# Programs #
###########$

  zi_program() {
    zi0a as'program' "$@"
  }

  # zi_program has'trash' pick'rmtrash'
  zinit light PhrozenByte/rmtrash

  zi_program has'gpg'
  zinit light dylanaraps/pash

  zi_program has'jq' pick'reddio' from'gitlab'
  zinit light aaronNG/reddio

  zi_program pick'hURL'
  zinit light 'fnord0/hURL'

  # git-open has a manpage that I want in my MANPATH
  zi_program has'git' atclone"cp git-open.1.md $HOME/.local/man/man1/git-open.1" atpull'%atclone'
  zinit light paulirish/git-open

  zi_program atclone"cp hr.1 $HOME/.local/man/man1" atpull'%atclone'
  zinit light LuRsT/hr

  zi_program pick'prettyping' has'ping'
  zinit light denilsonsa/prettyping

  zi_program has'bat' pick'src/*'
  zinit light eth-p/bat-extras

  # zi_program has'git' pick'yadm' atclone"cp yadm.1 $HOME/.local/man/man1" atpull'%atclone'
  # zinit light TheLocehiliosan/yadm

  zi_program has'tmux' pick'bin/xpanes'
  zinit light greymd/tmux-xpanes
  #
  zi_program has'python3' pick'imguralbum.py'
  zinit light alexgisby/imgur-album-downloader

  zi_program has'signal-cli' pick'scli'
  zinit light isamert/scli

  zi_program has'jq'
  zinit snippet 'https://github.com/DanielG/dxld-mullvad/blob/master/am-i-mullvad.sh'

  zi_program has'chromium-browser-privacy' pick'chrome-extension-dl'
  zinit light th3lusive/chrome-extension-dl

  zi_program has'ueberzug' pick'stpvimg'
  zinit light Seirdy/stpv

  zi_program pick'stpv'
  zinit light Seirdy/stpv

  zi_program pick'neofetch' atclone"cp neofetch.1 $HOME/.local/man/man1" atpull'%atclone'
  zinit light dylanaraps/neofetch

  zi_program has'perl' pick'exiftool'
  zinit light exiftool/exiftool

  if [ -z "$SSH_CONNECTION" ]; then
    zi_program has'perl' pick'inxi'
    zinit light smxi/inxi
  fi

  # fzf-related plugins {{{

      # fzf bynary and tmux helper script
      zinit ice lucid wait'0c' as"command" id-as"junegunn/ fzf-tmux" pick"bin/fzf-tmux"
      zinit light junegunn/fzf

      zinit ice wait"1" lucid
      zinit light junegunn/fzf

      zinit ice wait"1" lucid
      zinit light jhawthorn/fzy
      zinit ice from"gh-r" as"command" pick"$ZPFX/bin/fzy*" \
        atclone"cp contrib/fzy-* $ZPFX/bin" \
        make"!PREFIX=$ZPFX install"

      # # fzf-based tab-completion, load after all other completion plugins
      # z_lucid wait'1'
      # zinit light Aloxaf/fzf-tab
      # zi0b has'fzf' pick'completion.zsh' src'key-bindings.zsh'
      # zinit light $HOME/.fzf/shell

      zinit ice from"gh-r" as"command"
      zinit load junegunn/fzf-bin

      zi_program has'fzf' pick'fzfp'
      zinit light Seirdy/stpv

      zi_program has'fzf'
      zinit light denisidoro/navi

      zi_program has'fzf' pick'fzf-tmux'
      zinit light $GOPATH/src/github.com/junegunn/fzf/bin

      # bind multiple widgets using fzf
      zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"

      # zi0c has'fzf' ''
      # zinit light ZoeFiri/fz

      zi0a has'fzf' pick'fzf-finder.plugin.zsh'
      zinit light leophys/zsh-plugin-fzf-finder

      # git interactive with fzf
      forgit_log=fglo
      forgit_diff=fgd
      forgit_add=fga
      forgit_reset_head=fgrh
      forgit_ignore=fgi
      forgit_restore=fgcf
      forgit_clean=fgclean
      forgit_stash_show=fgss
      forgit_cherry_pick=fgcp
      # FORGIT_LOG_FZF_OPTS=...

      FORGIT_FZF_DEFAULT_OPTS="
        --exact
        --border
        --cycle
        --reverse
        --preview-window=:bottom:hidden:70%
        --height '80%'
      "
      zi0a
      zinit light wfxr/forgit

        bindkey '^^'  fzf-select-widget
        # bindkey '^@.' fzf-edit-dotfiles
        # bindkey '^@c' fzf-change-directory
        # bindkey '^@n' fzf-change-named-directory
        # bindkey '^@f' fzf-edit-files
        # bindkey '^@k' fzf-kill-processes
        # bindkey '^@s' fzf-exec-ssh
        # bindkey '^\'  fzf-change-recent-directory
        # bindkey '^r'  fzf-insert-history
        # bindkey '^xf' fzf-insert-files
        # bindkey '^xd' fzf-insert-directory
        # bindkey '^xn' fzf-insert-named-directory
        #
        # ## Git
        # bindkey '^@g'  fzf-select-git-widget
        # bindkey '^@ga' fzf-git-add-files
        # bindkey '^@gc' fzf-git-change-repository
        #
        # # GitHub
        # bindkey '^@h'  fzf-select-github-widget
        # bindkey '^@hs' fzf-github-show-issue
        # bindkey '^@hc' fzf-github-close-issue
        #
        # ## Docker
        # bindkey '^@d'  fzf-select-docker-widget
        # bindkey '^@dc' fzf-docker-remove-containers
        # bindkey '^@di' fzf-docker-remove-images
        # bindkey '^@dv' fzf-docker-remove-volumes

        typeset -gA FZF_WIDGET_OPTS
        # Enable Exact-match by fzf-insert-history
        FZF_WIDGET_OPTS[insert-history]='--exact'
        autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
        add-zsh-hook chpwd chpwd_recent_dirs
      # FZF_WIDGET_OPTS[fzf-select-widget]='-p 70%'
      FZF_WIDGET_TMUX=1

      zinit light ytet5uy4/fzf-widgets

  # }}}

  zi0a lucid atload"_zsh_autosuggest_start"
  zinit light zsh-users/zsh-autosuggestions

  zinit load zdharma/zinit-configs
  # zinit-configs

  # nvm
  export NVM_AUTO_USE=true
  zinit ice wait"1" lucid
  zinit light lukechilds/zsh-nvm

  # exa
  zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
  zinit light ogham/exa
  zinit ice wait blockf atpull'zinit creinstall -q .'

  # delta
  zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"
  zinit light 'dandavison/delta'

  # bat
  zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
  zinit light sharkdp/bat

  # bat-extras
  zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
  zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
  zinit light eth-p/bat-extras

  # alias rg=batgrep.sh
  alias bd=batdiff.sh
  # alias man=batman.sh

  # ripgrep
  zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
  zinit light BurntSushi/ripgrep

  # glow
  zinit ice from from'gh-r' bpick'*x_x86*'
  zinit light charmbracelet/glow

  # lazygit
  zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
  zinit light 'jesseduffield/lazygit'

  # lazydocker
  zinit ice lucid wait"0" as"program" from"gh-r" mv"lazydocker* -> lazydocker" atload"alias lg='lazydocker'"
  zinit light 'jesseduffield/lazydocker'

  # ranger
  zinit ice depth'1' as"program" pick"ranger.py"
  zinit light ranger/ranger

  # fd
  zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
  zinit light sharkdp/fd

  # gh-cli
  zinit ice lucid wait"0" as"program" from"gh-r" pick"usr/bin/gh"
  zinit light "cli/cli"

  # tmux
  zinit ice from"gh-r" as"program" mv"tmux* -> tmux" pick"tmux" atload"alias tmux=tmux"
  zinit light tmux/tmux

  # bit
  zinit ice lucid wait"0" as"program" from"gh-r" pick"bit"
  zinit light "chriswalz/bit"

  # tree-sitter
  zinit ice as"program" from"gh-r" mv"tree* -> tree-sitter" pick"tree-sitter"
  zinit light tree-sitter/tree-sitter

  # xurls
  zinit ice as"program" from"gh-r" mv"xurls* -> xurls" pick"xurls"
  zinit light mvdan/xurls

  # prettyping
  zinit ice lucid wait'' as"program" pick"prettyping" atload'alias ping=prettyping'
  zinit load "denilsonsa/prettyping"

  # zsh diff so fancy
  zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
  zinit light zdharma/zsh-diff-so-fancy

  # git-flow
  zinit light petervanderdoes/git-flow-completion

  # Git extensions {{{

    # only used in fzf previews because delta's colors get messed up there
    zi0a has'perl' as'program' pick'bin/git-dsf'
    zinit light zdharma/zsh-diff-so-fancy

    zi0a
    zinit light wfxr/emoji-cli

    zi0a as'program' has'git' pick"$ZPFX/bin/git-*" make "PREFIX=$ZPFX"
    zinit light tj/git-extras

    zi0b as'completion' has'git-extras' blockf
    zinit snippet https://github.com/tj/git-extras/blob/master/etc/git-extras-completion.zsh

  # }}}
