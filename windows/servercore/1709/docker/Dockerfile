FROM microsoft/vsts-agent:1709
SHELL ["powershell", "-Command"]
RUN iex ((New-Object system.net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install docker -y
RUN choco install docker-compose -y