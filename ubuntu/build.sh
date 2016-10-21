#!/bin/bash
set -e

cd "$(dirname $0)"

build() {
  UBUNTU_VERSION=$1
  VSTS_AGENT_VERSION=$3

  if [ -z "$VSTS_AGENT_VERSION" ]; then
    docker build -t microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION $UBUNTU_VERSION
  else
    docker build -t microsoft/vsts-agent:ubuntu-$UBUNTU_VERSION-$VSTS_AGENT_VERSION $UBUNTU_VERSION/$VSTS_AGENT_VERSION
  fi
}

. process.sh build
