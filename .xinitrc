#!/bin/bash
# executed by startx (run your window manager from here)

# wal -i "$(< "${HOME}/.cache/wal/wal")"

mkdir -p "$HOME/.local/log"
suffix=$(date "+%m.%d")
logx11="$HOME/.local/log/xinit.$suffix.log"

userresources=$HOME/.Xresources
userdefaults=$HOME/.Xdefaults
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

echo -e "$(date) \t Starting xinitrc script in desktop environment: $DESKTOP_SESSION" >> "$logx11"

#  xrandr --dpi 184
monitorsnum=$(xrandr --listmonitors | head -n 1 | awk -F ': ' '{print $2}')
echo -e "$(date) \t Initializing $monitorsnum monitors for ${HOST}" >> "$logx11"

# TODO: find a better way to do this, ensure node_modules is installed for mon-config
nodepath="$HOME/.nvm/versions/node/v14.8.0/bin/node"

if [[ -d "$HOME/bin/mon-config"  && -x "$nodepath" ]]; then
  # `$HOME/bin/mon-cfg xrandr`
  mon_export=$("$nodepath" "$HOME/bin/mon-config/lib/index.js" env)
  export MON_CFG="$mon_export"
  echo -e "$(date) \t Using monitor configuration $mon_export" >> "$logx11"

  IFS=":"; set -f
  other_exports=(`"$nodepath" "$HOME/bin/mon-config/lib/index.js" exports`)
  export MON_CFG_EXPORTS="$other_exports"
  for other_export in "${other_exports[@]}"; do
    export "$other_export"
    # echo "$other_export"
  done
  IFS=" "; set +f

  # export POLYBAR_WIRELESS="wlx00c0ca35dbc6"
  xrandr --output DP-4 --primary --pos 0x0
  xrandr --output HDMI-0 --pos 3840x0
  xrandr --output HDMI-0 --scale 0.65x0.65 --output DP-2 --scale 0.65x0.65 --pos 3840x1404
fi

# xrandr --output eDP-0 --primary --pos 0x0
# xrandr --output HDMI-0 --pos 2880x0
# xrandr --output HDMI-0 --scale 0.75x0.75 --output DP-2 --scale 0.75x0.75 --pos 3840x1620
# office desktop  setup
# TODO: don't do this if not loading with i3
# export POLYBAR_WIRELESS="wlx00c0ca35dbc6"
# xrandr --output DP-0 --primary --pos 0x0
# xrandr --output HDMI-0 --pos 3840x0
# xrandr --output HDMI-0 --scale 0.65x0.65 --output DP-2 --scale 0.65x0.65 --pos 3840x1404

# hp laptop setup
# export POLYBAR_WIRELESS="wlo1"
# xrandr --output eDP-1 --primary --scale 1.15x1.15
# xrandr --output HDMI-1 --scale 0.75x0.75 --right-of eDP-1

# lenovo laptop setup
# xrandr --output eDP-1 --primary
# xrandr --output HDMI-1 --left-of eDP-1
# xrandr --output eDP-1 --pos 3840x700

echo $(pwd) > /tmp/whereami

# merge in defaults and keymaps
[[ -f $sysresources ]] && \
  echo -e "$(date) \t Merging system rsources: $sysresources" >> $logx11 && \
  xrdb -merge $sysresources

[[ -f $sysmodmap ]] && \
  echo -e "$(date) \t Merging system modmap: $sysmodmap" >> $logx11 && \
  xmodmap $sysmodmap

# pre-X11R2 way of doings things, loaded each time X11 app runs
# will not load if Xresources if set (.Xdefaults-<hostname> will though)
[[ -f "$userdefaults" ]] && \
  echo -e "$(date) \t Merging user defaults: $userdefaults" >> $logx11 && \
  xrdb -merge "$userdefaults"

[[ -f "$userresources" ]] && \
  echo -e "$(date) \t Merging user resources: $userresources" >> $logx11 && \
  xrdb -merge "$userresources"

[[ -f "$usermodmap" ]] && \
  echo -e "$(date) \t Merging user modmap: $usermodmap" >> $logx11 && \
  xmodmap "$usermodmap"

# execute configured xprograms
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  echo -e "$(date) \t Executing programs in /etc/X11/xinit/xinitrc.d" >> $logx11
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
      echo -e "$(date) \t Running: $f" >> $logx11
      [ -x "$f" ] && . "$f"
    done
    unset f
fi

get_session(){
  local dbus_args=(--sh-syntax --exit-with-session)
  case $1 in
    awesome) dbus_args+=(awesome) ;;
    bspwm) dbus_args+=(bspwm-session) ;;
    budgie) dbus_args+=(budgie-desktop) ;;
    cinnamon) dbus_args+=(cinnamon-session) ;;
    deepin) dbus_args+=(startdde) ;;
    enlightenment) dbus_args+=(enlightenment_start) ;;
    fluxbox) dbus_args+=(startfluxbox) ;;
    gnome) dbus_args+=(gnome-session) ;;
    i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
    jwm) dbus_args+=(jwm) ;;
    kde) dbus_args+=(startkde) ;;
    lxde) dbus_args+=(startlxde) ;;
    lxqt) dbus_args+=(lxqt-session) ;;
    mate) dbus_args+=(mate-session) ;;
    xfce) dbus_args+=(xfce4-session) ;;
    openbox) dbus_args+=(openbox-session) ;;
    *) dbus_args+=($DEFAULT_SESSION) ;;
  esac
  echo -e "dbus-launch ${dbus_args[*]}" >> $logx11
}

# dbus should start automatically with systemd
exec $(get_session)
source /etc/X11/xinit/xinitrc.d/30-dbus

# turn off montior VESA powersaving features
# setterm -blank 0 -powersave off -powerdown 0
setterm -powerdown 0
xset s off
xset -dpms
# wal -R
# synchronize clipboards
autocutsel -fork -selection CLIPBOARD
autocutsel -fork -selection PRIMARY

# only unlock keyring once per session
gnome-keyring-daemon

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# {{{ i3
  # aggregate config files into single file
  echo -e "$(date) \t Running i3 setup" >> $logx11
  echo -e "$(date) \t Initializing i3" >> $logx11
  cat $HOME/.config/i3/conf.d/* > $HOME/.config/i3/config
  echo -e "$(date) \t Aggregated i3 config, starting i3" >> $logx11
  eval $(dbus-launch --sh-syntax)
  # exec /usr/bin/i3 -V -d all >> $logx11
  echo -e "$(date) \t Successfully launched i3" >> $logx11
  echo -e "$(date) \t Successfully setup i3" >> $logx11
# }}}

[[ -x "$HOME/bin/mon-cfg" ]] && `$HOME/bin/mon-cfg notify`
