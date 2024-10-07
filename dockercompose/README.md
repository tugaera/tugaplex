```
mkdir /mnt/S3Plus/media
mkdir /mnt/S3Plus/docker
```
```
touch /mnt/S3Plus/docker/secrets
sudo chown root:root /mnt/S3Plus/docker/secrets
sudo chmod 600 /mnt/S3Plus/docker/secrets
```
```
sudo apt install acl
sudo chmod 775 /mnt/S3Plus/docker
sudo setfacl -Rdm u:administrator:rwx /mnt/S3Plus/docker
sudo setfacl -Rm u:administrator:rwx /mnt/S3Plus/docker
sudo setfacl -Rdm g:docker:rwx /mnt/S3Plus/docker
sudo setfacl -Rm g:docker:rwx /mnt/S3Plus/docker
```
```
touch /mnt/S3Plus/docker/.env
sudo chown root:root /mnt/S3Plus/docker/.env
sudo chmod 600 /mnt/S3Plus/docker/.env
sudo nano /mnt/S3Plus/docker/.env
sudo nano /mnt/S3Plus/docker/.env
```
```
sudo nano -f /mnt/S3Plus/dockerdocker-compose.yml
sudo docker compose -f /mnt/S3Plus/docker/docker-compose.yml up -d
```
```
sudo nano -f /mnt/S3Plus/socket-proxy.yml
sudo nano -f /mnt/S3Plus/portainer.yml
```

# Based on UDMS - smarthomebeginner.com
