[[ ! -d ~/.asdf ]] &&
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf && cd ~/.asdf && \
  git checkout "$(git describe --abbrev=0 --tags)"

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "kiurchv/asdf.plugin.zsh", defer:2
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light kiurchv/asdf.plugin
  echo "zinit"
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

