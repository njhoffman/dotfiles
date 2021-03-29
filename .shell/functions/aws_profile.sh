#!/bin/bash

# TODO: parse avaliable profiles to check against and list
function aws_profile {
  if [[ -n "$1" ]]; then
    [[ -e "$AWS_PROFILE" ]] && export AWS_PROFILE="default"
    aws1=$(aws configure list)
    export AWS_PROFILE="$1"
    aws2=$(aws configure list)
    colordiff -y --suppress-common-lines <(echo "$aws1") <(echo "$aws2")
  else
    echo "Assigning 'default' to AWS_PROFILE"
    export AWS_PROFILE="default"
    aws configure list
  fi
}
alias awspro=aws_profile

