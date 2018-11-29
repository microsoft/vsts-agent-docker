FROM microsoft/vsts-agent:$(VSTS_AGENT_TAG)

RUN set -x \
 && curl -fSL $(VSTS_AGENT_URL) -o agent.tgz \
 && mkdir agent \
 && cd agent \
 && tar -xz --no-same-owner -f ../agent.tgz \
 && cd .. \
 && rm agent.tgz

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
