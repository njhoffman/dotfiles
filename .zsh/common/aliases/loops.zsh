
# common loop commands
# alias lp_docker="loop \"docker ps -a | xcols docker_containers\""
alias lp_docker="loop \"dockerps -a\""
# alias lp_containers="loop \"docker ps -a | xcols docker_containers\""
alias lp_containers="loop \"dockerps -a\""
# alias lp_images="loop \"docker images | xcols docker_images\""
alias lp_images="loop \"dockerimages\""
alias lp_images_all="loop \"dockerimages -a\""
# alias lp_netstat="loop \"sudo netstat -4 -tlnp | sort | xcols netstat\""
# alias lp_netstat_all="loop \"sudo netstat -4 -tulnp | sort | xcols netstat\""
alias lp_netstat="loop \"grc -es --colour=on -c conf.netstat netstat -4 -tlnp | sort\""
alias lp_netstat_all="loop \"grc -es --colour=on -c conf.netstat sudo netstat -4 -tulnp | sort\""
alias lp_ps="loop \" ps u | xcols ps\""
alias lp_psx="loop \" ps ux | xcols ps\""
alias lp_psa="loop \" ps aux | xcols ps\""

