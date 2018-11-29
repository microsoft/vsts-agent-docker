#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu() {
  cd ubuntu

  while read UBUNTU_VERSION UBUNTU_RELEASE LIBICU_VERSION; do
    BASE_DIR=$UBUNTU_VERSION

    TARGET_DIR=$BASE_DIR
    mkdir -p $TARGET_DIR

    # Update base image
    sed \
      -e s/'$(UBUNTU_VERSION)'/$UBUNTU_VERSION/g \
      -e s/'$(UBUNTU_RELEASE)'/$UBUNTU_RELEASE/g \
      -e s/'$(LIBICU_VERSION)'/$LIBICU_VERSION/g \
      Dockerfile.template > $UBUNTU_VERSION/Dockerfile
    if [ -n "$(which unix2dos)" ]; then
      unix2dos -q $TARGET_DIR/Dockerfile
    fi
    cp start.sh $TARGET_DIR

    BASE_TAG=ubuntu-$UBUNTU_VERSION

    # Update standard image
    while read TARGET_UBUNTU_VERSION UBUNTU_RELEASE DEFAULT_JDK_VERSION; do
      if [ "$TARGET_UBUNTU_VERSION" == "$UBUNTU_VERSION" ]; then
        TARGET_DIR=$BASE_DIR/standard
        mkdir -p $TARGET_DIR
        sed \
          -e s/'$(VSTS_AGENT_TAG)'/$BASE_TAG/g \
          -e s/'$(UBUNTU_VERSION)'/$UBUNTU_VERSION/g \
          -e s/'$(UBUNTU_RELEASE)'/$UBUNTU_RELEASE/g \
          -e s/'$(DEFAULT_JDK_VERSION)'/$DEFAULT_JDK_VERSION/g \
          standard/Dockerfile.template > $TARGET_DIR/Dockerfile
        if [ -n "$(which unix2dos)" ]; then
          unix2dos -q $TARGET_DIR/Dockerfile
        fi
      fi
    done < <(cat standard/versions | sed 's/\r//')

    # Update docker images
    while read DOCKER_VERSION DOCKER_COMPOSE_VERSION; do
      TARGET_DIR=$BASE_DIR/docker/$DOCKER_VERSION
      mkdir -p $TARGET_DIR
      sed \
        -e s/'$(VSTS_AGENT_TAG)'/$BASE_TAG/g \
        -e s/'$(DOCKER_VERSION)'/$DOCKER_VERSION/g \
        -e s/'$(DOCKER_COMPOSE_VERSION)'/$DOCKER_COMPOSE_VERSION/g \
        docker/Dockerfile.template > $TARGET_DIR/Dockerfile
      if [ -n "$(which unix2dos)" ]; then
        unix2dos -q $TARGET_DIR/Dockerfile
      fi
      # Update docker-standard image
      while read TARGET_UBUNTU_VERSION na; do
        if [ "$TARGET_UBUNTU_VERSION" == "$UBUNTU_VERSION" ]; then
          TARGET_DIR=$TARGET_DIR/standard
          mkdir -p $TARGET_DIR
          sed \
            -e s/'$(VSTS_AGENT_TAG)'/${BASE_TAG}-standard/g \
            -e s/'$(DOCKER_VERSION)'/$DOCKER_VERSION/g \
            -e s/'$(DOCKER_COMPOSE_VERSION)'/$DOCKER_COMPOSE_VERSION/g \
            docker/Dockerfile.template > $TARGET_DIR/Dockerfile
          if [ -n "$(which unix2dos)" ]; then
            unix2dos -q $TARGET_DIR/Dockerfile
          fi
        fi
      done < <(cat standard/versions | sed 's/\r//')
    done < <(cat docker/versions | sed 's/\r//')
  done < <(cat versions | sed 's/\r//')

  tfs() {
    VSTS_AGENT_TAG=$1
    TARGET_DIR=$2
    mkdir -p $TARGET_DIR
    sed \
      -e s/'$(VSTS_AGENT_TAG)'/$VSTS_AGENT_TAG/g \
      -e s/'$(VSTS_AGENT_URL)'/${VSTS_AGENT_URL//\//\\\/}/g \
      tfs/Dockerfile.template > $TARGET_DIR/Dockerfile
    if [ -n "$(which unix2dos)" ]; then
      unix2dos -q $TARGET_DIR/Dockerfile
    fi
    cp tfs/start.sh $TARGET_DIR
  }

  # Update TFS base, standard, docker and docker-standard images
  while read UBUNTU_VERSION LIBICU_VERSION; do
    while read TFS_RELEASE VSTS_AGENT_URL; do
      BASE_DIR=$UBUNTU_VERSION/${TFS_RELEASE/-/\/}
      BASE_TAG=ubuntu-$UBUNTU_VERSION
      VSTS_AGENT_URL=$(eval echo $VSTS_AGENT_URL)
      tfs $BASE_TAG $BASE_DIR
      while read TARGET_UBUNTU_VERSION na; do
        if [ "$TARGET_UBUNTU_VERSION" == "$UBUNTU_VERSION" ]; then
          tfs ${BASE_TAG}-standard $BASE_DIR/standard
        fi
      done < <(cat standard/versions | sed 's/\r//')
      while read DOCKER_VERSION DOCKER_COMPOSE_VERSION; do
        tfs ${BASE_TAG}-docker-$DOCKER_VERSION $BASE_DIR/docker/$DOCKER_VERSION
        while read TARGET_UBUNTU_VERSION na; do
          if [ "$TARGET_UBUNTU_VERSION" == "$UBUNTU_VERSION" ]; then
            tfs ${BASE_TAG}-docker-$DOCKER_VERSION-standard $BASE_DIR/docker/$DOCKER_VERSION/standard
          fi
        done < <(cat standard/versions | sed 's/\r//')
      done < <(cat docker/versions | sed 's/\r//')
    done < <(cat tfs/releases | sed 's/\r//')
  done < <(cat versions | sed 's/\r//')

  cd ..
}

${1:-ubuntu}
