#!/bin/bash
set -e

if [ ! -e /vsts/.configure -a -e /vsts/agent ]; then
  export VSO_AGENT_IGNORE=_,MAIL,OLDPWD,PATH,PWD,UBUNTU_VERSION,VSO_AGENT_IGNORE
  if [ -n "$VSTS_AGENT_IGNORE" ]; then
    export VSO_AGENT_IGNORE=$VSO_AGENT_IGNORE,VSTS_AGENT_IGNORE,$VSTS_AGENT_IGNORE
  fi
  trap 'kill -SIGINT $!; exit 130' INT
  trap 'kill -SIGTERM $!; exit 143' TERM
  /vsts/agent/bin/Agent.Listener run & wait $!
  exit $?
fi

if [ -z "$VSTS_ACCOUNT" ]; then
  echo 1>&2 error: missing VSTS_ACCOUNT environment variable
  exit 1
fi

if [ -z "$VSTS_TOKEN" ]; then
  echo 1>&2 error: missing VSTS_TOKEN environment variable
  exit 1
fi

if [ -n "$VSTS_AGENT" ]; then
  export VSTS_AGENT="$(eval echo $VSTS_AGENT)"
fi

if [ -n "$VSTS_WORK" ]; then
  export VSTS_WORK="$(eval echo $VSTS_WORK)"
  mkdir -p "$VSTS_WORK"
fi

touch /vsts/.configure
rm -rf /vsts/agent
mkdir /vsts/agent
cd /vsts/agent

cleanup() {
  if [ -e config.sh ]; then
    ./bin/Agent.Listener remove --unattended \
      --auth PAT \
      --token "$VSTS_TOKEN"
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
curl -LsS $VSTS_AGENT_URL | tar -xz & wait $!
chown -R root:root .

export VSO_AGENT_IGNORE=_,MAIL,OLDPWD,PATH,PWD,UBUNTU_VERSION,VSTS_AGENT_URL,VSO_AGENT_IGNORE,VSTS_AGENT,VSTS_ACCOUNT,VSTS_TOKEN,VSTS_POOL,VSTS_WORK
if [ -n "$VSTS_AGENT_IGNORE" ]; then
  export VSO_AGENT_IGNORE=$VSO_AGENT_IGNORE,VSTS_AGENT_IGNORE,$VSTS_AGENT_IGNORE
fi

source ./env.sh

./bin/Agent.Listener configure --unattended \
  --agent "${VSTS_AGENT:-$(hostname)}" \
  --url "https://$VSTS_ACCOUNT.visualstudio.com" \
  --auth PAT \
  --token "$VSTS_TOKEN" \
  --pool "${VSTS_POOL:-Default}" \
  --work "${VSTS_WORK:-_work}" \
  --replace & wait $!

./bin/Agent.Listener run & wait $!
