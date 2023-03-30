```
docker run -d --init --restart=always \
-v /mnt/S3Plus/SharedFolder/media/jdownloader:/opt/JDownloader/Downloads \
-v /mnt/MyPassport/sharedfolder/jdownloader:/opt/JDownloader/Downloads/MyPassport \
-v /mnt/S3Plus/SharedDocker/jdownloader:/opt/JDownloader/app/cfg \
-v /mnt/S3Plus/SharedDocker/jdownloader/logs:/opt/JDownloader/app/logs \
-v /etc/localtime:/etc/localtime:ro \
-p 3129:3129 \
-e MYJD_USER=jdownloader@example.org \
-e MYJD_PASSWORD=passowrd123 \
-e MYJD_DEVICE_NAME=rpiJDownloader \
-e XDG_DOWNLOAD_DIR=/opt/JDownloader/Downloads \
jaymoulin/jdownloader
```
