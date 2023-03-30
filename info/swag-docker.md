docker create \
  --name=swag \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e URL=yourdomain.url \
  -e SUBDOMAINS=www, \
  -e VALIDATION=http \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e PROPAGATION= `#optional` \
  -e DUCKDNSTOKEN= `#optional` \
  -e EMAIL= `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS= `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -p 80:80 `#optional` \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  linuxserver/swag



wget http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.1-1_armhf.deb

sudo dpkg -i libseccomp2_2.5.1-1_armhf.deb

```
docker run -d \
--name=keen_napier \
--cap-add=NET_ADMIN \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Europe/London \
-e URL=tvapp.xyz \
-e SUBDOMAINS=betamax,super8,16mm,apei,cloud, \
-e VALIDATION=http \
-e CERTPROVIDER= `#optional` \
-e DNSPLUGIN=cloudflare `#optional` \
-e PROPAGATION= `#optional` \
-e DUCKDNSTOKEN= `#optional` \
-e EMAIL=swag@webmails.org `#optional` \
-e ONLY_SUBDOMAINS=true `#optional` \
-e EXTRA_DOMAINS=plextuga.duckdns.org `#optional` \
-e STAGING=false `#optional` \
-e MAXMINDDB_LICENSE_KEY= `#optional` \
-p 443:443 \
-p 80:80 `#optional` \
-v /mnt/S3Plus/SharedDocker/swag/config:/config \
--restart unless-stopped \
ghcr.io/linuxserver/swag:1.20.0
```
