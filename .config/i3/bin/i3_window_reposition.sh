#!/bin/bash

# move and resize window to edges or center

# TODO: implement center
# TODO: load environment variables
NUM_MONITORS=1
MON_HEIGHT=1080
MON_WIDTH=1920
TOP_OFFSET=30
BORDER_OFFSET=2
CACHE_DIR="$HOME/.cache/window_positions"

DEST="$1"
function usage {
cat << EOF
  USAGE: $0 [location]"
    supported locations:
      half-left, half-right
      third-left, third-middle, third-right
      quarter-top-left, quarter-rop-right, quarter-bottom-left, quarter-bottom-right
EOF
}

if [ -z "$DEST" ]; then
  usage
	exit 1
fi

# get active window data
ACTIVE_WINDOW_DATA=$(xwininfo -id "$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')")
WIN_ID=$(echo "$ACTIVE_WINDOW_DATA" | grep "Window id: " | awk '{print $4}')
WIN_HEIGHT=$(echo "$ACTIVE_WINDOW_DATA" | grep "Height:" | awk '{print $2}')
WIN_WIDTH=$(echo "$ACTIVE_WINDOW_DATA" | grep "Width:" | awk '{print $2}')
X_POS=$(echo "$ACTIVE_WINDOW_DATA" | grep "Absolute upper-left X" | awk '{print$4}')
Y_POS=$(echo "$ACTIVE_WINDOW_DATA" | grep "Absolute upper-left Y" | awk '{print$4}')

# determine which monitor it's on
for i in $(seq 0 $NUM_MONITORS); do
	mon_start=$(( MON_WIDTH*i ))

	if [ "$X_POS" -ge "$mon_start" ]; then
		ACTIVE_MONITOR=$i
	else
		break
	fi
done

# it was 0-indexed, plus one
ACTIVE_MONITOR+=1


if [ -z "$ACTIVE_MONITOR" ]; then
	echo "Unable to determine active monitor. Quitting"
	exit 1
fi

mkdir -p "$CACHE_DIR"
OLD_WINDOW_DATA=$(cat "$CACHE_DIR/$WIN_ID")

echo -e "MONITOR: $ACTIVE_MONITOR, ID: $WIN_ID, X: $X_POS Y: $Y_POS, ${WIN_WIDTH}x${WIN_HEIGHT}"
# echo "OLD: $(echo $OLD_WINDOW_DATA | sed 's/\n/,/g')"

HALF_X_SIZE=$(( MON_WIDTH / 2 ))
HALF_Y_SIZE=$(( MON_HEIGHT / 2 ))
HALF_LEFT_POS=$(( (MON_WIDTH * ACTIVE_MONITOR) - MON_WIDTH + BORDER_OFFSET ))
HALF_RIGHT_POS=$(( (MON_WIDTH * ACTIVE_MONITOR) - HALF_X_SIZE - BORDER_OFFSET ))

THIRD_X_SIZE=$(( MON_WIDTH / 3 ))
THIRD_LEFT_POS=$(( (MON_WIDTH * ACTIVE_MONITOR) - MON_WIDTH + BORDER_OFFSET ))
THIRD_RIGHT_POS=$(( (MON_WIDTH * ACTIVE_MONITOR) - THIRD_X_SIZE - BORDER_OFFSET ))
THIRD_MIDDLE_POS=$(( THIRD_LEFT_POS + THIRD_X_SIZE ))

QUARTER_X_SIZE=$(( HALF_X_SIZE ))
QUARTER_Y_SIZE=$(( MON_HEIGHT / 2 ))
QUARTER_TOP_LEFT_POS=$(( HALF_LEFT_POS + BORDER_OFFSET ))
QUARTER_TOP_RIGHT_POS=$(( HALF_RIGHT_POS - BORDER_OFFSET ))
QUARTER_BOTTOM_LEFT_POS=$(( HALF_LEFT_POS ))
QUARTER_BOTTOM_RIGHT_POS=$(( HALF_RIGHT_POS ))

NEW_WIN_HEIGHT=$(( MON_HEIGHT - TOP_OFFSET - 5 ))

# -e GRAVITY,X_POS,Y_POS,X_WIDTH,Y_WIDTH
case "$DEST" in
	## snapping
	restore)
		[[ -z "$OLD_WINDOW_DATA" ]] && echo "No old window data: $WIN_ID" && exit 1
		old_x=$(echo $OLD_WINDOW_DATA | awk '{print $1}')
		old_y=$(echo $OLD_WINDOW_DATA | awk '{print $2}')
		old_w=$(echo $OLD_WINDOW_DATA | awk '{print $3}')
		old_h=$(echo $OLD_WINDOW_DATA | awk '{print $4}')
		wmctrl -r :ACTIVE: -e 0,$old_x,$old_y,$old_w,$old_h
		;;
	right)
		let left_pos=$(( ($MON_WIDTH*$ACTIVE_MONITOR)-$WIN_WIDTH-$BORDER_OFFSET ))
		wmctrl -r :ACTIVE: -e 0,$left_pos,$Y_POS,$WIN_WIDTH,$WIN_HEIGHT
		;;
	left)
		wmctrl -r :ACTIVE: -e 0,$BORDER_OFFSET,$Y_POS,$WIN_WIDTH,$WIN_HEIGHT
		;;
	top)
		wmctrl -r :ACTIVE: -e 0,$X_POS,$TOP_OFFSET,$WIN_WIDTH,$WIN_HEIGHT
		;;
	bottom)
		let top_pos=$(( MON_HEIGHT * ACTIVE_MONITOR - WIN_HEIGHT - BORDER_OFFSET ))
		wmctrl -r :ACTIVE: -e 0,$X_POS,$top_pos,$WIN_WIDTH,$WIN_HEIGHT
		;;
	center)
		left_pos=$(( (MON_WIDTH * ACTIVE_MONITOR - WIN_WIDTH) / 2 ))
		top_pos=$(( (MON_HEIGHT * ACTIVE_MONITOR - WIN_HEIGHT) / 2 ))
		wmctrl -r :ACTIVE: -e 0,$left_pos,$top_pos,$WIN_WIDTH,$WIN_HEIGHT
		;;
 ## resizing
	full-vertical)
		wmctrl -r :ACTIVE: -e 0,$X_POS,$Y_POS,$WIN_WIDTH,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	half-right)
		wmctrl -r :ACTIVE: -e 0,$HALF_RIGHT_POS,$TOP_OFFSET,$HALF_X_SIZE,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	half-left)
		wmctrl -r :ACTIVE: -e 0,$HALF_LEFT_POS,$TOP_OFFSET,$HALF_X_SIZE,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	third-right)
		wmctrl -r :ACTIVE: -e 0,$THIRD_RIGHT_POS,$TOP_OFFSET,$THIRD_X_SIZE,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	third-middle)
		wmctrl -r :ACTIVE: -e 0,$THIRD_MIDDLE_POS,$TOP_OFFSET,$THIRD_X_SIZE,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	third-left)
		wmctrl -r :ACTIVE: -e 0,$THIRD_LEFT_POS,$TOP_OFFSET,$THIRD_X_SIZE,$NEW_WIN_HEIGHT
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	quarter-top-left)
		wmctrl -r :ACTIVE: -e 0,$QUARTER_TOP_LEFT_POS,$TOP_OFFSET,$QUARTER_X_SIZE,$QUARTER_Y_SIZE
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	quarter-top-right)
		wmctrl -r :ACTIVE: -e 0,$QUARTER_TOP_RIGHT_POS,$TOP_OFFSET,$QUARTER_X_SIZE,$QUARTER_Y_SIZE
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	quarter-bottom-left)
		wmctrl -r :ACTIVE: -e 0,$QUARTER_BOTTOM_LEFT_POS,$HALF_Y_SIZE,$QUARTER_X_SIZE,$QUARTER_Y_SIZE
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
	quarter-bottom-right)
		wmctrl -r :ACTIVE: -e 0,$QUARTER_BOTTOM_RIGHT_POS,$HALF_Y_SIZE,$QUARTER_X_SIZE,$QUARTER_Y_SIZE
		echo -e "$X_POS $Y_POS $WIN_WIDTH $WIN_HEIGHT" > "$CACHE_DIR/$WIN_ID"
		;;
  *)
    usage
    exit 1
    ;;
esac
