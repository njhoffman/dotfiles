#!/usr/bin/env bash
set -e

system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
  brew install shellcheck
  brew install shfmt
  brew install llvm
  brew install markdownlint-cli
  fd 'clangd$' /usr/local/ --exec ln -s '{}' "$HOME"/.local/bin | :

  curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-mac.gz | gunzip -f >"$HOME"/.local/bin/rust-analyzer && chmod +x "$HOME"/.local/bin/rust-analyzer

else
  sudo apt-get install -y \
    shellcheck \
    clang-tools \
    ;

  curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-linux.gz | gunzip -f >"$HOME"/.local/bin/rust-analyzer && chmod +x "$HOME"/.local/bin/rust-analyzer
fi

sudo npm install -g -f \
  pyright \
  lua-fmt \
  prettier \
  prettier-plugin-toml \
  markdownlint \
  diagnostic-languageserver \
  typescript typescript-language-server \
  dockerfile-language-server-nodejs \
  ;

pip install --upgrade \
  cmake-language-server \
  ;

# stdpath('data')
dir="$HOME/.local/share/nvim"
mkdir -p "$dir/adapters"
git clone https://github.com/microsoft/vscode-node-debug2.git "$dir/adapters/node"
cd "$dir/adapters/node"
npm install

GO111MODULE=on go get golang.org/x/tools/gopls@latest
