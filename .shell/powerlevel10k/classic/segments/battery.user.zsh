################################[ battery: internal battery ]#################################
# Show battery in red when it's below this level and not connected to power supply.
typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=160
# Show battery in green when it's charging or fully charged.
typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=70
# Show battery in yellow when it's discharging.
typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=100 # 136
# Battery pictograms going from low to high level of charge.
typeset -g POWERLEVEL9K_BATTERY_STAGES=$'\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
# Don't show the remaining time to charge/discharge.
typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

