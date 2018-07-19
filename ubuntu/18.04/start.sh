#!/bin/bash
set -e

export VSO_AGENT_IGNORE=_,MAIL,OLDPWD,PATH,PWD,VSTS_AGENT,VSTS_ACCOUNT,VSTS_TOKEN_FILE,VSTS_TOKEN,VSTS_POOL,VSTS_WORK,VSO_AGENT_IGNORE
if [ -n "$VSTS_AGENT_IGNORE" ]; then
  export VSO_AGENT_IGNORE=$VSO_AGENT_IGNORE,VSTS_AGENT_IGNORE,$VSTS_AGENT_IGNORE
fi

if [ -e /vsts/agent -a ! -e /vsts/.configure ]; then
  trap 'kill -SIGINT $!; exit 130' INT
  trap 'kill -SIGTERM $!; exit 143' TERM
  /vsts/agent/bin/Agent.Listener run & wait $!
  exit $?
fi

if [ -z "$VSTS_ACCOUNT" ]; then
  echo 1>&2 error: missing VSTS_ACCOUNT environment variable
  exit 1
fi

if [ -z "$VSTS_TOKEN_FILE" ]; then
  if [ -z "$VSTS_TOKEN" ]; then
    echo 1>&2 error: missing VSTS_TOKEN environment variable
    exit 1
  fi
  VSTS_TOKEN_FILE=/vsts/.token
  echo -n $VSTS_TOKEN > "$VSTS_TOKEN_FILE"
fi
unset VSTS_TOKEN

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

web-server() {
  while true; do
    printf 'HTTP/1.1 302 Found\r\nLocation: https://'$VSTS_ACCOUNT'.visualstudio.com/_admin/_AgentPool\r\n\r\n' | nc -l -p 80 -q 0 > /dev/null
  done
}

cleanup() {
  if [ -e config.sh ]; then
    ./bin/Agent.Listener remove --unattended \
      --auth PAT \
      --token $(cat "$VSTS_TOKEN_FILE")
  fi
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

echo Determining matching VSTS agent...
VSTS_AGENT_RESPONSE=$(curl -LsS \
  -u user:$(cat "$VSTS_TOKEN_FILE") \
  -H 'Accept:application/json;api-version=3.0-preview' \
  "https://$VSTS_ACCOUNT.visualstudio.com/_apis/distributedtask/packages/agent?platform=linux-x64")

if echo "$VSTS_AGENT_RESPONSE" | jq . >/dev/null 2>&1; then
  VSTS_AGENT_URL=$(echo "$VSTS_AGENT_RESPONSE" \
    | jq -r '.value | map([.version.major,.version.minor,.version.patch,.downloadUrl]) | sort | .[length-1] | .[3]')
fi

if [ -z "$VSTS_AGENT_URL" -o "$VSTS_AGENT_URL" == "null" ]; then
  echo 1>&2 error: could not determine a matching VSTS agent - check that account \'$VSTS_ACCOUNT\' is correct and the token is valid for that account
  exit 1
fi

echo Downloading and installing VSTS agent...
curl -LsS $VSTS_AGENT_URL | tar -xz --no-same-owner & wait $!

source ./env.sh

./bin/Agent.Listener configure --unattended \
  --agent "${VSTS_AGENT:-$(hostname)}" \
  --url "https://$VSTS_ACCOUNT.visualstudio.com" \
  --auth PAT \
  --token $(cat "$VSTS_TOKEN_FILE") \
  --pool "${VSTS_POOL:-Default}" \
  --work "${VSTS_WORK:-_work}" \
  --replace & wait $!

web-server &
./bin/Agent.Listener run & wait $!
