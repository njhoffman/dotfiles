if [[ $autoenv_event == "enter" ]]; then
  autostash GIT_DIR=$HOME/.cfg
  autostash GIT_WORK_TREE=$HOME
fi
