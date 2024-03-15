# Use the official Debian slim image as base
FROM debian:bullseye-slim

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    golang-go \
    nginx \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install crossplane
RUN git clone https://github.com/nginxinc/crossplane.git \
    && cd crossplane \
    && python3 setup.py install

WORKDIR /app

CMD ["go", "run", "cmd/nginxUi/main.go"]
