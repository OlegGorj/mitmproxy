#!/bin/sh
set -e

# Copy and update certificates
if [ -f /usr/local/share/ca-certificates/mitmproxy-ca.crt ]; then
    sudo cp /usr/local/share/ca-certificates/mitmproxy-ca.crt /etc/ssl/certs/
    sudo chmod 644 /etc/ssl/certs/mitmproxy-ca.crt
    sudo update-ca-certificates
fi
