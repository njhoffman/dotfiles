#!/bin/zsh

declare -A _patterns

_patterns[netstat]='\
  cool \
  "Proto|Recv-Q|Send-Q|Local Address|Foreign Address|State|PID/Program name" \
  "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+" \
  ":[[:digit:]]+" "tcp." "udp." LISTEN ESTABLISHED TIME_WAIT'

_patterns[log]='\
  default \
  error warning info denied filtered'

# TODO: MAC Address: CC:95:D7:E0:CC:C5 (Vizio)
_patterns[nmap]='\
  nmap \
  "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+" \
  "[[:digit:]]{2,5}(?=/tcp)"'

_patterns[escli_ps]='\
  default \
  "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+"'

_patterns[ps]='\
  default \
  "USER|PID|%CPU|%MEM|VSZ|RSS|TTY|STAT|START|TIME|COMMAND" \
  "[[:digit:]]{4,6}(?=\s+[[:digit:]]{1,2}\.[[:digit:]])" \
  "[[:digit:]]{2}\.[[:digit:]]"'

_patterns[docker_images]='\
  default \
  "REPOSITORY|TAG|IMAGE ID|CREATED|SIZE" \
  " [[:alnum:]]{12} "'

_patterns[docker_containers]='\
  default \
  "CONTAINER ID|IMAGE|COMMAND|CREATED|STATUS|PORTS|NAMES" \
  "^[[:alnum:]]{12} " \
  "Up .*days|Up .*seconds|Up .*minute" "[[:digit:]]{2,5}(?=/tcp)" \
  ":[[:digit:]]{2,5}"'

_patterns[docker_machines]='\
  default \
  "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+"'

_patterns[docker_compose_images]='\
  default \
  "Container|Repository|Tag|Image Id|Size" "^[[:alnum:]]{12} "'

_patterns[docker_compose_containers]='\
  default \
  "Name|Command|State|Ports" ":[[:digit:]]{2,5}"'

