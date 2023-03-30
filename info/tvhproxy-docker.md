# tvhProxy-docker

https://hub.docker.com/r/54cr4m3n70/tvhproxy

```
docker create \
  --name tvhproxy-54cr4m3n70 \
  --net=host \
  -e TVH_TUNER_COUNT=1 \
  -e TVH_PROFILE=pass \
  -e TVH_URL=http://tvheadend-dvb:9981 \
54cr4m3n70/tvhproxy
```
http://nostalgic_bohr:5004


https://blog.swakes.co.uk/raspberry-pi-tv-dvb-hat-plex-magic/

```

sudo apt install python-pip
sudo useradd -m tvh -s /bin/bash
sudo su - tvh

git clone https://github.com/jkaberg/tvhProxy.git
cd tvhProxy
pip install virtualenv
virtualenv venv
. venv/bin/activate
pip install setuptools --upgrade
pip install wheel
pip install -r requirements.txt' 

exit
cd /home
cd tvh
cd tvhProxy

'tvhURL': os.environ.get('TVH_URL') or 'http://username:password@RasPiIPAddress:9981',
'tvhProxyURL': os.environ.get('TVH_PROXY_URL') or 'http://RasPiIPAddress',

sudo cp tvhProxy.service /etc/systemd/system/tvhProxy.service
sudo systemctl daemon-reload
sudo systemctl enable tvhProxy.service
sudo systemctl start tvhProxy.service
```
