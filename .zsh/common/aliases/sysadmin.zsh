## sysadmin defaults
## All of our servers eth1 is connected to the Internets via vlan / router etc  ##
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'

# # Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
# alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"
# # Reboot tomato based Asus NT16 wireless bridge
# alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"
#
alias myps='ps -fHu $USER'     # if not $USER, try $LOGIN
alias myports="netstat -lntp 2>/dev/null | grep -v ' - *$'"  # Linux only?

## safety nets ##
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'

alias sysl="sudo systemctl list-unit-files"
alias sysr="sudo systemctl restart"
alias syss="sudo systemctl status"
alias backlight="sudo chmod g=rw,o=rw /sys/class/backlight/intel_backlight/brightness"

# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

alias pip-outdated="pip-review && apt-get list --upgradable" # pip-review --local
alias pip-upgrade-all="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
