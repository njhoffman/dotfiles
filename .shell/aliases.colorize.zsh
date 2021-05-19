#!/usr/bin/env zsh

export GRC='grc -es --colour=on'

if [ "$TERM" = dumb ] || (( ! $+commands[grc] ))
then
  return
fi

# Supported commands
cmds=(
  as
  ant
  blkid
  cc
  configure
  curl
  cvs
  df
  diff
  dig
  dnf
  docker
  docker-compose
  docker-machine
  du
  env
  fdisk
  findmnt
  free
  g++
  gas
  gcc
  getfacl
  getsebool
  gmake
  id
  ifconfig
  iostat
  ip
  iptables
  iwconfig
  kubectl
  last
  ldap
  lolcat
  ld
  ls
  lsattr
  lsblk
  lsmod
  lspci
  mtr
  mvn
  ntpdate
  php
  ping
  ping6
  proftpd
  ps
  sar
  semanage
  sensors
  showmount
  sockstat
  ss
  stat
  traceroute
  traceroute6
  tune2fs
  ulimit
  uptime
  vmstat
  wdiff
  whois
  whois
)

setopt COMPLETE_ALIASES

# Set alias for available commands.
for cmd in $cmds ; do
  if (( $+commands[$cmd] )) ; then
    $cmd() {
      grc --colour=auto ${commands[$0]} "$@"
    }
    # Prevent grc aliases from overriding zsh completions.
    # alias $cmd="grc --colour=on ${commands[$0]} $cmd"
  fi
done

# Clean up variables
unset cmds cmd

function _cz {
  "$@" | ccze -A
}
