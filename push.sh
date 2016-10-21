#!/bin/bash
set -e

cd "$(dirname $0)"

ubuntu/push.sh

docker push microsoft/vsts-agent:latest
