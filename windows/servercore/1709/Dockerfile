FROM microsoft/windowsservercore:1709
ENV WINDOWS_IMAGE_VERSION=10.0.16299.0

RUN mkdir C:\BuildAgent
WORKDIR C:/BuildAgent
COPY ./Start.* ./

CMD ["Start.cmd"]