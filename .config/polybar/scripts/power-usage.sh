#!/bin/zsh

echo $(( $(cat /sys/class/power_supply/BAT0/power_now) / 1000000.0 ))
