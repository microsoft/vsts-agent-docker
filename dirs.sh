#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu() {
  cd ubuntu

  dirs() {
    BASE_DIR=$1
    echo $BASE_DIR
    while read DOCKER_VERSION na; do
      echo $BASE_DIR/docker/$DOCKER_VERSION
    done < <(cat derived/docker/versions | sed 's/\r//')
  }

  while read UBUNTU_VERSION na; do
    dirs ubuntu/$UBUNTU_VERSION
    while read VSTS_AGENT_RELEASE na; do
      dirs ubuntu/$UBUNTU_VERSION/${VSTS_AGENT_RELEASE/-/\/}
    done < <(cat versioned/releases | sed 's/\r//')
  done < <(cat versions | sed 's/\r//')

  cd ..
}

ubuntu
