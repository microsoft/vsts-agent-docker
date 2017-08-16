#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu() {
  cd ubuntu

  update() {
    UBUNTU_VERSION=$1
    LIBICU_VERSION=$2
    VSTS_AGENT_RELEASE=$3
    VSTS_AGENT_VERSION=$4

    TEMPLATE_DIR=.
    TARGET_DIR=$UBUNTU_VERSION
    VSTS_AGENT_TAG=ubuntu-$UBUNTU_VERSION
    if [ -n "$VSTS_AGENT_RELEASE" ]; then
      TEMPLATE_DIR=versioned
      TARGET_DIR=$TARGET_DIR/${VSTS_AGENT_RELEASE/-/\/}
      VSTS_AGENT_TAG=$VSTS_AGENT_TAG-$VSTS_AGENT_RELEASE
    fi

    mkdir -p $TARGET_DIR

    sed \
      -e s/'$(UBUNTU_VERSION)'/$UBUNTU_VERSION/g \
      -e s/'$(LIBICU_VERSION)'/$LIBICU_VERSION/g \
      -e s/'$(VSTS_AGENT_VERSION)'/$VSTS_AGENT_VERSION/g \
      $TEMPLATE_DIR/Dockerfile.template > $TARGET_DIR/Dockerfile
    if [ -n "$(which unix2dos)" ]; then
      unix2dos -q $TARGET_DIR/Dockerfile
    fi
    cp $TEMPLATE_DIR/start.sh $TARGET_DIR

    while read TARGET_UBUNTU_VERSION UBUNTU_RELEASE DEFAULT_JDK_VERSION; do
      if [ "$UBUNTU_VERSION" == "$TARGET_UBUNTU_VERSION" ]; then
        STANDARD_DIR=$TARGET_DIR/standard
        mkdir -p $STANDARD_DIR
        sed \
          -e s/'$(VSTS_AGENT_TAG)'/$VSTS_AGENT_TAG/g \
          -e s/'$(UBUNTU_RELEASE)'/$UBUNTU_RELEASE/g \
          -e s/'$(DEFAULT_JDK_VERSION)'/$DEFAULT_JDK_VERSION/g \
          derived/standard/Dockerfile.template > $STANDARD_DIR/Dockerfile
        if [ -n "$(which unix2dos)" ]; then
          unix2dos -q $STANDARD_DIR/Dockerfile
        fi
      fi
    done < <(cat derived/standard/versions | sed 's/\r//')

    while read DOCKER_VERSION DOCKER_COMPOSE_VERSION; do
      DOCKER_DIR=$TARGET_DIR/docker/$DOCKER_VERSION
      mkdir -p $DOCKER_DIR
      sed \
        -e s/'$(VSTS_AGENT_TAG)'/$VSTS_AGENT_TAG/g \
        -e s/'$(DOCKER_VERSION)'/$DOCKER_VERSION/g \
        -e s/'$(DOCKER_COMPOSE_VERSION)'/$DOCKER_COMPOSE_VERSION/g \
        derived/docker/Dockerfile.template > $DOCKER_DIR/Dockerfile
      if [ -n "$(which unix2dos)" ]; then
        unix2dos -q $DOCKER_DIR/Dockerfile
      fi

      while read TARGET_UBUNTU_VERSION UBUNTU_RELEASE DEFAULT_JDK_VERSION; do
        if [ "$UBUNTU_VERSION" == "$TARGET_UBUNTU_VERSION" ]; then
          STANDARD_DIR=$DOCKER_DIR/standard
          mkdir -p $STANDARD_DIR
          sed \
            -e s/'$(VSTS_AGENT_TAG)'/$VSTS_AGENT_TAG-standard/g \
            -e s/'$(DOCKER_VERSION)'/$DOCKER_VERSION/g \
            -e s/'$(DOCKER_COMPOSE_VERSION)'/$DOCKER_COMPOSE_VERSION/g \
            derived/docker/Dockerfile.template > $STANDARD_DIR/Dockerfile
          if [ -n "$(which unix2dos)" ]; then
            unix2dos -q $STANDARD_DIR/Dockerfile
          fi
        fi
      done < <(cat derived/standard/versions | sed 's/\r//')
    done < <(cat derived/docker/versions | sed 's/\r//')
  }

  while read UBUNTU_VERSION LIBICU_VERSION; do
    update $UBUNTU_VERSION $LIBICU_VERSION
    while read VSTS_AGENT_RELEASE VSTS_AGENT_VERSION; do
      update $UBUNTU_VERSION $LIBICU_VERSION $VSTS_AGENT_RELEASE $VSTS_AGENT_VERSION
    done < <(cat versioned/releases | sed 's/\r//')
  done < <(cat versions | sed 's/\r//')

  cd ..
}

ubuntu
