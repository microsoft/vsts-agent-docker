FROM ubuntu:14.04

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
        libicu52 \
        libunwind8 \
 && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
 && apt-get install -y --no-install-recommends git-lfs \
 && rm -rf /var/lib/apt/lists/*

# Accept the TEE EULA
RUN mkdir -p "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && cd "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && echo '<ProductIdData><eula-14.0 value="true"/></ProductIdData>' > "com.microsoft.tfs.client.productid.xml"

WORKDIR /vsts

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
