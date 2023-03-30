docker create \
  --name=bazarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 6767:6767 \
  -v /mnt/volume/config:/config \
  -v /mnt/volume/downloads2:/movies \
  -v /mnt/volume/downloads2/SERIES:/tv \
  --restart unless-stopped \
  linuxserver/bazarr
  
  
/mnt/volume/mediarr/
  
docker create \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 8989:8989 \
  -v /mnt/volume/mediarr/sonarr:/config \
  -v /mnt/volume/mediarr/tv:/tv \
  -v /mnt/volume/mediarr/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr
  
  
docker create \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 7878:7878 \
  -v /mnt/volume/mediarr/radarr:/config \
  -v /mnt/volume/mediarr/movies:/movies \
  -v /mnt/volume/mediarr/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr
  
  ```
docker run -d \
--name=sad_hodgkin \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/London \
-e UMASK_SET=022 `#optional` \
-p 6767:6767 \
-v /mnt/S3Plus/SharedDocker/bazarr:/config \
-v /mnt/MyPassport/sharedfolder/media/movies:/movies `#optional` \
-v /mnt/MyPassport/sharedfolder/media/tv:/tv `#optional` \
--restart unless-stopped \
ghcr.io/linuxserver/bazarr:0.9.10


docker run -d \
--name=elated_shtern \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/London \
-e UMASK_SET=022 `#optional` \
-p 8989:8989 \
-v /mnt/S3Plus/SharedDocker/sonarr:/config \
-v /mnt/MyPassport/sharedfolder/media/tv:/tv `#optional` \
-v /mnt/S3Plus/SharedFolder/media:/downloads \
-v /mnt/MyPassport/sharedfolder/torrent:/downloads_temp \
--restart unless-stopped \
ghcr.io/linuxserver/sonarr:0.6.1355

docker run -d \
--name=thirsty_fermat \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/London \
-p 7878:7878 \
-v /mnt/S3Plus/SharedDocker/radarr:/config \
-v /mnt/MyPassport/sharedfolder/media/movies:/movies \
-v /mnt/S3Plus/SharedFolder/media:/downloads \
-v /mnt/MyPassport/sharedfolder/torrent:/downloads_temp \
--restart unless-stopped \
ghcr.io/linuxserver/radarr:0.0.5332
  ```
