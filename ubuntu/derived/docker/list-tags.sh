#!/bin/bash
set -e

VSTS_AGENT_TAG=$1

cd "$(dirname $0)"

while read DOCKER_VERSION na; do
  echo ${VSTS_AGENT_TAG}-docker-$DOCKER_VERSION
done < <(cat versions | sed 's/\r//')
