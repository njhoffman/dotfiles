# zsh-auto-notify: send notifications when long running tasks completed
# disable_auto_notify enable_auto_notify
zplug "MichaelAquilina/zsh-auto-notify", from:github, if:"(( $+commands[notify-send] ))"

if zplug check MichaelAquilina/zsh-auto-notify; then
  export AUTO_NOTIFY_THRESHOLD=60
  export AUTO_NOTIFY_EXPIRE_TIME=2000
  export AUTO_NOTIFY_IGNORE=("docker node tmux vim nvim fzf fzf-tmux")
  export AUTO_NOTIFY_TITLE="%command has just finished"
  export AUTO_NOTIFY_BODY="Completed in %elapsed seconds with exit code %exit_code"
fi


