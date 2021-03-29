#!/bin/bash
# script for intel_backlight control (xbacklight not supported)
# use: i3_brightness 1060

# ACPI may add its own backlight control, edit /etc/default/grub, change:
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
# to: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video.use_native_backlight=1"
# sudo update-grub

# chmod g=rw,o=rw /sys/class/backlight/intel_backlight/brightness
curr_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)

num="$1"

# if [[ "${1:0:1}" == "+" || "${1:0:1}" == "-" ]]; then
#   num="${num:1}"
# fi

if [[ "${1:(-1)}" == "%" ]]; then
  num=${num:0:-1}
  if [[ "${1:0:1}" == "+" ]]; then
    num="${num:1}"
    num=$(( $curr_brightness + ($max_brightness * $num / 100) ))
  elif [[ "${1:0:1}" == "-" ]]; then
    num="${num:1}"
    num=$(( $curr_brightness - ($max_brightness * $num / 100) ))
  else
    num=$(( $max_brightness * $num / 100 ))
  fi
fi

echo $num | tee /sys/class/backlight/intel_backlight/brightness
