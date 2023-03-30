docker run -d \
  --name=insane_hawking \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 443:443 \
  -v /mnt/S3Plus/SharedDocker/nextcloud:/config \
  -v /mnt/S3Plus/SharedFolder/media/nextcloud:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud
