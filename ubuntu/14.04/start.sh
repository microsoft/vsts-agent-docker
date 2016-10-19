#!/bin/bash
set -e

if [ -z "$VSTS_ACCOUNT" ]; then
  echo 1>&2 error: missing VSTS_ACCOUNT environment variable
  exit 1
fi

if [ -z "$VSTS_TOKEN" ]; then
  echo 1>&2 error: missing VSTS_TOKEN environment variable
  exit 1
fi

if [ -n "$VSTS_AGENT" ]; then
  export VSTS_AGENT=$(eval echo $VSTS_AGENT)
fi

if [ -n "$VSTS_WORK" ]; then
  export VSTS_WORK=$(eval echo $VSTS_WORK)
  mkdir -p "$VSTS_WORK"
  chown -R vsts:vsts "$VSTS_WORK"
fi

mkdir /home/vsts/agent
cd /home/vsts/agent
chown vsts:vsts .

cleanup() {
  if [ -e "./config.sh" ]; then
    su vsts -s /bin/bash -c './config.sh remove --unattended \
      --auth PAT \
      --token "$VSTS_TOKEN"'
  fi
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

echo Determining matching VSTS agent...
export VSTS_AGENT_URL=$(curl -LsS \
  -u "user:$VSTS_TOKEN" \
  -H 'Accept:application/json;api-version=3.0-preview' \
  "https://$VSTS_ACCOUNT.visualstudio.com/_apis/distributedtask/packages/agent?platform=ubuntu.$UBUNTU_VERSION-x64" \
  | jq -r '.value | map([.version.major,.version.minor,.version.patch,.downloadUrl]) | sort | .[length-1] | .[3]')
if [ -z "$VSTS_AGENT_URL" -o "$VSTS_AGENT_URL" == "null" ]; then
  echo 1>&2 error: could not determine a matching VSTS agent
  exit 1
fi

echo Downloading and installing VSTS agent...
su vsts -s /bin/bash -c 'curl -LsS $VSTS_AGENT_URL | tar -xz' & wait $!

export VSO_AGENT_IGNORE=_,MAIL,PATH,UBUNTU_VERSION,VSTS_AGENT_URL,VSO_AGENT_IGNORE,VSTS_AGENT,VSTS_ACCOUNT,VSTS_TOKEN,VSTS_POOL,VSTS_WORK
if [ -n "$VSTS_AGENT_IGNORE" ]; then
  export VSO_AGENT_IGNORE=$VSO_AGENT_IGNORE,VSTS_AGENT_IGNORE,$VSTS_AGENT_IGNORE
fi

su vsts -s /bin/bash -c './config.sh --unattended \
  --agent "${VSTS_AGENT:-$(hostname)}" \
  --url "https://$VSTS_ACCOUNT.visualstudio.com" \
  --auth PAT \
  --token "$VSTS_TOKEN" \
  --pool "${VSTS_POOL:-Default}" \
  --work "${VSTS_WORK:-_work}" \
  --replace' & wait $!

su vsts -s /bin/bash -c ./run.sh & wait $!
