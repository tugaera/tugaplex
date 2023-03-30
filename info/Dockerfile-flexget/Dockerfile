FROM     python:3.6-alpine

ARG      DOCKER_UID

# Create a user to run the application
RUN      adduser -D -u ${DOCKER_UID} flexget
WORKDIR  /home/flexget

# Data and config volumes
VOLUME   /home/flexget/.flexget
VOLUME   /home/flexget/torrents
EXPOSE 5050/tcp

# Install FlexGet
RUN      pip3 install -U pip && pip3 install flexget
RUN      pip install -U transmissionrpc

# Add start script
COPY     start.sh /home/flexget/
RUN      chmod +x ./start.sh

USER     flexget
CMD      ["./start.sh"]
# CMD ["flexget", "--loglevel", "info", "daemon", "start"]
