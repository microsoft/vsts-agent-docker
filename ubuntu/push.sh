#!/bin/bash

cd "$(dirname $0)"

push() {
  UBUNTU_VERSION=$1
  VSTS_AGENT_VERSION=$3

  if [ -z "$VSTS_AGENT_VERSION" ]; then
    echo docker push microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION
  else
    echo docker push microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION-$VSTS_AGENT_VERSION
  fi
}

. process.sh push
