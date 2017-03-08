FROM microsoft/windowsservercore:10.0.14393.693
ENV WINDOWS_IMAGE_VERSION=10.0.14393.693

RUN mkdir C:\BuildAgent
WORKDIR C:/BuildAgent
COPY ./Start.* ./

CMD ["Start.cmd"]