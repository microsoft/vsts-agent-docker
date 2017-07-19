FROM microsoft/vsts-agent:ubuntu-16.04-tfs-2017

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
	tzdata\
 && rm -rf /var/lib/apt/lists/*

# Install Oracle JDKs
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && apt-add-repository -y ppa:webupd8team/java \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    oracle-java6-installer \
    oracle-java7-installer \
    oracle-java8-installer \
    oracle-java8-set-default \
 && ln -s /usr/lib/jvm/java-8-oracle /usr/lib/jvm/default-java \
 && rm -rf /var/lib/apt/lists/*

# Install ant separately to avoid apt-get errors
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
 && rm -rf /var/lib/apt/lists/*

# Install maven separately to avoid apt-get errors
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    maven \
 && rm -rf /var/lib/apt/lists/*

# Install gradle separately to avoid apt-get errors
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
RUN echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893 \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    dotnet-dev-1.0.1 \
 && rm -rf /var/lib/apt/lists/*

# Run dotnet command to populate initial cache
RUN dotnet help

# Configure environment variables
ENV ANT_HOME=/usr/share/ant \
    bower=/usr/local/bin/bower \
    dotnet=/usr/bin/dotnet \
    GRADLE_HOME=/usr/share/gradle \
    grunt=/usr/local/bin/grunt \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    JAVA_HOME_6_X64=/usr/lib/jvm/java-6-oracle \
    JAVA_HOME_7_X64=/usr/lib/jvm/java-7-oracle \
    JAVA_HOME_8_X64=/usr/lib/jvm/java-8-oracle \
    JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
    M2_HOME=/usr/share/maven
