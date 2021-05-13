# zsh-autoenv: execute .autoenv.zsh automatically on directory enter
# autoenv-edit: if [[ $autoenv_event == 'enter' ]]; then autostash AWS_PROFILE="east-2"

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "Tarrasch/zsh-autoenv"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light Tarrasch/zsh-autoenv
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi



