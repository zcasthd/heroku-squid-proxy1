#!/bin/sh

# Generate Squid configuration file with dynamic port and hostname
echo "http_port $HOSTNAME:$PORT" > /etc/squid/squid.conf

# Start Squid
squid -N
