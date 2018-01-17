FROM microsoft/vsts-agent:ubuntu-16.04

# Install basic utilities and build tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
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

# Install cmake
RUN echo Downloading cmake... \
 && curl -sL https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.sh -o cmake.sh \
 && chmod +x cmake.sh \
 && ./cmake.sh --prefix=/usr/local --exclude-subdir \
 && rm -rf cmake.sh

# Install Open JDKs
RUN apt-add-repository -y ppa:openjdk-r/ppa
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-7-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-8-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# Install ant
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
 && rm -rf /var/lib/apt/lists/*

# Install maven
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    maven \
 && rm -rf /var/lib/apt/lists/*

# Install gradle
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gradle \
 && rm -rf /var/lib/apt/lists/*

# Install python
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python \
    python3 \
 && rm -rf /var/lib/apt/lists/*

# Install stable Node.js and related build tools
RUN curl -sL https://git.io/n-install | bash -s -- -ny - \
 && ~/n/bin/n stable \
 && npm install -g bower grunt gulp n \
 && rm -rf ~/n

# Install .NET Core SDK
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \
 && echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    dotnet-sdk-2.0.0 \
 && rm -rf /var/lib/apt/lists/*

# Run dotnet command to populate initial cache
RUN dotnet help

# Install Powershell Core
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    powershell \
 && rm -rf /var/lib/apt/lists/*

# Configure AzCLI 2.0  Instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | tee /etc/apt/sources.list.d/azure-cli.list \
 && apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893 \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    azure-cli \
 && rm -rf /var/lib/apt/lists/* \
 && az --version

 # Install Subversion
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    subversion \
 && rm -rf /var/lib/apt/lists/*

# Configure environment variables
ENV ANT_HOME=/usr/share/ant \
    bower=/usr/local/bin/bower \
    dotnet=/usr/bin/dotnet \
    GRADLE_HOME=/usr/share/gradle \
    grunt=/usr/local/bin/grunt \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    JAVA_HOME_7_X64=/usr/lib/jvm/java-7-openjdk-amd64 \
    JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64 \
    JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
    M2_HOME=/usr/share/maven
