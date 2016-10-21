#!/bin/bash
set -e

VSTS_AGENT_TAG=$1
BASE_DIR="$2"

cd "$(dirname $0)"

while read DOCKER_VERSION DOCKER_SHA256 DOCKER_COMPOSE_VERSION; do
  TARGET_DIR="$BASE_DIR/docker/$DOCKER_VERSION"

  mkdir -p "$TARGET_DIR"

  sed \
    -e s/'$(VSTS_AGENT_TAG)'/$VSTS_AGENT_TAG/g \
    -e s/'$(DOCKER_VERSION)'/$DOCKER_VERSION/g \
    -e s/'$(DOCKER_SHA256)'/$DOCKER_SHA256/g \
    -e s/'$(DOCKER_COMPOSE_VERSION)'/$DOCKER_COMPOSE_VERSION/g \
    Dockerfile.template > "$TARGET_DIR/Dockerfile"
  if [ -n "$(which unix2dos)" ]; then
    unix2dos -q "$TARGET_DIR/Dockerfile"
  fi

  cp docker-start.sh "$TARGET_DIR"
done < <(cat versions | sed 's/\r//')
