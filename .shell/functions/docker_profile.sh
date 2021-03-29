#!/bin/bash

function docker_profile {
  case "$1" in
    org | original)
      unset -v COMPOSE_DOCKER_CLI_BUILD
      unset -v DOCKER_BUILDKIT
      eval $(minikube docker-env -u)
      export DOCKER_PROFILE=original
      ;;
    minikube)
      # export DOCKER_TLS_VERIFY="1"
      # export DOCKER_HOST="tcp://192.168.49.2:2376"
      # export DOCKER_CERT_PATH="/home/nicholas/.minikube/certs"
      # export MINIKUBE_ACTIVE_DOCKERD="minikube"
      export COMPOSE_DOCKER_CLI_BUILD=1
      export DOCKER_BUILDKIT=1
      eval $(minikube -p minikube docker-env)
      export DOCKER_PROFILE=minikube
      ;;
    *)
      # export DOCKER_HOST="fd://"
      export COMPOSE_DOCKER_CLI_BUILD=1
      export DOCKER_BUILDKIT=1
      eval $(minikube docker-env -u)
      export DOCKER_PROFILE=default
      ;;
  esac
  echo "Set docker profile to $DOCKER_PROFILE"
}

alias dockerpro=docker_profile

docker_profile &>/dev/null

# before minikube start:
# CGroup: /system.slice/docker.service
# └─1448 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

# after minikube start:
# CGroup: /system.slice/docker.service
# ├─ 1448 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
# ├─55658 /usr/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 32768 -container-ip 192.168.49.2 -container-port 8443
# ├─55673 /usr/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 32769 -container-ip 192.168.49.2 -container-port 5000
# ├─55685 /usr/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 32770 -container-ip 192.168.49.2 -container-port 2376
# └─55697 /usr/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 32771 -container-ip 192.168.49.2 -container-port 22
