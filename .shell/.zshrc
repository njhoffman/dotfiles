# ====================================================
# user default zsh settings
# ====================================================

home_dir=${(%):-%-2N} # only include two leadining path components
shell_dir="$home_dir/.shell"

# set -u => kills program right away when there's an unreferenced variable
source "$shell_dir/.zshrc.init"

# export _SHELL_INITIALIZED=1
# print -P "  $(_clr 247 "Initializing zsh from from $shell_dir")"
#{{{ load external files


  # shared exports between bash and zsh'
  load_file "$shell_dir/exports.sh"
  # zsh specific exports, options, functions
  load_file "$shell_dir/exports.zsh"
  load_file "$shell_dir/options.zsh"
  load_file "$shell_dir/highlights.zsh"
  load_file "$shell_dir/powerlevel10k/p10k.zsh"

  [ -f "$home_dir/local.zsh" ] && load_file "$home_dir/local.zsh"

  # load_file "$shell_dir/zsh-plugins.zsh"
  load_file "$shell_dir/plugins.zsh"

  load_file "$shell_dir/funcs.zsh"
  # shared aliases between bash and zsh
  load_file "$shell_dir/aliases.sh"
  load_file "$shell_dir/aliases.colorize.sh"
  load_file "$shell_dir/binding.zsh"
#}}}

# fasd
eval "$(fasd --init auto)"

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/bin/colors" ] && export PATH="$HOME/bin/colors:$PATH"

# reassign aliases in case of overwrite (i.e. git plugin of oh-my-zsh)
# load_file "$shell_dir/aliases.sh"

# nitrogen wallpaper changr
# nitrogen --restore

# clear
zle-keymap-select () {
if [ "$TERM" = "xterm-256color" ]; then
  if [ $KEYMAP = vicmd ]; then
    # the command mode for vi
    echo -ne "\e[1 q"
  else
    # the insert mode for vi
    echo -ne "\e[5 q"
  fi
fi
}

# set -u : exit immediately on unreferenced variable
# set -o pipefail : fail entire pipeline if any command returns non-zero (preventing masked errors)
# IFS=$'\n\t' : normal IFS=$' \n\t'
# IFS should be set all the time,  set -u errors  when other scripts are sourced
#   - set +u && source .. && set -u ; set parameter default values ${sdf:-} to prevent non-existant reference errors
#   - in default mode, referencing undefined vars results in an empty string, will error in strict modej
#    if [[ -z "$someVar" ]]; then ... ${someVar:-}
# set -e : exit immediately if any cmmand has non-zero exit status
#   - if in strict mode set +e for expected non-zero returns
#   - i.e. grep matches = 0, no matches = 1, error = 2
#    - set -e can cause scripts to exit before resources are relased, solution is bash exit traps
#   - scratch=$(mktemp -d -t tmp.XXXXXX); function cleanup { rm -rf "$scratch" }; trap cleanup EXIT;
#   - short cicuiting is also a problem: for the COND && COMMAND shortened pattern of if-then-else
#   COND && COMMAND

[[ -f "$somefile" ]] && echo "Found file: $somefile"

get_bash_w() {
  # Returns the same working directory that the \W bash prompt command
  echo $(pwd | sed 's@'"$HOME"'@~@')
}

split_pwd() {
  # Split pwd into the first element, elipsis (...) and the last subfolder
  # /usr/local/share/doc --> /usr/.../doc
  # ~/project/folder/subfolder --> ~/project/../subfolder
  split=2
  W=$(get_bash_w)
  if [ $(echo $W | grep -o '/' | wc -l) -gt $split ]; then
    echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}"
  else
    echo $W
  fi
}
# if [[ -z $_SHELL_INITIALIZED ]]; then
  # twilio autocomplete setup
  TWILIO_AC_ZSH_SETUP_PATH=/home/nicholas/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;

  # load autocompletion scripts
  [[ -x "$(command -v kubectl)" ]] && source <(kubectl completion zsh)
  [[ -x "$(command -v twilio)" ]] && source <(twilio autocomplete:script zsh)
  [[ -x "$(command -v stern)" ]] && source <(stern --completion=zsh)
  fpath=(~/.shell/completions $fpath)
  autoload -U compinit && compinit
  autoload -U bashcompinit && bashcompinit

  complete -C '/usr/local/bin/aws_completer' aws

# fi

#TODO: why have to double assign this?
bindkey '^I' expand-or-complete

# zle clear-screen
#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nicholas/.sdkman"
[[ -s "/home/nicholas/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nicholas/.sdkman/bin/sdkman-init.sh"

# vim: ft=zsh
