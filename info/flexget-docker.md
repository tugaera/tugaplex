# flexget-docker

# build your image
docker build --build-arg DOCKER_UID=1000 -t flexget:2.20.25 .

# directories
mkdir -p /mnt/volume/flexget

# FlexGet docker
docker run -d \
  --env "TZ=Europe/London" \
  --name flexget \
  --publish 5050:5050 \
  --restart unless-stopped \
  --volume /mnt/volume/flexget:/home/flexget/.flexget \
  --volume /mnt/volume/watch:/home/flexget/torrents \
  flexget:2.20.25
  
  ```
  docker run -d \
--env "TZ=Europe/London" \
--name elegant_franklin \
--publish 5050:5050 \
--restart unless-stopped \
-v /mnt/MyPassport/sharedfolder/media:/downloads \
-v /mnt/S3Plus/SharedDocker/flexget:/home/flexget/.flexget \
-v /mnt/S3Plus/SharedDocker/flexget/torrents:/home/flexget/torrents \
flexget:3.1.134
  ```
  
  
# DOCKER commands
docker images
docker start flexget
docker stop flexget

# SET password for web
docker exec -ti flexget sh -c "flexget web passwd your-passowrd-here"

# LINKS
```
https://flexget.com/InstallWizard/SynologyNAS/Docker
https://flexget.com/Cookbook/Series
https://flexget.com/Cookbook/Series/SeriesTransmissionshowRSSkodi
https://flexget.com/Cookbook/Series/SeriesTransmissionshowRSS

https://trakt.tv/users/XXXXXXXXX/lists/XXXXXXXXXXX?sort=added,asc
https://www.imdb.com/list/lsXXXXXXXXX/
```
