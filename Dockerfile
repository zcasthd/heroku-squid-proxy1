
# Use a base image
FROM ubuntu:20.04
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime
# Install Squid
RUN apt-get update && apt-get install -y squid

# Copy the startup script
COPY start-squid.sh /start-squid.sh

# Make the script executable
RUN chmod +x /start-squid.sh

# Expose the Squid proxy port (you can use the PORT environment variable Heroku provides)
EXPOSE $PORT/tcp

# Start the startup script
CMD ["/start-squid.sh"]
