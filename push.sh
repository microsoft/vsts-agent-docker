#!/bin/bash

cd "$(dirname $0)"

ubuntu/push.sh

echo docker push microsoft/vsts-agent:latest
