
if [[ -n "$(command -v docker)" ]]; then
  alias docker-compose="COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose"
  alias docker-compose-update="sudo curl -L 'https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)' -o /usr/local/bin/docker-compose"
  alias d-c="docker-compose"
  alias docker-rm-stopped="docker rm \$(docker ps -qa)"
  alias docker-prune="docker system prune --all"
  alias docker-build="DOCKER_BUILDKIT=1 dive build"
  alias d-b="docker-build"
  alias docker-tree="dockviz images -t -l"
  alias docker-tree-all="dockviz images -t"
  alias docker-vis="dockviz containers -d | dot -Tpng -o containers.png"
  alias docker-vis-containers="dockviz containers -d | dot  -Tpng -o containers.png 2>/dev/null && feh containers.png && rm containers.png"
  alias docker-vis-networking="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock leoverto/docker-network-graph | dot  -Tpng -o networking.png && feh networking.png && rm networking.png"
  alias docker-vis-compose="docker run --rm -it --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image docker-compose.yml"
  # logspout docker log aggregator
  alias logspoutd="docker run -d --name='logspout' -e VIRTUAL_HOST=logs.local --volume=/var/run/docker.sock:/var/run/docker.sock --publish=127.0.0.1:8000:80 gliderlabs/logspout"
  alias logspout="curl localhost:8000/logs"
  # lazydocker
  alias lzdocker='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /home/nicholas/.config/lazydocker/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
  # dockviz
  alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
fi

# terraform
alias tshow="stdbuf -i0 -o0 -e0 terraform show -no-color | vimcat -c \"set syn=terraform\""

# aws-shell always load profile
# alias aws-shell='aws-shell --profile "$AWS_PROFILE"'
alias aws="/usr/local/aws-cli/v2/current/bin/aws"

[[ -n "$(command -v helm)" ]] &&
  alias helm-lint="helm lint . && helm template . | kubeval --force-color --strict" &&
  alias helm-score="helm template . | kube-score score -"

alias kube-score-existing='kubectl api-resources --verbs=list --namespaced -o name \
    | xargs -n1 -I{} bash -c "kubectl get {} --all-namespaces -oyaml && echo ---" \
    | kube-score score -'

if [[ -n "$(command -v molecule)" ]];
  alias mol-reload="molecule destroy && molecule converge"
  alias m-r="molecule destroy && molecule converge"
  alias m-c="molecule converge"
  alias m-l="molecule check"
  alias m-t="molecule test"
fi
