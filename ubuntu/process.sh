#!/bin/bash
set -e

PROCESS=$1

while read UBUNTU_VERSION LIBICU_VERSION; do
  $PROCESS $UBUNTU_VERSION $LIBICU_VERSION
  derived/docker/$PROCESS.sh ubuntu-$UBUNTU_VERSION "$(pwd)/$UBUNTU_VERSION"
  VSTS_AGENT_VERSIONS="$(cat versioned/versions | grep -v ^# | sed 's/\r//')"
  for VSTS_AGENT_VERSION in $VSTS_AGENT_VERSIONS; do
    $PROCESS $UBUNTU_VERSION $LIBICU_VERSION $VSTS_AGENT_VERSION
    derived/docker/$PROCESS.sh ubuntu-$UBUNTU_VERSION-$VSTS_AGENT_VERSION "$(pwd)/$UBUNTU_VERSION/$VSTS_AGENT_VERSION"
  done
done < <(cat versions | sed 's/\r//')
