# duckdns-docker

docker create \
  --name=duckdns-lsioarmhf \
  -e PGID=1000 -e PUID=1000  \
  -e SUBDOMAINS=subdomain-without-domain \
  -e TOKEN=token-from-duckdns.org \
  -e TZ=Europe/London \
  --restart unless-stopped \
  lsioarmhf/duckdns
