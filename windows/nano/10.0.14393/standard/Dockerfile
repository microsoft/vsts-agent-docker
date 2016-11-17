FROM microsoft/vsts-agent:nano-10.0.14393

ENV NODE_VERSION 6.9.1
ENV NODE_DOWNLOAD_URL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-x64.msi"
RUN powershell -NoProfile -Command \
        $ErrorActionPreference = 'Stop'; \
        Invoke-WebRequest %NODE_DOWNLOAD_URL -OutFile node.msi; \
        msiexec /i node.msi /quiet /norestart; \
        Remove-Item -Force node.msi

# common node tools
RUN npm install gulp -g && npm install grunt -g && npm install less -g

# ruby
ENV RUBY_VERSION 2.2.5 \
    RUBY_FOLDER 22
ENV RUBY_DOWNLOAD_URL "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-$RUBY_VERSION-x64.exe?direct"
RUN powershell -NoProfile -Command \
        $ErrorActionPreference = 'Stop'; \
        Invoke-WebRequest %RUBY_DOWNLOAD_URL% -OutFile ruby.exe; \
        ruby.exe /verysilent /dir=C:\ruby\$RUBY_FOLDER /tasks=assocfiles,modpath
    
# .NET Core SDKs
ENV DOTNET_SDK_VERSION 1.0.0-preview2-1-003177
ENV DOTNET_SDK_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/$DOTNET_SDK_VERSION/dotnet-dev-win-x64.$DOTNET_SDK_VERSION.zip

RUN powershell -NoProfile -Command \
        $ErrorActionPreference = 'Stop'; \
        Invoke-WebRequest %DOTNET_SDK_DOWNLOAD_URL% -OutFile dotnet.zip; \
        Expand-Archive dotnet.zip -DestinationPath '%ProgramFiles%\dotnet'; \
        Remove-Item -Force dotnet.zip

# ENV DOTNET_SDK_VERSION 1.0.0-preview3-004056
# ENV DOTNET_SDK_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/$DOTNET_SDK_VERSION/dotnet-dev-win-x64.$DOTNET_SDK_VERSION.zip

# RUN powershell -NoProfile -Command \
#        $ErrorActionPreference = 'Stop'; \
#        Invoke-WebRequest %DOTNET_SDK_DOWNLOAD_URL% -OutFile dotnet.zip; \
#        Expand-Archive dotnet.zip -DestinationPath '%ProgramFiles%\dotnet'; \
#        Remove-Item -Force dotnet.zip

ENV DOTNET_VERSION 1.1.0
ENV DOTNET_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/release/1.1.0/Binaries/$DOTNET_VERSION/dotnet-win-x64.$DOTNET_VERSION.zip

RUN powershell -NoProfile -Command \
        $ErrorActionPreference = 'Stop'; \
        Invoke-WebRequest %DOTNET_DOWNLOAD_URL% -OutFile dotnet.zip; \
        Expand-Archive dotnet.zip -DestinationPath '%ProgramFiles%\dotnet'; \
        Remove-Item -Force dotnet.zip

RUN setx /M PATH "%PATH%;%ProgramFiles%\dotnet"

# Trigger the population of the local package cache
ENV NUGET_XMLDOC_MODE skip

RUN mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rmdir /q/s warmup