# GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
# TODO: make nvim function that loads exact match, fzf if none found
if which fasd >/dev/null; then
  # install fasd hooks and basic aliases in the shell
  eval "$(fasd --init auto)"

  # if there is fzf available use it to search fasd results
  if which fzf >/dev/null; then

    alias v >/dev/null && unalias v
    alias vd >/dev/null && unalias vd
    alias z >/dev/null && unalias z

    # alias v='fasd -e nvim'
    alias a='fasd -a'    # any
    alias s='fasd -si'   # show / search / select
    alias d='fasd -d'    # directory
    alias f='fasd -f'    # file
    alias dd='fasd -sid' # interactive directory selection
    alias ff='fasd -sif' # interactive file selection
    # alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection

    # edit given file or search in recently used files
    function v {
      local file
      test -e "$1" && $EDITOR "$@" && return
      file="$(fasd -Rfl "$*")"
      [[ -z "$file" ]] && file=$(fd --type f . $HOME | fzf-tmux -p 80%)
      $EDITOR "${file}" || $EDITOR "$@"
      # file="$(fasd -Rfl "$*" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || $EDITOR "$@"
    }

    # cd into the directory containing a recently used file
    function vd {
      local dir
      local file
      file="$(fasd -Rfl "$*" | fzf -1 -0 --no-sort +m)" && dir=$(dirname "$file") && cd "$dir"
    }

    # cd into given dir or search in recently used dirs
    function z {
      [ $# -eq 1 ] && test -d "$1" && cd "$1" && return
      local dir
      dir="$(fasd -Rdl "$*" | head -n1)"
      if [[ -n "$dir" ]]
        then cd "${dir}" || return 1
      else
        dir=$(fd --type d . $HOME | fzf-tmux -p 80%)
        cd "${dir}" || return 1
      fi
    }
  fi
fi


