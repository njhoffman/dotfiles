function conky_vars()

    -- Set wifi interface for all scripts here
    var_WIFI = "wlp2s0" --bars & graphs
    --for text
    var_WIFI3 = "Signal ${wireless_link_qual_perc wlp2s0}%"
    var_WIFI2 = "Down  ${downspeed wlp2s0}                        Up  ${upspeed wlp2s0}"

end
