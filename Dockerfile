# Base image
FROM lscr.io/linuxserver/code-server:latest

# Switch to root to install extra packages
USER root

# Install packages
RUN apt-get update && \
    apt-get install -y htop nano inxi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to default user 'abc' for runtime
USER abc

# Persistent config
VOLUME /config

# Expose internal code-server port
EXPOSE 8443
