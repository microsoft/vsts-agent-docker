![](https://github.com/microsoft/vsts-agent-docker/raw/master/images/vsts.png)

## Visual Studio Team Services agent
This repository contains images for the Visual Studio Team Services (VSTS) agent that runs tasks as part of a build or release.

## Supported tags and `Dockerfile` links
VSTS agent images are tagged according to the base OS, the VSTS agent version, and tools that are installed:

- [`ubuntu-14.04`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/Dockerfile) [(ubuntu/14.04/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/Dockerfile)
- [`ubuntu-14.04-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/docker/1.11.2/Dockerfile) [(ubuntu/14.04/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/docker/1.11.2/Dockerfile)
- [`ubuntu-14.04-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/docker/1.12.1/Dockerfile) [(ubuntu/14.04/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/docker/1.12.1/Dockerfile)
- [`ubuntu-14.04-2.106.0`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/Dockerfile) [(ubuntu/14.04/2.106.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/Dockerfile)
- [`ubuntu-14.04-2.106.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/docker/1.11.2/Dockerfile) [(ubuntu/14.04/2.106.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/docker/1.11.2/Dockerfile)
- [`ubuntu-14.04-2.106.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/docker/1.12.1/Dockerfile) [(ubuntu/14.04/2.106.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.106.0/docker/1.12.1/Dockerfile)
- [`ubuntu-14.04-2.107.0`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/Dockerfile) [(ubuntu/14.04/2.107.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/Dockerfile)
- [`ubuntu-14.04-2.107.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/docker/1.11.2/Dockerfile) [(ubuntu/14.04/2.107.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/docker/1.11.2/Dockerfile)
- [`ubuntu-14.04-2.107.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/docker/1.12.1/Dockerfile) [(ubuntu/14.04/2.107.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/14.04/2.107.0/docker/1.12.1/Dockerfile)
- [`ubuntu-16.04`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/Dockerfile) [(ubuntu/16.04/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/Dockerfile)
- [`ubuntu-16.04-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/docker/1.11.2/Dockerfile) [(ubuntu/16.04/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/docker/1.11.2/Dockerfile)
- [`ubuntu-16.04-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/docker/1.12.1/Dockerfile), [`latest`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/docker/1.12.1/Dockerfile) [(ubuntu/16.04/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/docker/1.12.1/Dockerfile)
- [`ubuntu-16.04-2.106.0`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/Dockerfile) [(ubuntu/16.04/2.106.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/Dockerfile)
- [`ubuntu-16.04-2.106.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/docker/1.11.2/Dockerfile) [(ubuntu/16.04/2.106.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/docker/1.11.2/Dockerfile)
- [`ubuntu-16.04-2.106.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/docker/1.12.1/Dockerfile) [(ubuntu/16.04/2.106.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.106.0/docker/1.12.1/Dockerfile)
- [`ubuntu-16.04-2.107.0`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/Dockerfile) [(ubuntu/16.04/2.107.0/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/Dockerfile)
- [`ubuntu-16.04-2.107.0-docker-1.11.2`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/docker/1.11.2/Dockerfile) [(ubuntu/16.04/2.107.0/docker/1.11.2/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/docker/1.11.2/Dockerfile)
- [`ubuntu-16.04-2.107.0-docker-1.12.1`](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/docker/1.12.1/Dockerfile) [(ubuntu/16.04/2.107.0/docker/1.12.1/Dockerfile)](https://github.com/microsoft/vsts-agent-docker/blob/master/ubuntu/16.04/2.107.0/docker/1.12.1/Dockerfile)

Ubuntu 14.04 and Ubuntu 16.04 are currently supported OSes with CentOS 7.2 support coming shortly.

If not specified, the VSTS version is automatically determined at container startup. Automatic determination is preferred to ensure the correct version of the agent is chosen, and is reasonably used for scenarios where the container is long running. Specific versions can be used when the version is already known and container startup performance is more critical.

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

The `VSTS_AGENT` value is evaluated inside the container as an expression.

To run a particular VSTS agent version on Ubuntu 14.04 for a specific account with a custom agent name, pool and a volume mapped agent work folder:
```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -e VSTS_AGENT='$(hostname)-agent'
  -e VSTS_POOL=mypool \
  -e VSTS_WORK=/var/vsts \
  -v /var/vsts:/var/vsts \
  -it microsoft/vsts-agent:ubuntu-14.04-2.106.0
```

## Additional Images

### `docker` images
These derived images include a version of the Docker CLI and the most recent version of the Docker Compose CLI. This image cannot run most of the built-in VSTS build or release tasks but it can run tasks that invoke arbitrary Docker workloads.

These images are not designed to run "docker in docker", but rather to re-use the host instance of Docker. To do this, volume map the host's Docker socket into the container:
```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -it microsoft/vsts-agent:ubuntu-16.04-docker-1.11.2
```

### `standard` images
These images are based on the `docker` images and include a set of standard capabilities that enable many of the built-in VSTS build and release tasks as well as providing support for arbitrary Docker workloads.