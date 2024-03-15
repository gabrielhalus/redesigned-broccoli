# Use the official Debian slim image as base
FROM debian:bullseye-slim

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    nginx \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install crossplane
RUN git clone https://github.com/nginxinc/crossplane.git \
    && cd crossplane \
    && python3 setup.py install

# Remove the default Nginx configuration file
RUN rm /etc/nginx/nginx.conf

# Copy your Nginx configuration file from host to container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Go binary from host to container
COPY bin /usr/local/bin/goapi
RUN chmod +x /usr/local/bin/goapi

# Create a run alias for `nginx -g "daemon off;"`
RUN echo '#!/bin/bash' > /usr/local/bin/start \
    && echo 'nginx' >> /usr/local/bin/start \
    && echo 'goapi' >> /usr/local/bin/start \
    && chmod +x /usr/local/bin/start
