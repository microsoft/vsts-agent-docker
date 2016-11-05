FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        software-properties-common \
 && apt-add-repository ppa:git-core/ppa \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        curl \
        git \
        libcurl3 \
        libicu55 \
        libunwind8 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /vsts

RUN set -x \
 && curl -fSL https://github.com/Microsoft/vsts-agent/releases/download/v2.105.7/vsts-agent-ubuntu.16.04-x64-2.105.7.tar.gz -o agent.tgz \
 && mkdir agent \
 && cd agent \
 && tar -xzf ../agent.tgz \
 && chown -R root:root . \
 && cd .. \
 && rm agent.tgz

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
