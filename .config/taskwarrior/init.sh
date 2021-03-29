#!/bin/bash
# https://bobswift.atlassian.net/wiki/spaces/ACLI/pages/98009238/CLI+Client+Installation+and+Use
only_on_new_tasks = False

apt-get install -y \
  libjson-perl
  timewarrior
  task

mkdir -p $HOME/.local/src
cd $HOME/.local/src
git clone https://github.com/ValiValpas/taskopen
make PREFIX=/usr
make PREFIX=/usr install

