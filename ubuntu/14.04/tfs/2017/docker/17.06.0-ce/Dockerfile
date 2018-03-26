FROM microsoft/vsts-agent:ubuntu-14.04-docker-17.06.0-ce

RUN set -x \
 && curl -fSL https://github.com/Microsoft/vsts-agent/releases/download/v2.105.7/vsts-agent-ubuntu.14.04-x64-2.105.7.tar.gz -o agent.tgz \
 && mkdir agent \
 && cd agent \
 && tar -xz --no-same-owner -f ../agent.tgz \
 && cd .. \
 && rm agent.tgz

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
