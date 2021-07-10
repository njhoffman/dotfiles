
# support command

| command                  | config status                            | note                                                                                                                                                                                                                                                                                                                       |
| ------------------------ | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [vim-vint]               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [markdownlint-cli]       | not need config / user config affected   | `.markdownlint.json`, `.markdownlint.yaml (yml)` in the current directory.<br/> `.markdownlintrc` in the project root.<br/> [setting in project root sample](example/efm-langserver/root/.markdownlintrc).                                                                                                                 |
| [textlint]               | user config needed                       | `.textlintrc`, `.textlintrc.js`, `.textlintrc.json`, `.textlintrc.yaml (yml)` or `package.json` textlint section in the project root.                                                                                                                                                                                      |
| [Redpen]                 | not included config / user config needed | `redpen-conf.xml`, `redpen-conf-{lang}.xml` in the current directory.<br/> or in `$REDPEN_HOME/conf` directory.                                                                                                                                                                                                            |
| [Vale]                   | not included config / user config needed | `.vale.ini` in the current directory.<br/> or in `$HOME` directory. <br/> [setting in home sample](example/efm-langserver/home/.vale.ini).                                                                                                                                                                                 |
| [Nvcheck]                | not included config / user config needed | `dict.yml` in the project root.<br/> [sample in vimdoc-jp-working]                                                                                                                                                                                                                                                         |
| [htmllint]               | user config needed                       | ` .htmllintrc` in the project root.<br/> Generate from command at `htmllint init`.                                                                                                                                                                                                                                         |
| [eslint]                 | not need config / user config affected   | `.eslintrc.js`, `.eslintrc.yaml (yml)`, `.eslintrc.json` or `package.json` eslintConfig section in the project root.                                                                                                                                                                                                       |
| [stylelint]              | not included config / user config needed | `.stylelintrc.json` in the project root.                                                                                                                                                                                                                                                                                   |
| [prettier]               | not need config / user config affected   | setting into `package.json` in the project root.                                                                                                                                                                                                                                                                           |
| [flake8]                 | not need config / user config affected   | `setup.cfg`, `tox.ini`, `.flake8` in project root.<br/> `.flake8`, `~/.config/flake8` in home.                                                                                                                                                                                                                             |
| [pylint]                 | not need config / user config affected   | `pylintrc` in project root or upper current directory. <br/> `pylintrc`, `.pylintrc` in current directory. <br/> `.pylintrc` or `.config/pylintrc` in `$HOME` directory.                                                                                                                                                   |
| [mypy]                   | not need config / user config affected   | `mypy.ini`, `setup.cfg` in project root. <br/> `.mypy.ini` in `$HOME` directory.                                                                                                                                                                                                                                           |
| [black]                  | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [pydoctyle]              | not need config / user config affected   | `setup.cfg`, `tox.ini`, `pydocstyle`, `pydocstyle.ini`, `pydocstylerc`, `pydocstylerc.ini` in project root.                                                                                                                                                                                                                |
| [rubocop]                | not need config / user config affected   | `.rubocop.yml` in project root.                                                                                                                                                                                                                                                                                            |
| [rufo]                   | not need config / user config affected   | `.rufo` in project root.                                                                                                                                                                                                                                                                                                   |
| [prettier/plugin-ruby]   | not need config                          | basic support for both install (gem and npm)                                                                                                                                                                                                                                                                               |
| [Cppcheck]               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [ShellCheck]             | not need config / user config affected   | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root).<br/> `.shellcheckrc` in `$HOME` directory. <br/> XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br/> [setting in home sample](example/efm-langserver/home/.shellcheckrc). |
| [shfmt mvdan/sh]         | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [jsonlint]               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [jq]                     | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [fixjson]                | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [yamllint]               | not need config / user config affected   | `.yamllint`, `.yamllint.yaml (yml)` in the current working directory<br/> config in $XDG_CONFIG_HOME `~/.config/yamllint/config`(support?).                                                                                                                                                                                |
| [buf]                    | not need config / user config affected   | `buf.yaml` in the project root. (Windows do not work yet)                                                                                                                                                                                                                                                                  |
| [restructuredtext-lint]  | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [rstcheck]               | not need config / user config affected   | `.rstcheck.cfg` in same or upper directory.<br/> `setup.cfg` in project root.<br/> `.rstcheck.ini` in `$HOME` directory.                                                                                                                                                                                                   |
| [Pandoc]                 | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| †[excitetranslate]       | not need config                          |                                                                                                                                                                                                                                                                                                                            |

| command                                                                  | type                                                                         | lint/format/action | require / limitation              | config status                            | note                                                                                                                                                                                                                                                                                                                       |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ------------------ | --------------------              | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [vim-vint](https://pypi.org/project/vim-vint/)                           | vim                                                                          | lint               | pip                               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [markdownlint-cli](https://www.npmjs.com/package/markdownlint-cli)       | markdown                                                                     | lint, action(fix)  | npm (global)                      | not need config / user config affected   | `.markdownlint.json`, `.markdownlint.yaml (yml)` in the current directory.<br/> `.markdownlintrc` in the project root.<br/> [setting in project root sample](example/efm-langserver/root/.markdownlintrc).                                                                                                                 |
| [textlint](https://www.npmjs.com/package/textlint)                       | text, markdown, html, rst, asciidoc, review, help                            | lint, action(fix)  | npm (local)                       | user config needed                       | `.textlintrc`, `.textlintrc.js`, `.textlintrc.json`, `.textlintrc.yaml (yml)` or `package.json` textlint section in the project root.                                                                                                                                                                                      |
| [Redpen](https://redpen.cc/)                                             | text, markdown, rst, asciidoc, latex, review, help                           | lint               | java                              | not included config / user config needed | `redpen-conf.xml`, `redpen-conf-{lang}.xml` in the current directory.<br/> or in `$REDPEN_HOME/conf` directory.                                                                                                                                                                                                            |
| [Vale](https://github.com/errata-ai/vale)                                | text, markdown, rst, help                                                    | lint               | go                                | not included config / user config needed | `.vale.ini` in the current directory.<br/> or in `$HOME` directory. <br/> [setting in home sample](example/efm-langserver/home/.vale.ini).                                                                                                                                                                                 | | [Nvcheck](https://github.com/koron/nvcheck)                              | text, markdown, rst, help                                                    | lint, action(fix)  | go                                | not included config / user config needed | `dict.yml` in the project root.<br/> [sample in vimdoc-jp-working](https://github.com/vim-jp/vimdoc-ja-working/blob/master/dict.yml).                                                                                                                                                                                      |
| [htmllint](https://www.npmjs.com/package/htmllint-cli)                   | html                                                                         | lint               | npm (global)                      | user config needed                       | ` .htmllintrc` in the project root.<br/> Generate from command at `htmllint init`.                                                                                                                                                                                                                                         |
| [eslint](https://www.npmjs.com/package/eslint)                           | javascript, typescript                                                       | lint, action(fix)  | npm (local)                       | not need config / user config affected   | `.eslintrc.js`, `.eslintrc.yaml (yml)`, `.eslintrc.json` or `package.json` eslintConfig section in the project root.                                                                                                                                                                                                       |
| [stylelint](https://www.npmjs.com/package/stylelint)                     | html, markdown, css, scss, sass, less, sugarss                               | lint, action(fix)  | npm (local)                       | not included config / user config needed | `.stylelintrc.json` in the project root.                                                                                                                                                                                                                                                                                   |
| [prettier](https://www.npmjs.com/package/prettier)                       | typescript, css, less, scss, json, json5, graphql, markdown, vue, yaml, html | action(fix)        | npm (local)                       | not need config / user config affected   | setting into `package.json` in the project root.                                                                                                                                                                                                                                                                           |
| [flake8](https://pypi.org/project/flake8/)                               | python                                                                       | lint               | pip                               | not need config / user config affected   | `setup.cfg`, `tox.ini`, `.flake8` in project root.<br/> `.flake8`, `~/.config/flake8` in home.                                                                                                                                                                                                                             |
| [pylint](https://pypi.org/project/pylint/)                               | python                                                                       | lint               | pip                               | not need config / user config affected   | `pylintrc` in project root or upper current directory. <br/> `pylintrc`, `.pylintrc` in current directory. <br/> `.pylintrc` or `.config/pylintrc` in `$HOME` directory.                                                                                                                                                   |
| [mypy](https://pypi.org/project/mypy/)                                   | python                                                                       | lint               | pip                               | not need config / user config affected   | `mypy.ini`, `setup.cfg` in project root. <br/> `.mypy.ini` in `$HOME` directory.                                                                                                                                                                                                                                           |
| [black](https://pypi.org/project/black/)                                 | python                                                                       | action(format)     | pip                               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [pydoctyle](https://pypi.org/project/pydocstyle/)                        | python                                                                       | lint               | pip                               | not need config / user config affected   | `setup.cfg`, `tox.ini`, `pydocstyle`, `pydocstyle.ini`, `pydocstylerc`, `pydocstylerc.ini` in project root.                                                                                                                                                                                                                |
| [rubocop](https://rubygems.org/gems/rubocop)                             | ruby                                                                         | lint, action(fix)  | bundle install need               | not need config / user config affected   | `.rubocop.yml` in project root.                                                                                                                                                                                                                                                                                            |
| [rufo](https://rubygems.org/gems/rufo/)                                  | ruby                                                                         | format             | bundle install need               | not need config / user config affected   | `.rufo` in project root.                                                                                                                                                                                                                                                                                                   |
| [prettier/plugin-ruby](https://github.com/prettier/plugin-ruby)          | ruby                                                                         | action(format/fix) | bundle install need / npm (local) | not need config                          | basic support for both install (gem and npm)                                                                                                                                                                                                                                                                               |
| [Cppcheck](http://cppcheck.sourceforge.net/)                             | c, cpp                                                                       | lint               |                                   | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [ShellCheck](https://www.shellcheck.net/)                                | sh                                                                           | lint               |                                   | not need config / user config affected   | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root).<br/> `.shellcheckrc` in `$HOME` directory. <br/> XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br/> [setting in home sample](example/efm-langserver/home/.shellcheckrc). |
| [shfmt mvdan/sh](https://github.com/mvdan/sh)                            | sh                                                                           | format             | go                                | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [jsonlint](https://www.npmjs.com/package/jsonlint)                       | json                                                                         | lint               | npm (global)                      | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [jq](https://stedolan.github.io/jq/)                                     | json                                                                         | format             |                                   | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [fixjson](https://www.npmjs.com/package/fixjson)                         | json, json5                                                                  | format             | npm (global)                      | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [yamllint](https://pypi.org/project/yamllint/)                           | yaml                                                                         | lint               | pip                               | not need config / user config affected   | `.yamllint`, `.yamllint.yaml (yml)` in the current working directory<br/> config in $XDG_CONFIG_HOME `~/.config/yamllint/config`(support?).                                                                                                                                                                                |
| [buf](https://github.com/bufbuild/buf)                                   | ProtocolBuffer                                                               | lint               | go                                | not need config / user config affected   | `buf.yaml` in the project root. (Windows do not work yet)                                                                                                                                                                                                                                                                  |
| [restructuredtext-lint](https://pypi.org/project/restructuredtext-lint/) | rst                                                                          | lint               | pip                               | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| [rstcheck](https://pypi.org/project/rstcheck/)                           | rst                                                                          | lint               | pip                               | not need config / user config affected   | `.rstcheck.cfg` in same or upper directory.<br/> `setup.cfg` in project root.<br/> `.rstcheck.ini` in `$HOME` directory.                                                                                                                                                                                                   |
| [Pandoc](https://pandoc.org/)                                            | markdown, rst                                                                | format             |                                   | not need config                          |                                                                                                                                                                                                                                                                                                                            |
| †[excitetranslate](https://github.com/mattn/excitetranslate)            | any (open file is not any defined type)                                      | hover              | go                                | not need config                          |                                                                                                                                                                                                                                                                                                                            |