#!/bin/bash
set -e

cd "$(dirname $0)"

while read dir; do
  docker push microsoft/vsts-agent:${dir//\//-}
done < <(./dirs.sh)

if [ -n "$(docker images -f reference=microsoft/vsts-agent:latest -q)" ]; then
  docker push microsoft/vsts-agent:latest
fi
