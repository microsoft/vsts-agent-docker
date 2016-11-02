#!/bin/bash
set -e

cd "$(dirname $0)"

push() {
  UBUNTU_VERSION=$1
  VSTS_AGENT_VERSION=$3
  VSTS_AGENT_RELEASE=$4

  if [ -z "$VSTS_AGENT_VERSION" ]; then
    docker push microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION
  elif [ "$VSTS_AGENT_VERSION" != "$VSTS_AGENT_RELEASE" ]; then
    docker push microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION-$VSTS_AGENT_RELEASE
  fi
}

. process.sh push
