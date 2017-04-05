FROM microsoft/vsts-agent:ubuntu-14.04-tfs-2017-standard

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.13.1
ENV DOCKER_SHA256 97892375e756fd29a304bd8cd9ffb256c2e7c8fd759e12a55a6336e15100ad75

RUN set -x \
 && curl -fSL "https://${DOCKER_BUCKET}/builds/`uname -s`/`uname -m`/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
 && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
 && tar -xzvf docker.tgz \
 && mv docker/* /usr/local/bin/ \
 && rmdir docker \
 && rm docker.tgz \
 && docker -v

ENV DOCKER_COMPOSE_VERSION 1.11.2

RUN set -x \
 && curl -fSL "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose \
 && docker-compose -v
