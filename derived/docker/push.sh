#!/bin/bash

if [ -z "$2" ]; then
  VSTS_AGENT_TAG=
else
  VSTS_AGENT_TAG=${1}-
fi

cd $(dirname $0)

while read DOCKER_VERSION na; do
  echo docker push microsoft/vsts-agent:${VSTS_AGENT_TAG}docker-$DOCKER_VERSION
done < <(cat versions | sed 's/\r//')
