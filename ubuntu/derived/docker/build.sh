#!/bin/bash
set -e

VSTS_AGENT_TAG=$1
BASE_DIR="$2"

cd "$(dirname $0)"

while read DOCKER_VERSION na; do
  TAG=${VSTS_AGENT_TAG}-docker-$DOCKER_VERSION
  TARGET_DIR="$BASE_DIR/docker/$DOCKER_VERSION"
  docker build -t microsoft/vsts-agent:$TAG "$TARGET_DIR"
done < <(cat versions | sed 's/\r//')
