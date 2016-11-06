![](https://github.com/microsoft/vsts-agent-docker/raw/master/images/vsts.png)

## Visual Studio Team Services agent
This repository contains images for the Visual Studio Team Services (VSTS) agent that runs tasks as part of a build or release.

## Supported tags and `Dockerfile` links
VSTS agent images are tagged according to the base OS, an optional Team Foundation Server (TFS) version, and tools that are installed:

- [`ubuntu-14.04`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/Dockerfile) [(ubuntu/14.04/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/Dockerfile)
- [`ubuntu-14.04-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/docker/1.11.2/Dockerfile) [(ubuntu/14.04/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/docker/1.11.2/Dockerfile)
- [`ubuntu-14.04-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/docker/1.12.1/Dockerfile) [(ubuntu/14.04/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/docker/1.12.1/Dockerfile)
- [`ubuntu-14.04-tfs-15.0`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/Dockerfile) [(ubuntu/14.04/tfs/15.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/Dockerfile)
- [`ubuntu-14.04-tfs-15.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/docker/1.11.2/Dockerfile) [(ubuntu/14.04/tfs/15.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/docker/1.11.2/Dockerfile)
- [`ubuntu-14.04-tfs-15.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/docker/1.12.1/Dockerfile) [(ubuntu/14.04/tfs/15.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/14.04/tfs/15.0/docker/1.12.1/Dockerfile)
- [`ubuntu-16.04`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/Dockerfile) [(ubuntu/16.04/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/Dockerfile)
- [`ubuntu-16.04-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/docker/1.11.2/Dockerfile) [(ubuntu/16.04/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/docker/1.11.2/Dockerfile)
- [`ubuntu-16.04-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/docker/1.12.1/Dockerfile), [`latest`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/docker/1.12.1/Dockerfile) [(ubuntu/16.04/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/docker/1.12.1/Dockerfile)
- [`ubuntu-16.04-tfs-15.0`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/Dockerfile) [(ubuntu/16.04/tfs/15.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/Dockerfile)
- [`ubuntu-16.04-tfs-15.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/docker/1.11.2/Dockerfile) [(ubuntu/16.04/tfs/15.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/docker/1.11.2/Dockerfile)
- [`ubuntu-16.04-tfs-15.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/docker/1.12.1/Dockerfile) [(ubuntu/16.04/tfs/15.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/a4cdf471da99936f97d77a41e39e481f1d3f2664/ubuntu/16.04/tfs/15.0/docker/1.12.1/Dockerfile)

Ubuntu 14.04 and Ubuntu 16.04 are the currently supported OSes with CentOS 7.2 support coming shortly.

When used with VSTS, the agent version is automatically determined at container startup based on the account to which the agent is being connected. When used with TFS, a specific versioned image should be chosen.

Additional images that are based on the standalone agent images provide a variety of capabilities that enable it to support specific VSTS build and release tasks.

The `latest` tag always points at a standard image based on the best supported OS with automatic agent version determination, as well as including capabilities that enable many of the built-in VSTS build and release tasks. 

## How to use these images
VSTS agents must be started with account connection information, which is provided through two environment variables:

- `VSTS_ACCOUNT`: the name of the Visual Studio account
- `VSTS_TOKEN`: a personal access token (PAT) for the Visual Studio account that has been given at least the **Agent Pools (read, manage)** scope.

To run the default VSTS agent image for a specific Visual Studio account:

```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -it microsoft/vsts-agent
```

VSTS agents can be further configured with additional environment variables:

- `VSTS_AGENT`: the name of the agent (default: `"$(hostname)"`)
- `VSTS_POOL`: the name of the agent pool (default: `"Default"`)
- `VSTS_WORK`: the agent work folder (default: `"_work"`)

The `VSTS_AGENT` and `VSTS_WORK` values are evaluated inside the container as an expression so they can use shell expansions. The `VSTS_AGENT` value is evaluated first, so the `VSTS_WORK` value may reference the expanded `VSTS_AGENT` value.

To run a VSTS agent on Ubuntu 14.04 for a specific account with a custom agent name, pool and a volume mapped agent work folder:

```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -e VSTS_AGENT='$(hostname)-agent'
  -e VSTS_POOL=mypool \
  -e VSTS_WORK='/var/vsts/$VSTS_AGENT' \
  -v /var/vsts:/var/vsts \
  -it microsoft/vsts-agent:ubuntu-14.04
```

## Additional Images

### `docker` images
These derived images include a version of the Docker CLI and a recent version of the Docker Compose CLI. This image cannot run most of the built-in VSTS build or release tasks but it can run tasks that invoke arbitrary Docker workloads.

These images are not designed to run "Docker in Docker", but rather to re-use the host instance of Docker. To do this, volume map the host's Docker socket into the container:

```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -it microsoft/vsts-agent:ubuntu-16.04-docker-1.11.2
```

### `standard` images
These images are based on the `docker` images and include a set of standard capabilities that enable many of the built-in VSTS build and release tasks as well as providing support for arbitrary Docker workloads.