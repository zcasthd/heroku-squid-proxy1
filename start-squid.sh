#!/bin/sh

# Generate Squid configuration file with dynamic port and hostname
echo "http_port 0.0.0.0:9999" > /etc/squid/squid.conf

# Start Squid
squid -N
