#!/bin/bash
set -e

VSTS_AGENT_TAG=$1

cd "$(dirname $0)"

while read DOCKER_VERSION na; do
  TAG=${VSTS_AGENT_TAG}-docker-$DOCKER_VERSION
  docker push microsoft/vsts-agent:$TAG
done < <(cat versions | sed 's/\r//')
