#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu/build.sh

docker tag microsoft/vsts-agent:$(cat latest.tag) microsoft/vsts-agent
