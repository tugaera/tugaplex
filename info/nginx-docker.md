# nginx-docker

## DOCKER

docker run --name some-nginx -d -p 8080:80 nginx

docker run --name some-nginx -v /mnt/volume/nginx/public_html:/usr/share/nginx/html:ro -d -p 8081:80 nginx

  docker run --name vibrant_lichterman -v /mnt/S3Plus/SharedDocker/nginx:/etc/nginx2 -v /mnt/S3Plus/SharedDocker/nginx/html:/usr/share/nginx/html2:ro -d -p 80:80 -p 443:443 nginx

## Port
0.0.0.0:8081 80/tcp 

## PATH
```
/mnt/volume/nginx/nginx.conf 	/etc/nginx/nginx.conf
/mnt/volume/nginx/public_html 	/usr/share/nginx/html
/mnt/volume/nginx/conf.d/default.conf 	/etc/nginx/conf.d/default.conf
```
