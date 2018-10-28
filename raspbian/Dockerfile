FROM resin/rpi-raspbian

RUN apt update && apt install -y --no-install-recommends \
        netcat \
        libicu-dev \
        apt-utils \
        curl \
        git \
        jq \
        libcurl3 \
        libunwind8 \
        netcat \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# install docker can be needed by some devops tasks
RUN curl -sSL https://get.docker.com | sh 


# Accept the TEE EULA
RUN mkdir -p "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && cd "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && echo '<ProductIdData><eula-14.0 value="true"/></ProductIdData>' > "com.microsoft.tfs.client.productid.xml"

WORKDIR /vsts

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]

