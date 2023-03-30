# tvheadend-docker

## Directories 
mkdir -p /mnt/volume/tvheadend
mkdir -p /mnt/volume/tvrecordings

## DOCKER
docker pull linuxserver/tvheadend

docker create \
  --name=tvheadend \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e RUN_OPTS=run options here `#optional` \
  -p 9981:9981 \
  -p 9982:9982 \
  -v /mnt/volume/tvheadend:/config \
  -v /mnt/volume/tvrecordings:/recordings \
  --device /dev/dri:/dev/dri `#optional` \
  --device /dev/dvb:/dev/dvb `#optional` \
  --restart unless-stopped \
  linuxserver/tvheadend
  
  http://127.0.0.1:9981/
