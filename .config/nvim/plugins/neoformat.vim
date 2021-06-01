" auto formatting for most file types
Plug 'sbdchd/neoformat'

" :Neoformat
" :Neoformat jsbeauty
" Enable alignment
" format alignment when filetype not known
let g:neoformat_basic_format_align = 0

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" let &verbose            = 1 " also increases verbosity of the editor as a whole
let g:shfmt_opt="-ci"

" Arduino     uncrustify, clang-format, astyle
" Assembly    asmfmt
" Bazel       buildifier
" Beancount   bean-format
" Bib         bibclean
" C           uncrustify, clang-format, astyle
" C#          uncrustify, astyle, clang-format
" C++         uncrustify, clang-format, astyle
" Cabal       cabal-fmt
" CMake       cmake_format
" Crystal     crystal tool format (ships with crystal)
" CSS         css-beautify (ships with js-beautify), prettydiff, stylefmt, stylelint, csscomb, prettier
" CSV         prettydiff
" D           uncrustify, dfmt
" Dart        dartfmt
" Dhall       dhall format
" dune        dune format
" Elixir      mix format
" Elm         elm-format
" Erlang      erlfmt
" Fish        fish_indent
" F#          fantomas
" GDScript    gdformat
" Gleam       gleam format
" Go          gofmt, goimports, gofumpt, gofumports
" GLSL        clang-format
" GraphQL     prettier
" Haskell     stylishhaskell, hindent, hfmt, brittany, sortimports, floskell ormolu
" Puppet      puppet-lint
" PureScript  purty
" HTML        html-beautify (ships with js-beautify), prettier, prettydiff
" Jade        pug-beautifier
" Java        uncrustify, astyle, prettier
" JavaScript  js-beautify, prettier, prettydiff, clang-format, esformatter, prettier-eslint, eslint_d, standard, semistandard, deno fmt,
" JSON        js-beautify, prettydiff, prettier, jq, fixjson
" Kotlin      ktlint, prettier
" LaTeX       latexindent
" Less        csscomb, prettydiff, prettier, stylelint
" Lua         luaformatter lua-fmt lua-format
" Markdown    remark prettier
" Matlab      matlab-formatter-vscode
" Nginx       nginxbeautifier
" Nim         nimpretty (ships with nim)
" Nix         nixfmt nixpkgs-fmt
" Objective-C uncrustify, clang-format, astyle
" OCaml       ocp-indent, ocamlformat
" Pandoc      Markdown pandoc
" Pawn        uncrustify
" Perl        perltidy
" PHP         php_beautifier, php-cs-fixer, phpcbf
" PowerShell  PSScriptAnalyzer, PowerShell-Beautifier
" Proto       clang-format
" Pug         (formally Jade) pug-beautifier
" Python      yapf, autopep8, black, pydevf, isort, docformatter, pyment
" R           styler, formatR
" Reason      refmt bsrefmt
" Ruby        rufo, ruby-beautify, rubocop
" Rust        rustfmt
" Sass        sass-convert, stylelint, csscomb
" Sbt         scalafmt
" Scala       scalariform, scalafmt
" SCSS        sass-convert, stylelint, stylefmt, prettydiff, csscomb, prettier
" Shell       shfmt let g:shfmt_opt="-ci"
" SQL         sqlfmt, sqlformat (ships with sqlparse), pg_format (ships with pgFormatter)
" Starlark    buildifier
" Svelte      prettier-plugin-svelte
" Swift       Swiftformat
" Terraform   terraform,
" TypeScript  tsfmt, prettier, prettier-eslint, tslint, eslint_d, clang-format, deno fmt
" V           v fmt (ships with v)
" VALA        uncrustify
" Vue         prettier
" XHTML       tidy, prettydiff
" XML         tidy, prettydiff, prettier
" YAML        pyaml, prettier
" zig         zig fmt
" zsh         shfmt
