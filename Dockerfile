FROM lscr.io/linuxserver/code-server:latest

# Switch to root to install packages

# Install packages
RUN apt-get update && \
    apt-get install -y \
        htop \
        inxi \
        nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Run as root (optional)
ENV PUID=1000 \
    PGID=1000 \
    TZ=Etc/UTC

# Expose port used by code-server
EXPOSE 8443

# Persistent config
VOLUME /config
