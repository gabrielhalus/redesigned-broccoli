FROM nginx:latest

# Create a directory to mount the volume
RUN mkdir -p /app

# Workdir
WORKDIR /app

# Install git, vim and python installation
RUN apt-get update && \
    apt-get install -y git python3 python3-pip && \
    apt-get clean

# Crossplane installation
RUN git clone https://github.com/nginxinc/crossplane.git && \
    cd crossplane && \
    python3 setup.py install

# Nginx reverse-proxy setup
COPY .app /app

RUN mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled

RUN cp /app/nginx.conf /etc/nginx && \
    cp /app/example.com.conf /etc/nginx/sites-available

RUN cp -l /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled
# Nginx reverse-proxy end

CMD [ "./main" ]
