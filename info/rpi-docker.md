# rpi docker

```

1
curl -sSL https://get.docker.com | sh
Depois da instalação, é necessário que adicionemos o usuário pi ao grupo docker, para que consigamos executar imagens sem sudo.

1
sudo usermod -aG docker pi
E agora habilitamos o Docker para executar sempre que o sistema for iniciado

1
sudo systemctl enable docker
Reinicie o sistema para que as alterações tenham efeito

1
sudo reboot -h now
```

# rpizero-docker

```
sudo curl -sL get.docker.com | bash

cd /tmp
wget https://packagecloud.io/Hypriot/rpi/packages/raspbian/buster/containerd.io_1.2.6-1_armhf.deb/download.deb
sudo dpkg -i download.deb
sudo rm download.deb
sudo systemctl restart docker

sudo shutdown -r now
docker --version
docker run hello-world
```

# rpi4-docker

```
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker pi
sudo curl https://download.docker.com/linux/raspbian/gpg
vim /etc/apt/sources.list
deb https://download.docker.com/linux/raspbian/ stretch stable
sudo apt-get update
sudo apt-get upgrade
systemctl start docker.service
docker info
```

## DOCKERS
```
flexget-docker
transmission-docker
plex-docker
tvheadend-docker
nginx-docker
```

## NTFS
sudo apt-get install ntfs-3g
sudo blkid

/dev/sda1: LABEL="TOSHIBA EXT" UUID="XXXXXXXXXXXXXXX" TYPE="ntfs" PARTUUID="1b9a4ea4-01"

sudo mkdir /mnt/volume

sudo chmod 770 /mnt/volume

sudo mount -t ntfs-3g -o nofail,uid=1000,gid=1000,umask=007 /dev/sda1 /mnt/volume
sudo mount /dev/sda1 /mnt/volume

sudo cp /etc/fstab /etc/fstab.backup
sudo nano /etc/fstab

UUID=XXXXXXXXXXXXXXXX /mnt/volume ntfs-3g async,big_writes,noatime,nodiratime,nofail,uid=1000,gid=1000,umask=007 0 0
/dev/sda1 /mnt/volume ntfs defaults 0 0

sudo reboot

```
UUID=02dd8c9f-d592-48cf-a7a0-d0680dda448c /mnt/S3Plus ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0
UUID=0EA8D662A8D6483B /mnt/MyPassport ntfs defaults,auto,users,rw,nofail,umask=000,x-systemd.device-timeout=30 0 0
```

## WIFI / DHCP
```
/etc/wpa_supplicant/wpa_supplicant.conf
/etc/dhcpcd.conf
```

sudo ifconfig wlan0 down

wpa_passphrase "testing"

```
interface wlan0
static ip_address=192.168.XXX.xxx
static routers=192.168.XXX.xxx
static domain_name_servers=8.8.8.8
```

## IP
curl www.ifconfig.me

## portainer
docker volume create portainer_data

docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


```
https://portainer.readthedocs.io/en/latest/deployment.html
```

## HASSio
```
https://www.home-assistant.io/hassio/installation/
https://github.com/home-assistant/hassio-installer/blob/master/hassio_install.sh
```
```
docker pull homeassistant/raspberrypi4-homeassistant:stable
docker run --init -d --name="home-assistant" -e "TZ=Europe/London" -v /home/pi/hass:/config --net=host homeassistant/raspberrypi4-homeassistant:stable
docker run --init -d --name="home-assistant" -e "TZ=Europe/London" -v /home/pi/hass:/config -p 8123:8123 homeassistant/raspberrypi4-homeassistant:stable
```
