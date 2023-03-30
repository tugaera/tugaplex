# transmission-docker

# IMAGE
docker pull linuxserver/transmission

# DOCKER
```
docker run -d \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /mnt/S3Plus/SharedDocker/transmission/:/config \
  -v /mnt/S3Plus/SharedFolder/media/:/downloads \
  -v /mnt/S3Plus/SharedFolder/watch/:/watch \
  --restart unless-stopped \
  lscr.io/linuxserver/transmission
```
  
# DOCKER commands
docker start transmission
docker stop transmission


# LINKS
```
https://hub.docker.com/r/linuxserver/transmission/
https://www.smarthomebeginner.com/install-transmission-using-docker/
https://github.com/transmission/transmission/wiki/Editing-Configuration-Files
```

## ALPINE
```
FROM        alpine

ARG         DOCKER_UID

# Create a user to run the application
RUN         adduser -D -u ${DOCKER_UID} transmission
WORKDIR     /home/transmission

# Data and config volumes
VOLUME      /home/transmission/.config
VOLUME      /home/transmission/Downloads
VOLUME      /home/transmission/incomplete
VOLUME      /home/transmission/watch

# Install Transmission
RUN         apk update && apk add --no-cache transmission-daemon

EXPOSE      9091

USER        transmission
ENTRYPOINT  ["transmission-daemon", "--foreground", "--log-info"]
```

docker build --build-arg DOCKER_UID=1234 -t transmission:2.94-r1 .

```
docker run -d \
  --env "TZ=America/Los_Angeles" \
  --name transmission \
  --net host \
  --publish 9091:9091 \
  --restart always \
  --volume /volume1/docker/transmission/config:/home/transmission/.config \
  --volume /volume1/docker/transmission/incomplete:/home/transmission/incomplete \
  --volume /volume1/docker/transmission/watch:/home/transmission/watch \
  --volume /volume1/Media/Downloads:/home/transmission/Downloads \
  transmission:latest
```

# OpenVPN
https://hub.docker.com/r/haugene/transmission-openvpn/dockerfile

https://haugene.github.io/docker-transmission-openvpn/arguments/

docker run --cap-add=NET_ADMIN -d \
              -v /mnt/volume/downloads2/:/data \
              -v /etc/localtime:/etc/localtime:ro \
              -e CREATE_TUN_DEVICE=true \
              -e OPENVPN_PROVIDER=SURFSHARK \
              -e OPENVPN_CONFIG=uk-lon_udp,uk-man_udp \
              -e OPENVPN_USERNAME=UserTOKEN \
              -e OPENVPN_PASSWORD=PasswordTOKEN \
              -e WEBPROXY_ENABLED=false \
              -e LOCAL_NETWORK=192.168.1.0/16 \
              -e PUID=1000 \
              -e PGID=1000 \
              -e TRANSMISSION_RPC_AUTHENTICATION_REQUIRED=true \
              -e TRANSMISSION_RPC_HOST_WHITELIST_ENABLED=true \
              -e TRANSMISSION_RPC_WHITELIST=127.0.0.1,172.18.0.*,172.17.0.*,192.168.8.*,192.168.1.* \
              -e TRANSMISSION_IDLE_SEEDING_LIMIT=0
              -e TRANSMISSION_IDLE_SEEDING_LIMIT_ENABLED=true
              -e TRANSMISSION_SPEED_LIMIT_UP=1
              -e TRANSMISSION_SPEED_LIMIT_UP_ENABLED=true
              -e TRANSMISSION_RATIO_LIMIT=0
              -e TRANSMISSION_RATIO_LIMIT_ENABLED=true
              --log-driver json-file \
              --log-opt max-size=10m \
              -p 9091:9091 \
              haugene/transmission-openvpn:latest-armhf

```
docker run --cap-add=NET_ADMIN -d \
--name=hopeful_galileo \
-v /etc/localtime:/etc/localtime:ro \
-v /mnt/S3Plus/SharedFolder/media/:/data \
-v /mnt/S3Plus/SharedDocker/transmission/:/data/transmission-home \
-v /mnt/MyPassport/sharedfolder/torrent/:/data2 \
-v /mnt/S3Plus/SharedDocker/transmission/:/config \
-e CREATE_TUN_DEVICE=true \
-e OPENVPN_PROVIDER=SURFSHARK \
-e OPENVPN_CONFIG=uk-man_udp \
-e OPENVPN_USERNAME= \
-e OPENVPN_PASSWORD= \
-e PUID=1000 \
-e PGID=1000 \
-e LOCAL_NETWORK=172.17.0.0/24,192.168.1.0/24,172.19.0.0/24 \
-e GLOBAL_APPLY_PERMISSIONS=true \
-e TRANSMISSION_ALT_SPEED_DOWN=50 \
-e TRANSMISSION_ALT_SPEED_ENABLED=false \
-e TRANSMISSION_ALT_SPEED_TIME_BEGIN=540 \
-e TRANSMISSION_ALT_SPEED_TIME_DAY=127 \
-e TRANSMISSION_ALT_SPEED_TIME_ENABLED=false \
-e TRANSMISSION_ALT_SPEED_TIME_END=1020 \
-e TRANSMISSION_ALT_SPEED_UP=50 \
-e TRANSMISSION_BIND_ADDRESS_IPV4=0.0.0.0 \
-e TRANSMISSION_BIND_ADDRESS_IPV6=:: \
-e TRANSMISSION_BLOCKLIST_ENABLED=false \
-e TRANSMISSION_BLOCKLIST_URL=http://www.example.com/blocklist \
-e TRANSMISSION_CACHE_SIZE_MB=4 \
-e TRANSMISSION_DHT_ENABLED=true \
-e TRANSMISSION_DOWNLOAD_DIR=/data/completed \
-e TRANSMISSION_DOWNLOAD_LIMIT=100 \
-e TRANSMISSION_DOWNLOAD_LIMIT_ENABLED=0 \
-e TRANSMISSION_DOWNLOAD_QUEUE_ENABLED=true \
-e TRANSMISSION_DOWNLOAD_QUEUE_SIZE=5 \
-e TRANSMISSION_ENCRYPTION=1 \
-e TRANSMISSION_IDLE_SEEDING_LIMIT=0 \
-e TRANSMISSION_IDLE_SEEDING_LIMIT_ENABLED=true \
-e TRANSMISSION_INCOMPLETE_DIR=/data/incomplete \
-e TRANSMISSION_INCOMPLETE_DIR_ENABLED=true \
-e TRANSMISSION_LPD_ENABLED=false \
-e TRANSMISSION_MAX_PEERS_GLOBAL=200 \
-e TRANSMISSION_MESSAGE_LEVEL=2 \
-e TRANSMISSION_PEER_CONGESTION_ALGORITHM= \
-e TRANSMISSION_PEER_ID_TTL_HOURS=6 \
-e TRANSMISSION_PEER_LIMIT_GLOBAL=200 \
-e TRANSMISSION_PEER_LIMIT_PER_TORRENT=50 \
-e TRANSMISSION_PEER_PORT=51413 \
-e TRANSMISSION_PEER_PORT_RANDOM_HIGH=65535 \
-e TRANSMISSION_PEER_PORT_RANDOM_LOW=49152 \
-e TRANSMISSION_PEER_PORT_RANDOM_ON_START=true \
-e TRANSMISSION_PEER_SOCKET_TOS=default \
-e TRANSMISSION_PEX_ENABLED=true \
-e TRANSMISSION_PORT_FORWARDING_ENABLED=false \
-e TRANSMISSION_PREALLOCATION=1 \
-e TRANSMISSION_PREFETCH_ENABLED=1 \
-e TRANSMISSION_QUEUE_STALLED_ENABLED=true \
-e TRANSMISSION_QUEUE_STALLED_MINUTES=30 \
-e TRANSMISSION_RATIO_LIMIT=0.01 \
-e TRANSMISSION_RATIO_LIMIT_ENABLED=true \
-e TRANSMISSION_RENAME_PARTIAL_FILES=true \
-e TRANSMISSION_RPC_AUTHENTICATION_REQUIRED=false \
-e TRANSMISSION_RPC_BIND_ADDRESS=0.0.0.0 \
-e TRANSMISSION_RPC_ENABLED=true \
-e TRANSMISSION_RPC_HOST_WHITELIST= \
-e TRANSMISSION_RPC_HOST_WHITELIST_ENABLED=false \
-e TRANSMISSION_RPC_PASSWORD=password \
-e TRANSMISSION_RPC_PORT=9091 \
-e TRANSMISSION_RPC_URL=/transmission/ \
-e TRANSMISSION_RPC_USERNAME=username \
-e TRANSMISSION_RPC_WHITELIST=127.0.0.1 \
-e TRANSMISSION_RPC_WHITELIST_ENABLED=false \
-e TRANSMISSION_SCRAPE_PAUSED_TORRENTS_ENABLED=true \
-e TRANSMISSION_SCRIPT_TORRENT_DONE_ENABLED=false \
-e TRANSMISSION_SCRIPT_TORRENT_DONE_FILENAME= \
-e TRANSMISSION_SEED_QUEUE_ENABLED=false \
-e TRANSMISSION_SEED_QUEUE_SIZE=10 \
-e TRANSMISSION_SPEED_LIMIT_DOWN=100 \
-e TRANSMISSION_SPEED_LIMIT_DOWN_ENABLED=false \
-e TRANSMISSION_SPEED_LIMIT_UP=1 \
-e TRANSMISSION_SPEED_LIMIT_UP_ENABLED=true \
-e TRANSMISSION_START_ADDED_TORRENTS=true \
-e TRANSMISSION_TRASH_ORIGINAL_TORRENT_FILES=false \
-e TRANSMISSION_UMASK=2 \
-e TRANSMISSION_UPLOAD_LIMIT=100 \
-e TRANSMISSION_UPLOAD_LIMIT_ENABLED=0 \
-e TRANSMISSION_UPLOAD_SLOTS_PER_TORRENT=14 \
-e TRANSMISSION_UTP_ENABLED=true \
-e TRANSMISSION_WATCH_DIR=/data/watch \
-e TRANSMISSION_WATCH_DIR_ENABLED=true \
-e TRANSMISSION_HOME=/data/transmission-home \
-e TRANSMISSION_WATCH_DIR_FORCE_GENERIC=false \
-e ENABLE_UFW=false \
-e UFW_ALLOW_GW_NET=false \
-e UFW_EXTRA_PORTS= \
-e UFW_DISABLE_IPTABLES_REJECT=false \
-e TRANSMISSION_WEB_UI= \
-e PUID= \
-e PGID= \
-e _TRANSMISSION_WEB_HOME= \
-e DROP_DEFAULT_ROUTE= \
-e WEBPROXY_ENABLED=false \
-e WEBPROXY_PORT=8888 \
-e HEALTH_CHECK_HOST=google.com \
-e DOCKER_LOG=false \
--log-driver json-file \
--log-opt max-size=10m \
-p 9091:9091 \
haugene/transmission-openvpn:3.0.2-armhf
```
