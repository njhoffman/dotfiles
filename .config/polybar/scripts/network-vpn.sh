#!/bin/bash

vpn_status=`expressvpn status | sed 's/\x1b\[[0-9;]*m//g'`

expressvpn_status() {
  vpn_status="${vpn_status#Connected to }"

  if [[ "$vpn_status" != "Not connected" ]]; then
    echo "%{T2}$vpn_status%{T-}"
  else
    echo ""
  fi
}

expressvpn_toggle() {
  if [ "$vpn_status" != 'Not connected' ]; then
    expressvpn disconnect
  else
    expressvpn connect
  fi
}

case "$1" in
  --toggle)
    expressvpn_toggle
    ;;
  *)
    expressvpn_status
    ;;
esac
