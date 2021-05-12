[[ ! -d ~/.asdf ]] &&
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf && cd ~/.asdf && \
  git checkout "$(git describe --abbrev=0 --tags)"

zplug "kiurchv/asdf.plugin.zsh", defer:2
