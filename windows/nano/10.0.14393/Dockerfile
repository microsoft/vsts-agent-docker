# the agent currently will not start on nanoserver due to some powershell issue.


FROM microsoft/nanoserver:10.0.14393.447
ENV WINDOWS_IMAGE_VERSION 10.0.14393.447

RUN mkdir C:\BuildAgent
WORKDIR C:/BuildAgent
COPY ./Start.* ./

CMD ["Start.cmd"]