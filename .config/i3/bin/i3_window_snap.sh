#!/bin/bash

# move window to edges or center

# TODO: support multi-monitor by geting monitor resolutions from env config
NUM_MONITORS=1
MON_RESOLUTION=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
MON_WIDTH=$(echo $MON_RESOLUTION | awk -F "x" '{print $1}')
MON_HEIGHT=$(echo $MON_RESOLUTION | awk -F "x" '{print $2}')
TOP_OFFSET=30
BORDER_OFFSET=2

# get active window data
ACTIVE_WINDOW_DATA=`xwininfo -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')`
X_POS=`echo "$ACTIVE_WINDOW_DATA" | grep "Absolute upper-left X" | awk '{print$4}'`
Y_POS=`echo "$ACTIVE_WINDOW_DATA" | grep "Absolute upper-left Y" | awk '{print$4}'`
WIN_WIDTH=`echo "$ACTIVE_WINDOW_DATA" | grep "Width" | awk '{print$2}'`
WIN_HEIGHT=`echo "$ACTIVE_WINDOW_DATA" | grep "Height" | awk '{print$2}'`

# determine which monitor it's on
for i in `seq 0 $NUM_MONITORS`; do
  let MON_START=$MON_WIDTH*$i

  if [ $X_POS -ge $MON_START ]; then
    ACTIVE_MONITOR=$i
  else
    break
  fi
done

# it was 0-indexed, plus one
let ACTIVE_MONITOR+=1

echo "ACTIVE MONITOR: $ACTIVE_MONITOR"
if [ -z "$ACTIVE_MONITOR" ]; then
  echo "Unable to determine active monitor. Quitting"
  exit 1
fi


function _snap {
  # notify-send "Snapping window $1"
  echo "X: $X_POS Y: $Y_POS"
  echo "WIDTH: $WIN_WIDTH HEIGHT: $WIN_HEIGHT"
  echo "Snapping: $1"
  wmctrl -r :ACTIVE: -e 0,$2,$3,$4,$5
}

function usage {
  cat << EOF
  USAGE: $0 [location]"
    supported locations: top, bottom, left, right, center
EOF
}

if [ -z "$1" ]; then
  usage
  exit 1
fi

dest="$1"

case "$dest" in
  right)
    let LEFT_POS=($MON_WIDTH*$ACTIVE_MONITOR)-$WIN_WIDTH-$BORDER_OFFSET
    _snap $dest $LEFT_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT
    ;;
  left)
    _snap $dest $BORDER_OFFSET $Y_POS $WIN_WIDTH $WIN_HEIGHT
    ;;
  top)
    _snap $dest $X_POS $TOP_OFFSET $WIN_WIDTH $WIN_HEIGHT
    ;;
  bottom)
    let TOP_POS=$MON_HEIGHT*$ACTIVE_MONITOR-$WIN_HEIGHT-$BORDER_OFFSET
    _snap $dest $X_POS $TOP_POS $WIN_WIDTH $WIN_HEIGHT
    ;;
  center)
    let LEFT_POS=($MON_WIDTH*$ACTIVE_MONITOR-$WIN_WIDTH)/2
    let TOP_POS=($MON_HEIGHT*$ACTIVE_MONITOR-$WIN_HEIGHT)/2
    _snap $dest $LEFT_POS $TOP_POS $WIN_WIDTH $WIN_HEIGHT
    ;;
  *)
    usage
    exit 1
    ;;
esac
