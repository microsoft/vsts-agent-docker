#!/bin/bash
set -e

cd "$(dirname $0)"

DATE=$(date +%Y%m%d)

while read dir; do
  if [ -n "$(echo $dir | grep /standard$)" ]; then
    docker tag microsoft/vsts-agent:${dir//\//-} microsoft/vsts-agent:${dir//\//-}-$DATE
    docker push microsoft/vsts-agent:${dir//\//-}-$DATE
    docker rmi microsoft/vsts-agent:${dir//\//-}-$DATE
  else
    docker push microsoft/vsts-agent:${dir//\//-}
  fi
done < <(./dirs.sh)

docker push microsoft/vsts-agent:latest
