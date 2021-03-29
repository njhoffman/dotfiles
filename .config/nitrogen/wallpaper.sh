#!/bin/bash

cfg_file="$HOME/.config/nitrogen/bg-saved.cfg"

dir1="$HOME/Pictures/1920x1080"
dir2="$HOME/Pictures/3840x2160"

function random_picture {
  files=($(ls $1))
  rand=$(( $RANDOM % ${#files[@]} ))
  echo "$1/${files[$rand]}"
}

# pic1=$(random_picture $dir1)
pic1=$(random_picture $dir2)
pic2=$(random_picture $dir2)
pic3=$(random_picture $dir2)

xin1=$(cat <<EOF
[xin_0]
file=$pic1
mode=3
bgcolor=#000000
EOF
)

xin2=$(cat <<EOF
[xin_1]
file=$pic2
mode=3
bgcolor=#000000
EOF
)

xin3=$(cat <<EOF
[xin_2]
file=$pic3
mode=3
bgcolor=#000000
EOF
)

if [ -f "$cfg_file" ]; then
  echo -e "$xin1\n\n$xin2" > "$cfg_file"
else
  echo "\nERROR: $cfg_file cannot be found\n"
fi
