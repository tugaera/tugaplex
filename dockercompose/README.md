## Mount
```
UUID=f0d37516-8f9d-4277-b8bd-b7e344a8db73 /mnt/S3Plus ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0
//192.168.88.XXX/MyPassport/sharedfolder /mnt/MyPassport cifs uid=1000,gid=1000,username=USERHERE,password=PASSWORDHERE 0 0
```
## Docker
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

### Based on UDMS - smarthomebeginner.com
## LINKS
https://wiki.servarr.com/docker-guide
https://trash-guides.info/
