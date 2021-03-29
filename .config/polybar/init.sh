#!/bin/bash

# fit in battery, mpd, visualizer?, ip address, wifi name
# fix app menu
# icons for workspaces

### themes

## top laptop
powermenu i3 window-title membar cpugraph date time wifi

## top/bottom laptop
powermenu i3 window-title membar cpugraph date time wifi
appmenu i3 diskfree pulsevolume date time

## top desktop
## top/bottom desktop


# https://github.com/polybar/polybar/wiki/Compiling

apt-get install -y \
  cairo \
  libxcb \
  python2 \
  xcb-proto \
  xcb-util-image \
  xcb-util-wm

apt-get install -y \
  libjsoncpp-dev \ # required by inernal/i3
  i3-wm \          # required by internal/i3
  libpulse-dev \   # required by inernal/pulseaudio
