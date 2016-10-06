#!/bin/bash

cd "$(dirname $0)"

ubuntu/push.sh

docker push microsoft/vsts-agent:latest
