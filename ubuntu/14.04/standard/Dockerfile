FROM microsoft/vsts-agent:ubuntu-14.04

# Make 'apt-get install -y' fully non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install basic command-line utilities
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    file \
    ftp \
    iproute2 \
    iputils-ping \
    openssh-client \
    sudo \
    telnet \
    time \
    unzip \
    wget \
    zip \
    tzdata \
 && rm -rf /var/lib/apt/lists/*

# Install essential build tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | tee /etc/apt/sources.list.d/azure-cli.list \
 && apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    azure-cli \
 && rm -rf /var/lib/apt/lists/*

# Install CMake
RUN curl -sL https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.sh -o cmake.sh \
 && chmod +x cmake.sh \
 && ./cmake.sh --prefix=/usr/local --exclude-subdir \
 && rm cmake.sh

# Install OpenJDKs
RUN apt-add-repository -y ppa:openjdk-r/ppa
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-7-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-8-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get -o Dpkg::Options::="--force-overwrite" install -y --no-install-recommends openjdk-7-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# Install Java Tools (Ant, Gradle, Maven)
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gradle \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    maven \
 && rm -rf /var/lib/apt/lists/*

# Install Go 1.8.6
RUN curl -sL https://dl.google.com/go/go1.8.6.linux-amd64.tar.gz -o go1.8.6.linux-amd64.tar.gz \
 && mkdir -p /usr/local/go1.8.6 \
 && tar -C /usr/local/go1.8.6 -xzf go1.8.6.linux-amd64.tar.gz --strip-components=1 go \
 && rm go1.8.6.linux-amd64.tar.gz

# Install Go 1.9.3
RUN curl -sL https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz -o go1.9.3.linux-amd64.tar.gz \
 && mkdir -p /usr/local/go1.9.3 \
 && tar -C /usr/local/go1.9.3 -xzf go1.9.3.linux-amd64.tar.gz --strip-components=1 go \
 && rm go1.9.3.linux-amd64.tar.gz

# Install .NET Core SDK and initialize package cache
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \
 && echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-trusty-prod trusty main" > /etc/apt/sources.list.d/dotnetdev.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    dotnet-sdk-2.1.4 \
 && rm -rf /var/lib/apt/lists/* \
 && dotnet help

# Install stable Node.js and related build tools
RUN curl -sL https://git.io/n-install | bash -s -- -ny - \
 && ~/n/bin/n stable \
 && npm install -g bower grunt gulp n \
 && rm -rf ~/n

# Install Powershell Core
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    powershell \
 && rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python \
    python3 \
 && rm -rf /var/lib/apt/lists/*

# Install Subversion
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    subversion \
 && rm -rf /var/lib/apt/lists/*

# Configure environment variables
ENV ANT_HOME=/usr/share/ant \
    bower=/usr/local/bin/bower \
    dotnet=/usr/bin/dotnet \
    GOROOT=/usr/local/go1.9.3 \
    GOROOT_1_8_X64=/usr/local/go1.8.6 \
    GOROOT_1_9_X64=/usr/local/go1.9.3 \
    GRADLE_HOME=/usr/share/gradle \
    grunt=/usr/local/bin/grunt \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    JAVA_HOME_7_X64=/usr/lib/jvm/java-7-openjdk-amd64 \
    JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64 \
    JAVA_HOME_7_X64=/usr/lib/jvm/java-7-openjdk-amd64 \
    JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
    M2_HOME=/usr/share/maven

# Update path environment variable
ENV PATH $PATH:$GOROOT/bin