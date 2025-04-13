FROM hashicorp/tfc-agent:latest

USER root

# Create directory for certificates
RUN mkdir -p /usr/local/share/ca-certificates && \
    mkdir -p /etc/ssl/certs && \
    chown -R tfc-agent:tfc-agent /usr/local/share/ca-certificates && \
    chown -R tfc-agent:tfc-agent /etc/ssl/certs

# Copy entrypoint script
COPY --chown=tfc-agent:tfc-agent docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN /usr/local/bin/docker-entrypoint.sh

USER tfc-agent
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/local/bin
WORKDIR /home/tfc-agent
ENV TF_AGENT_LOG_LEVEL=DEBUG
ENV TF_ADDRESS=https://app.terraform.io
ENTRYPOINT ["/home/tfc-agent/bin/tfc-agent"]
