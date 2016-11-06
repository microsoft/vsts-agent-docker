#!/bin/bash
set -e

cd "$(dirname $0)"

while read dir; do
  docker push microsoft/vsts-agent:${dir//\//-}
done < <(./dirs.sh)

docker push microsoft/vsts-agent:latest
