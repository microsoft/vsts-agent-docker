#!/bin/bash
set -e

cd "$(dirname $0)"

list-tags() {
  UBUNTU_VERSION=$1
  VSTS_AGENT_VERSION=$3

  if [ -z "$VSTS_AGENT_VERSION" ]; then
    echo ubuntu-$UBUNTU_VERSION
  else
    echo ubuntu-$UBUNTU_VERSION-$VSTS_AGENT_VERSION
  fi
}

. process.sh list-tags
