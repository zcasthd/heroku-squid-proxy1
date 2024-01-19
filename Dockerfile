# Use a base image (you can choose a suitable Linux distribution)
FROM ubuntu:20.04
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime
RUN apt-get update && apt-get install -y ufw
RUN ufw disable
# Install Squid and any necessary utilities
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean

# Copy your custom Squid configuration file
COPY squid.conf /etc/squid/squid.conf

# Expose the Squid proxy port
EXPOSE $PORT
# Start Squid when the container runs
CMD ["squid", "-N", "-d1"]
