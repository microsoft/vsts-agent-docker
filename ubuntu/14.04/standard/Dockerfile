FROM microsoft/vsts-agent:ubuntu-14.04

# Install basic command-line utilities
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    file \
    ftp \
    iproute2 \
    iputils-ping \
    locales \
    openssh-client \
    rsync\
    shellcheck \
    sudo \
    telnet \
    time \
    unzip \
    wget \
    zip \
    tzdata \
 && rm -rf /var/lib/apt/lists/*

# Setup the locale
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG
RUN locale-gen $LANG \
 && update-locale

# Accept EULA - needed for certain Microsoft packages like SQL Server Client Tools
ENV ACCEPT_EULA=Y

# Install essential build tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN apt-get update \   
 && apt-get install -y --no-install-recommends \
    ansible \      
 && rm -rf /var/lib/apt/lists/*

# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" \
  | tee /etc/apt/sources.list.d/azure-cli.list \
 && curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    azure-cli \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/* \
 && az --version

# Install Clang (only appears to work on xenial)
RUN [ "trusty" = "xenial" ] \
 && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
 && apt-add-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-6.0 main" \
 && apt-get update \
 && apt-get install -y --no-install-recommends clang-6.0 \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/* \
 || echo -n

# Install CMake
RUN curl -sL https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.sh -o cmake.sh \
 && chmod +x cmake.sh \
 && ./cmake.sh --prefix=/usr/local --exclude-subdir \
 && rm cmake.sh

# Install Erlang
RUN echo "deb http://binaries.erlang-solutions.com/debian trusty contrib" > /etc/apt/sources.list.d/eslerlang.list \
 && wget -O - http://binaries.erlang-solutions.com/debian/erlang_solutions.asc | apt-key add - \
 && apt-get update \
 && apt-get install -y --no-install-recommends esl-erlang \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Install Firefox
RUN apt-get update \
 && apt-get install -y firefox \
 && rm -rf /var/lib/apt/lists/*

# Install Go
RUN curl -sL https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz -o go1.9.4.linux-amd64.tar.gz \
 && mkdir -p /usr/local/go1.9.4 \
 && tar -C /usr/local/go1.9.4 -xzf go1.9.4.linux-amd64.tar.gz --strip-components=1 go \
 && rm go1.9.4.linux-amd64.tar.gz
RUN curl -sL https://dl.google.com/go/go1.10.linux-amd64.tar.gz -o go1.10.linux-amd64.tar.gz \
 && mkdir -p /usr/local/go1.10 \
 && tar -C /usr/local/go1.10 -xzf go1.10.linux-amd64.tar.gz --strip-components=1 go \
 && rm go1.10.linux-amd64.tar.gz
ENV GOROOT_1_9_X64=/usr/local/go1.9.4 \
    GOROOT_1_10_X64=/usr/local/go1.10 \
    GOROOT=/usr/local/go1.10
ENV PATH $PATH:$GOROOT/bin

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list \
 && apt-get update \
 && apt-get install -y google-chrome-stable \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*
ENV CHROME_BIN /usr/bin/google-chrome

# Install Haskell
RUN apt-get update \
 && apt-get install -y haskell-platform \
 && rm -rf /var/lib/apt/lists/*

# Install Helm
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

# Install Heroku CLI
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Install HHVM
RUN apt-get update \
 && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94 \
 && add-apt-repository https://dl.hhvm.com/ubuntu \
 && apt-get update \
 && apt-get install -y hhvm \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Install ImageMagick
RUN apt-get update \
 && apt-get install -y --no-install-recommends --fix-missing \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    libmagic-dev \
 && rm -rf /var/lib/apt/lists/*

# Install Java OpenJDKs
RUN apt-add-repository -y ppa:openjdk-r/ppa
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-7-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-8-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-9-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-10-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-11-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
ENV JAVA_HOME_7_X64=/usr/lib/jvm/java-7-openjdk-amd64 \
    JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64 \
    JAVA_HOME_9_X64=/usr/lib/jvm/java-9-openjdk-amd64 \
    JAVA_HOME_10_X64=/usr/lib/jvm/java-10-openjdk-amd64 \
    JAVA_HOME_11_X64=/usr/lib/jvm/java-11-openjdk-amd64 \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

# Install Java Tools (Ant, Gradle, Maven)
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ant \
    ant-optional \
 && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://services.gradle.org/distributions/gradle-4.6-bin.zip -o gradle-4.6.zip \
 && unzip -d /usr/share gradle-4.6.zip \
 && ln -s /usr/share/gradle-4.6/bin/gradle /usr/bin/gradle \
 && rm gradle-4.6.zip
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    maven \
 && rm -rf /var/lib/apt/lists/*
ENV ANT_HOME=/usr/share/ant \
    GRADLE_HOME=/usr/share/gradle \
    M2_HOME=/usr/share/maven

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl

# Install Mercurial
RUN apt-get update \
  && apt-get install -y mercurial \
  && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN curl -sL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh \
 && chmod +x miniconda.sh \
 && ./miniconda.sh -b -p /usr/share/miniconda \
 && rm miniconda.sh
ENV CONDA=/usr/share/miniconda

# Install Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
 && echo "deb https://download.mono-project.com/repo/ubuntu stable-trusty main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends apt-transport-https mono-complete \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Install MS SQL Server client tools (https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-2017)
RUN [ "trusty" = "xenial" ] \
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list \
  && apt-get update \
  && apt-get install -y mssql-tools unixodbc-dev \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /etc/apt/sources.list.d/* \
  || echo -n
ENV PATH=$PATH:/opt/mssql-tools/bin

# Install MySQL Client
RUN apt-get update \
  && apt-get install -y mysql-client \
  && rm -rf /var/lib/apt/lists/*
ENV mysql=/usr/bin/mysql

# Install MySQL Server
ENV MYSQL_ROOT_PASSWORD=
RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"'
RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"'
RUN apt-get update \
  && apt-get install -y mysql-server \
  && rm -rf /var/lib/apt/lists/*

# Install .NET Core SDK and initialize package cache
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb > packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && rm packages-microsoft-prod.deb \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    dotnet-sdk-2.2 \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*
RUN dotnet help
ENV dotnet=/usr/bin/dotnet

# Install AzCopy (depends on .NET Core)
RUN apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF \
 && echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-trusty-prod/ trusty main" | tee /etc/apt/sources.list.d/azure.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends azcopy \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Install LTS Node.js and related tools
RUN curl -sL https://git.io/n-install | bash -s -- -ny - \
 && ~/n/bin/n lts \
 && npm install -g bower \
 && npm install -g grunt \
 && npm install -g gulp \
 && npm install -g n \
 && npm install -g webpack webpack-cli --save-dev \
 && npm install -g parcel-bundler \
 && npm i -g npm \
 && rm -rf ~/n
ENV bower=/usr/local/bin/bower \
    grunt=/usr/local/bin/grunt

# Install PhantomJS
RUN apt-get update \
 && apt-get install -y chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev \
 && rm -rf /var/lib/apt/lists/* \
 && export PHANTOM_JS=phantomjs-2.1.1-linux-x86_64 \
 && wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 \
 && tar xvjf $PHANTOM_JS.tar.bz2 \
 && mv $PHANTOM_JS /usr/local/share \
 && ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

# Install PHP versions and libraries
RUN apt-add-repository ppa:ondrej/php -y \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    php5.6 \
    php5.6-amqp \
    php5.6-bcmath \
    php5.6-bz2 \
    php5.6-cgi \
    php5.6-cli \
    php5.6-common \
    php5.6-curl \
    php5.6-dba \
    php5.6-dev \
    php5.6-enchant \
    php5.6-fpm \
    php5.6-gd \
    php5.6-gmp \
    php5.6-imap \
    php5.6-interbase \
    php5.6-intl \
    php5.6-json \
    php5.6-ldap \
    php5.6-mbstring \
    php5.6-mcrypt \
    php5.6-mysql \
    php5.6-odbc \
    php5.6-opcache \
    php5.6-pgsql \
    php5.6-phpdbg \
    php5.6-pspell \
    php5.6-readline \
    php5.6-recode \
    php5.6-snmp \
    php5.6-soap \
    php5.6-sqlite3 \
    php5.6-sybase \
    php5.6-tidy \
    php5.6-xml \
    php5.6-xmlrpc \
    php5.6-xsl \
    php5.6-zip \
 && apt-get remove --purge -yq php5.6-dev \
 && apt-get install -y --no-install-recommends \
    php7.0 \
    php7.0-amqp \
    php7.0-bcmath \
    php7.0-bz2 \
    php7.0-cgi \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-dba \
    php7.0-dev \
    php7.0-enchant \
    php7.0-fpm \
    php7.0-gd \
    php7.0-gmp \
    php7.0-imap \
    php7.0-interbase \
    php7.0-intl \
    php7.0-json \
    php7.0-ldap \
    php7.0-mbstring \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-odbc \
    php7.0-opcache \
    php7.0-pgsql \
    php7.0-phpdbg \
    php7.0-pspell \
    php7.0-readline \
    php7.0-recode \
    php7.0-snmp \
    php7.0-soap \
    php7.0-sqlite3 \
    php7.0-sybase \
    php7.0-tidy \
    php7.0-xml \
    php7.0-xmlrpc \
    php7.0-xsl \
    php7.0-zip \
 && apt-get remove --purge -yq php7.0-dev \
 && apt-get install -y --no-install-recommends \
    php7.1 \
    php7.1-amqp \
    php7.1-bcmath \
    php7.1-bz2 \
    php7.1-cgi \
    php7.1-cli \
    php7.1-common \
    php7.1-curl \
    php7.1-dba \
    php7.1-dev \
    php7.1-enchant \
    php7.1-fpm \
    php7.1-gd \
    php7.1-gmp \
    php7.1-imap \
    php7.1-interbase \
    php7.1-intl \
    php7.1-json \
    php7.1-ldap \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-odbc \
    php7.1-opcache \
    php7.1-pgsql \
    php7.1-phpdbg \
    php7.1-pspell \
    php7.1-readline \
    php7.1-recode \
    php7.1-snmp \
    php7.1-soap \
    php7.1-sqlite3 \
    php7.1-sybase \
    php7.1-tidy \
    php7.1-xml \
    php7.1-xmlrpc \
    php7.1-xsl \
    php7.1-zip \
 && apt-get remove --purge -yq php7.1-dev \
 && apt-get install -y --no-install-recommends \
    php7.2 \
    php7.2-apcu \
    php7.2-amqp \
    php7.2-bcmath \
    php7.2-bz2 \
    php7.2-cgi \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-dba \
    php7.2-dev \
    php7.2-enchant \
    php7.2-fpm \
    php7.2-gd \
    php7.2-gmp \
    php7.2-imap \
    php7.2-interbase \
    php7.2-intl \
    php7.2-json \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-odbc \
    php7.2-opcache \
    php7.2-pgsql \
    php7.2-phpdbg \
    php7.2-pspell \
    php7.2-readline \
    php7.2-recode \
    php7.2-snmp \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-sybase \
    php7.2-tidy \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-xsl \
    php7.2-zip \
 && apt-get install -y --no-install-recommends \
    php-igbinary \
    php-memcache \
    php-memcached \
    php-mongodb \
    php-redis \
    php-xdebug \
    php-yaml \
    php-zmq \
 && apt-get remove --purge -yq php7.2-dev \
 && apt-get install -y --no-install-recommends snmp \
 && rm -rf /var/lib/apt/lists/*

# Install composer (for PHP)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install phpunit (for PHP)
RUN wget -q -O phpunit https://phar.phpunit.de/phpunit-7.phar \
 && chmod +x phpunit \
 && mv phpunit /usr/local/bin/phpunit

# Install Pollinate
RUN apt-get update \
 && apt-get install -y --no-install-recommends pollinate \
 && rm -rf /var/lib/apt/lists/*

# Install Powershell Core
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    powershell \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Instally PyPy2
RUN wget -q -P /tmp https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-linux64.tar.bz2 \
 && tar -x -C /opt -f /tmp/pypy2-v6.0.0-linux64.tar.bz2 \
 && rm /tmp/pypy2-v6.0.0-linux64.tar.bz2 \
 && mv /opt/pypy2-v6.0.0-linux64 /opt/pypy2 \
 && ln -s /opt/pypy2/bin/pypy /usr/local/bin/pypy

# Install PyPy3
RUN wget -q -P /tmp https://bitbucket.org/pypy/pypy/downloads/pypy3-v6.0.0-linux64.tar.bz2 \
 && tar -x -C /opt -f /tmp/pypy3-v6.0.0-linux64.tar.bz2 \
 && rm /tmp/pypy3-v6.0.0-linux64.tar.bz2 \
 && mv /opt/pypy3-v6.0.0-linux64 /opt/pypy3 \
 && ln -s /opt/pypy3/bin/pypy3 /usr/local/bin/pypy3

# Install Python
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python \
    python-pip \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Install rebar3 (for Erlang)
RUN wget -q -O rebar3 https://s3.amazonaws.com/rebar3/rebar3 \
 && chmod +x rebar3 \
 && mv rebar3 /usr/local/bin/rebar3

# Install Ruby requirements
RUN apt-get update \
 && apt-get install -y libz-dev openssl libssl-dev \
 && rm -rf /var/lib/apt/lists/*

# Install Scala build tools
RUN curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /usr/local/bin/sbt \
 && chmod 0755 /usr/local/bin/sbt

# Install Sphinx
RUN [ "trusty" = "xenial" ] \
  && apt-get update \
  && apt-get install -y sphinxsearch \
  && rm -rf /var/lib/apt/lists/* \
  || echo -n

# Install Subversion
RUN apt-get update \
 && apt-get install -y --no-install-recommends subversion \
 && rm -rf /var/lib/apt/lists/*
ENV svn=/usr/bin/svn

# Install Terraform
RUN TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r .current_version) \
 && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
 && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# XSLT transformation
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    xsltproc \
    xalan \
 && rm -rf /var/lib/apt/lists/*

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends yarn \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

# Install Xvfb
RUN apt-get update \
 && apt-get install -y xvfb \
 && rm -rf /var/lib/apt/lists/*

# Download hosted tool cache
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
RUN azcopy --recursive --source https://vstsagenttools.blob.core.windows.net/tools/hostedtoolcache/linux --destination $AGENT_TOOLSDIRECTORY

# Install the tools from the hosted tool cache
RUN original_directory=$PWD \
 && setups=$(find $AGENT_TOOLSDIRECTORY -name setup.sh) \
 && for setup in $setups; do \
        chmod +x $setup; \
        cd $(dirname $setup); \
        ./$(basename $setup); \
        cd $original_directory; \
    done;

# Add the latest Ruby version in the tool cache to the path
ENV PATH $PATH:/opt/hostedtoolcache/Ruby/2.5.1/x64/bin

# Clean system
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*
