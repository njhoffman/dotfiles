FROM ubuntu:20.04

ARG USER_ID
ARG GROUP_ID
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL

ENV TERM xterm

RUN apt-get update && \
  apt-get -qq -y install software-properties-common && \
  add-apt-repository universe && \
  apt-get update && \
  apt-get -qq -y upgrade && \
  DEBIAN_FRONTEND=noninteractive TZ=America/Chicago apt-get -qq -y install \
  locales gcc g++ make zsh curl wget git fd-find neovim tmux zip tzdata \
  python2 python3 python3-pip python3-neovim g++ ruby-full postgresql-client

# pip2 and python2-neovim
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
  python2 get-pip.py && \
  rm get-pip.py && \
  pip2 install neovim

# bat install
ENV BAT_VER 0.17.1
RUN curl -fLO https://github.com/sharkdp/bat/releases/download/v${BAT_VER}/bat_${BAT_VER}_amd64.deb && \
  dpkg -i ./bat_${BAT_VER}_amd64.deb && \
  rm ./bat_${BAT_VER}_amd64.deb

RUN apt-get -qq download ripgrep && \
  dpkg --force-overwrite -i ripgrep*.deb

RUN ln -s /usr/bin/fdfind /usr/bin/fd

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# golang install
ENV GO_VER 1.15.7
WORKDIR /usr/local
RUN curl -fLO https://golang.org/dl/go${GO_VER}.linux-amd64.tar.gz && \
  tar -xvf go${GO_VER}.linux-amd64.tar.gz && \
  rm go${GO_VER}.linux-amd64.tar.gz

# exa install
ENV EXA_VER 0.9.0
RUN mkdir -p /usr/local/bin && \
  cd /usr/local/bin && \
  curl -fLO https://github.com/ogham/exa/releases/download/v${EXA_VER}/exa-linux-x86_64-${EXA_VER}.zip && \
  unzip exa-linux-x86_64-${EXA_VER}.zip && \
  ln -s exa-linux-x86_64 exa && \
  rm exa-linux-x86_64-${EXA_VER}.zip && \
  cd -

# install task
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

# install migrate
RUN curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add - && \
  echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list && \
  apt-get update && \
  apt-get install -y migrate

# neovim helpers
RUN pip2 install --upgrade pynvim && \
  pip3 install --upgrade pynvim && \
  gem install neovim

# set up user and environment
RUN addgroup --gid $GROUP_ID user && \
  adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

RUN chsh -s /usr/bin/zsh user

USER user

ENV HOME /home/user
ENV PATH "/usr/local/go/bin:$PATH"

WORKDIR "$HOME"

# golang based utils and user environment
ENV GOPATH "$HOME/go"
ENV PATH "$GOPATH:$PATH"
ENV GOBIN "$GOPATH/bin"
RUN go get -u github.com/mitranim/gow && \
  go get -u github.com/acepukas/essence

# install Oh-My-ZSH
RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true

# copy dotfiles
  COPY --chown=user:user dotfiles .

# set git config options for user
RUN if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then \
    git config --global user.name "$GIT_USER_NAME"; \
    git config --global user.email "$GIT_USER_EMAIL"; \
  fi

# tmux
ENV TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/tpm"
RUN mkdir -p "$HOME/.tmux/plugins" && \
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" && \
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"

# build bat cache now that .config/bat/config is installed
RUN bat cache --build

# install nvm/Node.js
ENV NODE_VER "14.15.4"
ENV PROFILE "$HOME/.zshrc"
ENV NVM_DIR "$HOME/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
  . "$NVM_DIR/nvm.sh" && \
  nvm install "$NODE_VER" && \
  nvm use node && \
  npm install --global yarn && \
  yarn global add neovim
ENV PATH "$HOME/.nvm/versions/node/v$NODE_VER/bin:$PATH"

# install plug.vim
WORKDIR "$HOME/.config/nvim/autoload"
RUN curl -fLO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
WORKDIR "$HOME"

# install vim plugins
RUN nvim --headless +PlugInstall +qall

# install vim-go plugin dependencies
RUN nvim --headless +GoInstallBinaries +qall

# install coc.nvim extensions
RUN mkdir -p "$HOME/.config/coc/extensions"
WORKDIR "$HOME/.config/coc/extensions"
RUN if [ ! -f package.json ] ; then echo '{"dependencies": {}}' > package.json ; fi && \
  npm install \
  coc-eslint \
  coc-prettier \
  coc-pairs \
  coc-ultisnips \
  coc-tsserver \
  coc-json \
  coc-html \
  coc-css \
  coc-fzf-preview \
  coc-go \
  --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

WORKDIR "$HOME/app"
