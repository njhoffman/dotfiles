#!/bin/bash

function scale_func() {
  curr_monitor=`xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}'`
  scale_num="${1}x${1}"
  xrandr --output "$curr_monitor" --scale "$scale_num"
  pkill -USR1 polybar
}


