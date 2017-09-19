#!/bin/bash
set -e

cd "$(dirname $0)"

while read dir; do
  docker build -t microsoft/vsts-agent:${dir//\//-} $dir
done < <(./dirs.sh $1)

LATEST_TAG=$(cat latest.tag)
if [ -n "$(docker images -f reference=microsoft/vsts-agent:$LATEST_TAG -q)" ]; then
  docker tag microsoft/vsts-agent:$LATEST_TAG microsoft/vsts-agent
fi
