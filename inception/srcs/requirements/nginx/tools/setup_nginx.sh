#!/bin/bash

if [ ! -d /etc/nginx/ssl ]; then
    echo -e "Creating SSL directory..."
    mkdir -p /etc/nginx/certs
fi

if [ ! -f /etc/nginx/certs/inception.key ] || [ ! -f /etc/nginx/certs/inception.crt ]; then
    openssl req -x509 -nodes -newkey rsa:2048 \
        -keyout /etc/nginx/certs/42_inception.key \
        -out /etc/nginx/certs/42_inception.crt \
        -subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42/CN=sguillot.42.fr/UID=sguillot"
else
    echo -e "certs certificates already exist."
fi

echo -e "Starting Nginx..."

nginx -g 'daemon off;'