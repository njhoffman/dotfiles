#################################[ os_icon: os identifier ]##################################

OS_FGCOLOR=202
HOST_FGCOLOR="%146F"

# [[ "$HOST" == "stretch" ]] && OS_FGCOLOR=196 && HOST_FGCOLOR=124
[[ "$HOST" == "thucydides" ]] && OS_FGCOLOR=50 && HOST_FGCOLOR="%43F"
[[ "$HOST" == "mission1" ]] && OS_FGCOLOR=208 && HOST_FGCOLOR="%130F" # 166, 131, 136

hostname="${HOST_FGCOLOR}${HOST}"
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$OS_FGCOLOR
# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION="%F${P9K_CONTENT}% %{%F{$HOST_FGCOLOR}$HOST%}"
typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT}${hostname}'
# typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=255
# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='%B${P9K_CONTENT}'

  # echo "%{%F{$OS_FGCOLOR}$OS_ICON %} %{%F{$HOST_FGCOLOR}%m%}"

