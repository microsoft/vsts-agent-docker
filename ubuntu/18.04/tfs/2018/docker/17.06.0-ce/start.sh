#!/bin/bash
set -e

if [ -z "$TFS_HOST" -a -z "$TFS_URL" ]; then
  echo 1>&2 error: missing TFS_HOST environment variable
  exit 1
fi

if [ -z "$TFS_URL" ]; then
  export TFS_URL=https://$TFS_HOST/tfs
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

cd /vsts/agent

web-server() {
  while true; do
    printf 'HTTP/1.1 302 Found\r\nLocation: $TFS_URL/_admin/_AgentPool\r\n\r\n' | nc -l -p 80 -q 0 > /dev/null
  done
}

cleanup() {
  ./bin/Agent.Listener remove --unattended \
    --auth PAT \
    --token $(cat "$VSTS_TOKEN_FILE")
}

if [ -e .agent ]; then
  echo "Removing existing VSTS agent configuration..."
  cleanup
fi

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

export VSO_AGENT_IGNORE=_,MAIL,OLDPWD,PATH,PWD,VSTS_AGENT,TFS_HOST,TFS_URL,VSTS_TOKEN_FILE,VSTS_TOKEN,VSTS_POOL,VSTS_WORK,VSO_AGENT_IGNORE
if [ -n "$VSTS_AGENT_IGNORE" ]; then
  export VSO_AGENT_IGNORE=$VSO_AGENT_IGNORE,VSTS_AGENT_IGNORE,$VSTS_AGENT_IGNORE
fi

source ./env.sh

./bin/Agent.Listener configure --unattended \
  --agent "${VSTS_AGENT:-$(hostname)}" \
  --url "$TFS_URL" \
  --auth PAT \
  --token $(cat "$VSTS_TOKEN_FILE") \
  --pool "${VSTS_POOL:-Default}" \
  --work "${VSTS_WORK:-_work}" \
  --replace & wait $!

web-server &
./bin/Agent.Listener run & wait $!
