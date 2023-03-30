https://hub.docker.com/r/guillaumedsde/alpine-qbittorrent-openvpn

docker run --cap-add=NET_ADMIN -d \
              -v /your/storage/path/:/downloads \
              -v /path/to/config/directory:/config \
              -v /etc/localtime:/etc/localtime:ro \
              -e OPENVPN_PROVIDER=PIA \
              -e OPENVPN_CONFIG=CA\ Toronto \
              -e OPENVPN_USERNAME=user \
              -e OPENVPN_PASSWORD=pass \
              -e PUID=1000 \
              -e PGID=1000 \
              -e LAN=192.168.0.0/16 \
              -p 8080:8080 \
              guillaumedsde/alpine-qbittorrent-openvpn:latest
              

```
docker run -d \
--name=naughty_darwin \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/London \
-e WEBUI_PORT=8080 \
-p 6881:6881 \
-p 6881:6881/udp \
-p 8080:8080 \
-v /mnt/S3Plus/SharedDocker/qbittorrent:/config \
-v /mnt/S3Plus/SharedFolder/media/completed2:/downloads \
-v /mnt/S3Plus/SharedFolder/media/incomplete2:/downloads/incomplete \
-v /mnt/MyPassport/sharedfolder/torrent/completed:/downloads2 \
--restart unless-stopped \
ghcr.io/linuxserver/qbittorrent
```
