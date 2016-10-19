#!/bin/bash

VSTS_AGENT_TAG=$1
BASE_DIR=$2
if [ -z "$BASE_DIR" ]; then
  BASE_DIR=$VSTS_AGENT_TAG
  VSTS_AGENT_TAG=
else
  VSTS_AGENT_TAG=${VSTS_AGENT_TAG}-
fi

cd $(dirname $0)

while read DOCKER_VERSION na; do
  docker build -t microsoft/vsts-agent:${VSTS_AGENT_TAG}docker-$DOCKER_VERSION $BASE_DIR/docker/$DOCKER_VERSION
  ../standard/build.sh ${VSTS_AGENT_TAG}docker-$DOCKER_VERSION "$BASE_DIR/docker/$DOCKER_VERSION"

done < <(cat versions | sed 's/\r//')
