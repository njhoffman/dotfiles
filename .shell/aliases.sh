#!/bin/bash

filepath=$(readlink -f $0)
alias refresh_aliases="source $filepath"

alias ytdl="youtube-dl -4 -x --audio-format mp3"

# alias fuck='sudo $(history -p \!\!)'
alias _="sudo "
alias sudo="sudo "
alias mysudo='sudo -E env "PATH=$PATH"'

alias nix-install=""
alias nixls="grc -c conf.docker-machinels -es --colour=on nix-env --query --status -P --description"
alias nixcomp="grc -c conf.docker-machinels -es --colour=on nix-env --available --query --status -P
--description --compare"

alias neuron="LC_ALL=C neuron -d ~/zettelkasten"
alias zk="zk -W ~/zettelkasten"

alias asynctask="~/bin/asynctask.py"
alias at="~/bin/asynctask.py"
alias at-fzf="~/bin/asynctask.py -f"
alias atf="~/bin/asynctask.py -f"
alias at-list="~/bin/asynctask.py -l"
alias at-list-all="~/bin/asynctask.py -L"

alias db=dotbare
alias dots=dotbare

alias gh-search="ghs repo --sort=stars"

alias bat="bat -p"
# | bat -p -l html
alias pup="pup --color"
alias pup-links="pup --color 'body a attr{href}'"
alias pup-headers="pup --color 'h1,h2,h3,h4,h5,h6 {text}'"
alias pup-links-json="pup --color 'body a json{}' | bat -p -l json"
# directory listing
alias ls="LC_COLLATE=C ls --color=auto"
alias l='LC_COLLATE=C colorls --group-directories-first --almost-all --git-status'
alias ll='LC_COLLATE=C colorls --group-directories-first --almost-all --long --git-status' # detailed list view
# alias l='exa --icons -b --git -1'
# alias ll="exa -a -l -@ -F --icons --color-scale -b -g --extended --git"
alias lt="LC_COLLATE=C colorls --group-directories-first --almost-all --tree"
alias tree="LC_COLLATE=C colorls --tree"
alias grep="grep --color"

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

alias sysl="sudo systemctl list-unit-files"
alias sysr="sudo systemctl restart"
alias syss="sudo systemctl status"

alias scale="scale_func"

alias backlight="sudo chmod g=rw,o=rw /sys/class/backlight/intel_backlight/brightness"

# directory navigation

alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'

# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

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

[[ -d "$HOME/projects/personal/movieman" && -n "$NODE_PATH" ]] \
                                                               && alias mm="node ~/projects/personal/movieman/lib/index.js"

if [[ -d "$HOME/projects/personal/wikiscan" && -n "$NODE_PATH" ]]; then
  alias wikiscan="$HOME/projects/personal/wikiscan/bin/wikiscan.sh"
  alias ws="$HOME/projects/personal/wikiscan/bin/wikiscan.sh"
fi

if [[ -d "$HOME/projects/personal/musicman" && -n "$NODE_PATH" ]]; then
  alias mr="node ~/projects/personal/musicman/cli/lib/cli.js"
  alias mre="node ~/projects/personal/musicman/cli/lib/cli.js edit"
  alias mrp="mpc clear && node ~/projects/personal/musicman/cli/lib/cli.js playlist rating: ./ && mpc load current && mpc play"
  alias mn="mpc n && node ~/projects/personal/musicman/cli/lib/cli.js"
  function mpcf {
    mpc searchadd any "$1" && mpc searchplay "$1"
  }
fi

alias open_command="xdg-open"
alias googler="googler --colors GKmgxy"
alias g="googler --colors GKmgxy -j --first --lucky"
alias gs="googler --colors GKmgxy -j"
alias fakercli="node $HOME/projects/fakercli/lib/index.js"
alias fbt="fb --test"

alias fd="fdfind --hidden -L"
# rg and fdfind no ignore
alias fdi="fdfind --hidden --no-ignore-vcs --no-ignore -L"
alias rg="rg --line-number --hidden --no-heading --color=always --smart-case"
alias rgi="rg --line-number --hidden --no-ignore --no-heading --color=always --smart-case"
alias agi="ag --unrestricted --hidden"

if [ -x "$(command -v ultra)" ]; then
  alias nodes="ultra --monitor"
fi

if [ -x "$(command -v broot)" ]; then
  # alias tree="br -c :pt"
  # deep fuzzy cd, home fuzzy cd, root fuzzy cd
  function dcd {
    br --only-folders --cmd "$1;:cd"
  }
fi

if [ -n "$(command -v histdb)" ]; then
  function _histdb_custom_query {
    histdb --detail --limit 50 "$*" | ccze -A
  }
  alias hist="_histdb_custom_query"
  alias histin="_histdb_custom_query --in"
  alias histat="_histdb_custom_query --at"
fi

alias hexyl="hexyl --border none"
alias hexdump="hexyl --border none"

alias flac2mp3='for file in *.flac; do ffmpeg -i $file -q:a 0 ${file:r}.mp3; done'

alias glava="glava --audio=fifo"
alias xclipb="xclip -selection clipboard"
alias xclipboard="xclip -selection clipboard"

alias jqr="jq -R -r '. as \$line | try fromjson catch \$line'"
alias yqr="yq r -P -C -"

alias helm-lint="helm lint . && helm template . | kubeval --force-color --strict"
alias helm-score="helm template . | kube-score score -"
alias kube-score-existing='kubectl api-resources --verbs=list --namespaced -o name \
    | xargs -n1 -I{} bash -c "kubectl get {} --all-namespaces -oyaml && echo ---" \
    | kube-score score -'

alias vim="nvim"
alias vimdiff="nvim -d"
alias vc="nvimpager -c"
alias vcat="nvimpager -c"
alias vimcat="nvimpager -c"
alias vim-syntax="nvim ~/.config/nvim/test/lsp/**/*.*"

alias tldr="tldr --theme ocean"

# go shortcuts
alias yaegi="rlwrap yaegi"

# if cron fails or if you want backup on demand just run these commands #
# again pass it via sudo so whoever is in admin group can start the job #
# Backup scripts #
# alias backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups'
# alias nasbackup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01'
# alias s3backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01 --auth /home/scripts/admin/.authdata/amazon.keys'
# alias rsnapshothourly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
# alias rsnapshotdaily='sudo  /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
# alias rsnapshotweekly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
# alias rsnapshotmonthly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
# alias amazonbackup=s3backup

# calculator
alias bc="bc -l"

# view versions
alias npm-versions="npm view versions"
alias nmr="rm -r node_modules && npm install"
alias geoiplookup="curl -s https://ipvigilante.com/$(curl -s https://ipinfo.io/ip) | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name'"

alias viewsploit="vimcat /opt/metasploit-framework/modules/$1.rb"

alias tmuxmain="export POWERLINE_CONFIG_OVERRIDES='ext.tmux.theme=main' && tmux -L main"
alias tmuxmin="export POWERLINE_CONFIG_OVERRIDES='ext.tmux.theme=min' && tmux -L min"

alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

# alias gh="$HOME/bin/github"
alias colortest="$HOME/bin/colors/colortest"

alias ttyclock="tty-clock -c -C 4 -b -B -f \"%A %B %e, %G\""

# out to stdout and clipboard
alias cb="tee /dev/tty | xsel"

# average num of lines for glob, i.e. lines *.js
alias lineavg="awk 'END{FNUM=ARGC-1; print (NR-FNUM)/FNUM}'"

## sysadmin defaults
## All of our servers eth1 is connected to the Internets via vlan / router etc  ##
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'

# # Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
# alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"
#
# # Reboot tomato based Asus NT16 wireless bridge
# alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"
#
# # work on wlan0 by default #
# # Only useful for laptop as all servers are without wireless interface
# alias iwconfig='iwconfig wlan0'

alias myps='ps -fHu $USER'                                  # if not $USER, try $LOGIN
alias myports="netstat -lntp 2>/dev/null | grep -v ' - *$'" # Linux only?

# spadash
alias sdmigrate="migrate up -path=migrations -database=postgres://spadash:spadash@localhost:5432/"

# terraform
alias tshow="stdbuf -i0 -o0 -e0 terraform show -no-color | vimcat -c \"set syn=terraform\""

alias cz="ccze -A"

# asynctasks
alias atask="asynctask -f"

## TaskWarrior
alias t='task'
alias tl='task list'
alias tlp='task list project:'
alias tn='task next +READY'
alias ta='task add'
alias tap='task add project:'
alias tmod='task mod'
alias tan='task annotate'
alias tl='task log'
alias tac='task active'

# TaskWarrior reports (use `task timesheet` for a full report)
alias tt='task modified:today completed'
alias ty='task modified:yesterday completed'
alias tey='task end.after:yesterday completed'
alias twork='task context work'
alias tpers='task context personal'
# Show task I completed in the last week
alias tclw='task end.after:today-1wk completed'

## TimeWarrior
alias twst='timew start'
alias twstop='timew stop'
alias tws='timew summary :week'
alias twlw='timew summary :lastweek'
alias twd='timew summary :day'

# aws-shell always load profile
# alias aws-shell='aws-shell --profile "$AWS_PROFILE"'
alias aws="/usr/local/aws-cli/v2/current/bin/aws"

# logspout docker log aggregator
alias ctop="docker run --rm -ti --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"
alias logspoutd="docker run -d --name='logspout' -e VIRTUAL_HOST=logs.local --volume=/var/run/docker.sock:/var/run/docker.sock --publish=127.0.0.1:8000:80 gliderlabs/logspout"
alias logspout="curl localhost:8000/logs"
# lazydocker
alias lzdocker='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /home/nicholas/.config/lazydocker/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
# dockviz
alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

alias docker-compose="COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose"
alias docker-compose-update="sudo curl -L 'https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)' -o /usr/local/bin/docker-compose"
alias dc="docker-compose"
alias docker-rm-stopped="docker rm \$(docker ps -qa)"
alias docker-prune="docker system prune --all"
alias docker-build="DOCKER_BUILDKIT=1 dive build"
alias db="docker-build"
alias docker-tree="dockviz images -t -l"
alias docker-tree-all="dockviz images -t"
alias docker-vis="dockviz containers -d | dot -Tpng -o containers.png"
alias docker-vis-containers="dockviz containers -d | dot  -Tpng -o containers.png 2>/dev/null && feh containers.png && rm containers.png"
alias docker-vis-networking="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock leoverto/docker-network-graph | dot  -Tpng -o networking.png && feh networking.png && rm networking.png"
alias docker-vis-compose="docker run --rm -it --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image docker-compose.yml"
# reset competion system
alias reset_completion="rm ~/.zcompdump && autoload -U compinit && compinit && autoload -U bashcompinit && bashcompinit"

alias pip-outdated="pip-review && apt-get list --upgradable" # pip-review --local
alias pip-upgrade-all="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
# TODO: make nvim function that loads exact match, fzf if none found
if which fasd > /dev/null; then
  # install fasd hooks and basic aliases in the shell
  eval "$(fasd --init auto)"

  # if there is fzf available use it to search fasd results
  if which fzf > /dev/null; then

    alias v > /dev/null && unalias v
    alias vd > /dev/null && unalias vd
    alias z > /dev/null && unalias z

    # alias v='fasd -e nvim'
    alias a='fasd -a'    # any
    alias s='fasd -si'   # show / search / select
    alias d='fasd -d'    # directory
    alias f='fasd -f'    # file
    alias dd='fasd -sid' # interactive directory selection
    alias ff='fasd -sif' # interactive file selection
    # alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection

    # edit given file or search in recently used files
    function v {
      local file
      test -e "$1" && $EDITOR "$@" && return
      file="$(fasd -Rfl "$*")"
      [[ -z "$file" ]] && file=$(fd --type f . $HOME | fzf-tmux -p 80% --query "$@")
      $EDITOR "${file}" || $EDITOR "$@"
      # file="$(fasd -Rfl "$*" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || $EDITOR "$@"
    }

    # cd into the directory containing a recently used file
    function vd {
      local dir
      local file
      file="$(fasd -Rfl "$*" | fzf -1 -0 --no-sort +m)" && dir=$(dirname "$file") && cd "$dir"
    }

    # cd into given dir or search in recently used dirs
    function z {
      [ $# -eq 1 ] && test -d "$1" && cd "$1" && return
      local dir
      dir="$(fasd -Rdl "$*" | head -n1)"
      if [[ -n "$dir" ]]; then
        cd "${dir}" || return 1
      else
        dir=$(fd --type d . $HOME | fzf-tmux -p 80% --query "$@")
        cd "${dir}" || return 1
      fi
    }
  fi
fi

# set two finger and edge scrollling
alias gset-touchpad="gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command '\"'$HOME'/.config/scroll-touchpad\"'"

alias fzp="fzf-tmux -p 80%"
alias adoc-list="grc -es -c conf.dockersearch --colour=auto ansible-doc -l | grep '^\w\+\s'"
alias adoc-list-all="grc -es -c conf.dockersearch --colour=auto ansible-doc -l"
alias adoc="grc -es -c conf.log --colour=auto ansible-doc"

alias weather="curl -s http://wttr.in/"
alias sqlformat="sqlformat --reindent_aligned --keywords upper --identifiers lower"
_script="${BASH_SOURCE:-$0}"
_script=$(readlink --canonicalize-existing $_script)
_file_success $_script
