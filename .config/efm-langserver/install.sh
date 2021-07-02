#!/bin/bash

linters=(
  "black"
  "checkmake"
  "cppcheck"
  "csvlint"
  # "dockerfile-parser",
  # "dockerfile_lint",
  # "dockerfilelint",
  # "dotenv-linter",
  "erb"
  "eslint"
  "fixjson"
  "flake8"
  "gofmt"
  "golint"
  "golangci-lint"
  "hadolint"
  "htmllint",
  "jq"
  "jsonlint"
  "markdownlint"
  "mypy"
  "nvcheck"
  # htmllint
  "pandoc"
  "prettier"
  "pydocstyle"
  "pylint"
  "redpen"
  "restructuredtext-lint"
  "rstcheck"
  "rubocop",
  "rustfmt",
  "shellcheck"
  "shfmt"
  "stylelint"
  "textlint"
  "tflint",
  "vale"
  "vint"
  "yamllint"
)
# erb, rustfmt, csvlint
# checkmake:
#   wget https://packagecloud.io/mrtazz/checkmake/packages/ubuntu/trusty/checkmake_0.1.0-1_amd64.deb
#   go get github.com/mrtazz/checkmake
#   cd $GOPATH/src/github.com/mrtazz/checkmake && make
# nvcheck:
#   go get -u github.com/koron/nvcheck

function install_npm {
  # local npm: textlint, stylelint, eslint
  # eslint: apt, brew, npm
  npm install -g eslint eslint-plugin-babel eslint-plugin-unused-imports babel-eslint eslint-config-prettier eslint-config-airbnb
  #? dockerfile_lint: npm
  npm install -g dockerfile_lint
  npm install -g dockerfilelint
  npm install -g dockerlint
  npm install -g dockerlinter

  # fixjson: npm
  npm install -g fixjson
  # # htmllint: npm
  # npm install -g htmllint
  # jsonlint: apt, brew, npm
  npm install -g jsonlint
  # markdownlint-cli: npm
  npm install -g markdownlint-cli
  # prettier: brew, npm
  npm install -g prettier
  # prettier/plugin-ruby: npm
  npm install -g @prettier/plugin-ruby
  # stylelint: npm
  npm install -g stylelint
  # textlint: npm
  npm install -g textlint
  # htmllint: npm
  npm install -g htmllint-cli
}

function install_pip {
  # black: apt, brew, npm, pip
  pip3 install black
  # flake8: apt, brew, npm, pip
  pip3 install flake8
  # mypy: apt, brew, npm, pip
  pip3 install mypy
  # pylint: apt, brew, pip
  pip3 install pylint
  # pydocstyle: apt, pip
  pip3 install pydocstyle
  # restructuredtext-int: apt (python3-restructuredtext-lint), pip
  pip3 install restructuredtext-lint
  # rstcheck: pip
  pip3 install rstcheck
  # vim-vint: pip
  pip3 install vim-vint
  # yamlint: apt, brew, pip
  pip3 install yamllint
}

function install_gems {
  # rubocop: apt, gems
  gem install rubocop
  # rufo: gems
  gem install rufo
  # golint: apt, gems, npm
  gem install golint
  # gem install gofmt (part of golint?)
}

function install_brew {
  # cpplint: brew, npm
  brew install cpplint
  # cppcheck: apt, brew
  brew install cppcheck
  # jq: apt, asdf, brew, npm, rust
  brew install jq
  # _shellcheck: apt, asdf, brew, npm, rust
  brew install shellcheck
  # shfmt: asdf, brew, rust
  brew install shfmt
  # redpen: brew
  brew install redpen
  # pandoc: apt, brew, npm, rust
  brew install pandoc
  # vale: brew, npm, rust
  brew install vale
  # hadolint: asdf, brew, npm
  brew install hadolint
  # golangci-lint: brew, asdf, npm
  brew install golangci-lint
  # tflint: brew, asdf
  brew install tflint
}

function install_cargo {
  # dockerfile-parser: cargo
  cargo install dockerfile-parser
  # dotenv-linter: brew, cargo, asdf, npm
  cargo install dotenv-linter
}

function install_apt {
  # clang-tidy: apt, npm
  apt-get install clang-tidy
  # clang-format: apt, brew, cargo, npm
  apt-get install clang-format
}

for linter in "${linters[@]}"; do
  if [ ! -x "$(command -v $linter)" ]; then
    echo -e "\t\e[0;33m$linter\e[0m not found"
  fi
done
# go vcheck
# go buf
# excitetranslate
