#!/bin/bash
set -e

cd "$(dirname $0)"

while read dir; do
  docker build -t microsoft/vsts-agent:${dir//\//-} $dir
done < <(./dirs.sh)

docker tag microsoft/vsts-agent:$(cat latest.tag) microsoft/vsts-agent
