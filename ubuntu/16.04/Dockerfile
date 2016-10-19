FROM ubuntu:16.04
ENV UBUNTU_VERSION=16.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        software-properties-common \
 && apt-add-repository ppa:git-core/ppa \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        curl \
        git \
        jq \
        libcurl3 \
        libicu55 \
        libunwind8 \
 && rm -rf /var/lib/apt/lists/*

RUN adduser --system --group vsts
WORKDIR /home/vsts

COPY ./start.sh .
RUN chown vsts:vsts start.sh \
 && chmod +x start.sh

CMD ["./start.sh"]
