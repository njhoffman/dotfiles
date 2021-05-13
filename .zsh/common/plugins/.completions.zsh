# standalone completions

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  echo "zplug"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit ice as"completion"
  zinit snippet OMZP::docker/_docker

  zinit ice as"completion"
  zinit snippet OMZP::pass/_pass

  zi0b as'completion' has'git-extras' blockf
  zinit snippet https://github.com/tj/git-extras/blob/master/etc/git-extras-completion.zsh

  zi_completion() {
    zi0a as'completion' blockf "$@"
  }

  zi_completion has'ghq'
  zinit snippet https://github.com/x-motemen/ghq/blob/master/misc/zsh/_ghq

  zi_completion has'tmux' pick'completion/zsh'
  zinit light greymd/tmux-xpanes

  zi_completion has'cargo'
  zinit snippet https://github.com/rust-lang/cargo/blob/master/src/etc/_cargo

  zi_completion has'rustc'
  zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/rust/_rust

  zi_completion has'docker'
  zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

  zi_completion has'rg'
  zinit snippet https://github.com/BurntSushi/ripgrep/blob/master/complete/_rg

  zi_completion has'yadm' mv'yadm.zsh_completion -> _yadm'
  zinit snippet https://github.com/TheLocehiliosan/yadm/blob/master/completion/yadm.zsh_completion

  zi_completion has'tldr' mv'zsh_tealdeer -> _tldr'
  zinit snippet https://github.com/dbrgn/tealdeer/blob/master/zsh_tealdeer

  zi_completion has'pandoc'
  zinit light srijanshetty/zsh-pandoc-completion

  zi_completion has'fzf'
  zinit light chitoku-k/fzf-zsh-completions

  zi_completion has'fd'
  zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/fd/_fd

  zi_completion has'buku'
  zinit snippet https://github.com/jarun/Buku/blob/master/auto-completion/zsh/_buku

  zi_completion has'hub' mv'hub.zsh_completion -> _hub'
  zinit snippet $GOPATH/src/github.com/github/hub/etc/hub.zsh_completion

  zi_completion has'podman'
  zinit snippet $GOPATH/src/github.com/containers/libpod/completions/zsh/_podman

  zi_completion has'wl-copy'
  zinit snippet $GHQ_ROOT/github.com/bugaevc/wl-clipboard/completions/zsh/_wl-copy

  zi_completion has'wl-paste'
  zinit snippet $GHQ_ROOT/github.com/bugaevc/wl-clipboard/completions/zsh/_wl-paste

  # load system completions
  if [ -f /usr/share/zsh/site-functions/_systemctl ]; then
  zi_completion is-snippet for \
    /usr/share/zsh/site-functions/_*ctl
  fi

  # ...don't work right now
  # zi_completion has'exa' mv'completions.zsh -> _exa'
  # zinit snippet https://github.com/ogham/exa/blob/master/contrib/completions.zsh

  # zi_completion has'cht.sh'
  # zinit snippet $XDG_CONFIG_HOME/shell_common/zsh/_cht.sh
  #
  # zi_completion has'youtube-dl' mv'youtube-dl.zsh -> _youtube-dl'
  # zinit snippet $GHQ_ROOT/github.com/ytdl-org/youtube-dl/youtube-dl.zsh

  # zi_completion has'mpv'
  # zinit snippet $GHQ_ROOT/github.com/mpv-player/mpv-build/mpv/etc/_mpv.zsh

  # zi_completion has'alacritty'
  # zinit snippet $GHQ_ROOT/github.com/alacritty/alacritty/extra/completions/_alacritty
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

