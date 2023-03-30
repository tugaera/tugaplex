```
docker run -d \
  --name=sharp_wright \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e JELLYFIN_PublishedServerUrl=16mm.tvapp.xyz `#optional` \
  -p 8096:8096 \
  -p 8920:8920 `#optional` \
  -p 7359:7359/udp `#optional` \
  -p 1900:1900/udp `#optional` \
  -v /mnt/S3Plus/SharedDocker/jellyfin:/config \
  -v /mnt/MyPassport/sharedfolder/media/tv:/data/tvshows \
  -v /mnt/MyPassport/sharedfolder/media/movies:/data/movies \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin

```
