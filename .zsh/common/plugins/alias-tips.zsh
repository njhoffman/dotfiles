
if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "djui/alias-tips"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light djui/alias-tips
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi


