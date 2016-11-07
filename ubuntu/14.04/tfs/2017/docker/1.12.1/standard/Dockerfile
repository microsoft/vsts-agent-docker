FROM microsoft/vsts-agent:ubuntu-14.04-tfs-2017-docker-1.12.1

# Install packages
RUN echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list \
 && apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    # Essential build tools (gcc, make, etc.)
    build-essential \
    # Basic utilities
    curl \
    dnsutils \
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
    # Python
    python \
    python3 \
    # Java and related build tools
    openjdk-7-jdk \
    ant \
    gradle \
    maven \
    # .NET Core SDK
    dotnet-dev-1.0.0-preview2-003131 \
 && rm -rf /var/lib/apt/lists/*

# Install Node.js and related build tools
RUN curl -sL https://git.io/n-install | N_PREFIX=/usr/local/nodejs bash -s -- -y
RUN npm install -g bower grunt gulp

# Configure environment variables
RUN export M2_HOME=$(which mvn) \
 && export ANT_HOME=$(which ant) \
 && export dotnet=$(which dotnet) \
 && export GRADLE_HOME=$(which gradle)
