#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu() {
  cd ubuntu

  dirs() {
    BASE_DIR=$1
    echo $BASE_DIR
    while read TARGET_UBUNTU_VERSION na; do
      if [ -n "$(echo $BASE_DIR | grep ^ubuntu/$TARGET_UBUNTU_VERSION)" ]; then
        echo $BASE_DIR/standard
      fi
    done < <(cat standard/versions | sed 's/\r//')
    while read DOCKER_VERSION na; do
      DOCKER_DIR=$BASE_DIR/docker/$DOCKER_VERSION
      echo $DOCKER_DIR
      while read TARGET_UBUNTU_VERSION na; do
        if [ -n "$(echo $DOCKER_DIR | grep ^ubuntu/$TARGET_UBUNTU_VERSION)" ]; then
          echo $DOCKER_DIR/standard
        fi
      done < <(cat standard/versions | sed 's/\r//')
    done < <(cat docker/versions | sed 's/\r//')
  }

  while read UBUNTU_VERSION na; do
    dirs ubuntu/$UBUNTU_VERSION
    while read VSTS_AGENT_RELEASE na; do
      dirs ubuntu/$UBUNTU_VERSION/${VSTS_AGENT_RELEASE/-/\/}
    done < <(cat tfs/releases | sed 's/\r//')
  done < <(cat versions | sed 's/\r//')

  cd ..
}

${1:-ubuntu}
