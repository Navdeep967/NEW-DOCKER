FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y tmate tzdata expect netcat && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the start script
CMD ["/start.sh"]
