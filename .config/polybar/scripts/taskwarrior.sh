#!/bin/bash

trim() {
  local max_len=15
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  # limit to 10 characters
  var_size=${#var}
  var="${var:0:$max_len}"
  if (( $var_size > $max_len )); then
    echo -n "$var..."
  else
    echo -n "$var"
  fi
}

active_desc=`task rc.verbose: rc.report.active.columns:description rc.report.active.labels:1 limit:1 active`
active_time=`task rc.verbose: rc.report.active.columns:start.age rc.report.active.labels:1 limit:1 active`
active_project=`task rc.verbose: rc.report.active.columns:project rc.report.active.labels:1 limit:1 active`
active_id=`task rc.verbose: rc.report.active.columns:id rc.report.active.labels:1 limit:1 active`
active_due=`task rc.verbose: rc.report.active.columns:due.relative rc.report.active.labels:1 limit:1 active`
echo "$active_id" > /tmp/tw_polybar_id

clr_project="%{F#88ccbb}"
clr_icon_left="%{F#99ccbb}"
clr_icon_middle="%{F#99ccbb}"
clr_icon_right="%{F#99ccbb}"
clr_title="%{F#4f8787}"
# clr_time="%{F#66aa99}"
clr_time="%{F#bb7700}"
clr_due="%{F#669988}"

if [[ $active_due != "" ]]; then
  section_due="$clr_icon_right$clr_due$active_due"
else
  section_due=""
fi

if [[ $active_desc != '' ]]; then
  echo "\
%{T2}$clr_project$active_project $clr_icon_middle·\
$clr_time`trim $active_time` \
$section_due"
else
  echo ""
fi

