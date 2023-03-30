# plex-docker

# IMAGE
docker pull linuxserver/plex

# DOCKER
docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -e UMASK_SET=022 `#optional` \
  -v /mnt/volume/plex:/config \
  -v /mnt/volume/downloads/complete:/tv \
  -v /mnt/volume/downloads/complete:/movies \
  -v /mnt/volume/transcoding:/transcode \
  --restart unless-stopped \
  linuxserver/plex
  
```
docker run -d \
--name=clever_pasteur \
-p 32400:32400/tcp \
-p 3005:3005/tcp \
-p 8324:8324/tcp \
-p 32469:32469/tcp \
-p 1900:1900/udp \
-p 32410:32410/udp \
-p 32412:32412/udp \
-p 32413:32413/udp \
-p 32414:32414/udp \
-e PUID=1000 \
-e PGID=1000 \
-e VERSION=docker \
-e PLEX_CLAIM=claim-XXXXX `#optional` \
-v /mnt/S3Plus/SharedDocker/plex:/config \
-v /mnt/MyPassport/sharedfolder/media/tv:/tv \
-v /mnt/MyPassport/sharedfolder/media/movies:/movies \
-v /mnt/S3Plus/SharedDocker/plex/transcode:/transcode \
-v /mnt/S3Plus/SharedFolder/media/completed3:/movies3 \
-v /mnt/S3Plus/SharedFolder/media/completed2:/others \
--restart unless-stopped \
ghcr.io/linuxserver/plex:1.24.3
```

http://19X.XXX.XXXX.XXX:32400/web

# DOCKER commands
docker start plex
docker stop plex
Shell access to the container while it is running: docker exec -it plex /bin/bash
Remove plex container (This deletes your container and you will need to re-create the container as described in the ReadMe): docker rm -f plex

# LINKS
```
https://hub.docker.com/r/linuxserver/plex/
https://forums.plex.tv/t/official-plex-media-server-docker-images-getting-started/172291
https://hub.docker.com/r/plexinc/pms-docker/
https://github.com/plexinc/pms-docker/blob/master/README.md
https://support.plex.tv/articles/200264746-quick-start-step-by-step-guides/
```

# CLAIM
```
curl -L -o plex-claim-server.sh https://github.com/uglymagoo/plex-claim-server/raw/master/plex-claim-server.sh

chmod +x plex-claim-server.sh

./plex-claim-server.sh "<your claim code>"

chown plex:plex "/config/Library/Application Support/Plex Media Server/Preferences.xml"

exit
```
