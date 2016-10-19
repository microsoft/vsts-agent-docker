FROM ubuntu:14.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        software-properties-common \
 && apt-add-repository ppa:git-core/ppa \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        curl \
        git \
        libcurl3 \
        libicu52 \
        libunwind8 \
 && rm -rf /var/lib/apt/lists/*

RUN adduser --system --group vsts
WORKDIR /home/vsts/agent

RUN set -x \
 && curl -fSL https://github.com/Microsoft/vsts-agent/releases/download/v2.108.0/vsts-agent-ubuntu.14.04-x64-2.108.0.tar.gz -o agent.tgz \
 && tar -xzf agent.tgz \
 && chown -R vsts:vsts . \
 && rm agent.tgz

COPY ./start.sh .
RUN chown vsts:vsts start.sh \
 && chmod +x start.sh

CMD ["./start.sh"]
