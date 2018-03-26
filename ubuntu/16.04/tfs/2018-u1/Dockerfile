FROM microsoft/vsts-agent:ubuntu-16.04

RUN set -x \
 && curl -fSL https://github.com/Microsoft/vsts-agent/releases/download/v2.122.2/vsts-agent-ubuntu.16.04-x64-2.122.2.tar.gz -o agent.tgz \
 && mkdir agent \
 && cd agent \
 && tar -xz --no-same-owner -f ../agent.tgz \
 && cd .. \
 && rm agent.tgz

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
