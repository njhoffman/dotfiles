###############################[ public_ip: public IP address ]###############################
# Public IP color.
typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=94
# Custom icon.
# typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

########################[ vpn_ip: virtual private network indicator ]#########################
# VPN IP color.
typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=81
# When on VPN, show just an icon without the IP address.
typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
# Regular expression for the VPN network interface. Run ifconfig while on VPN to see the
# name of the interface.
typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(wg|(.*tun))[0-9]*'
# Icon to show when on VPN.
typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

#########################[ proxy: system-wide http/https/ftp proxy ]##########################
# Proxy color.
typeset -g POWERLEVEL9K_PROXY_FOREGROUND=68
# Custom icon.
# typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='⭐'


