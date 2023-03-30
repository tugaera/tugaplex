https://github.com/pyed/transmission-telegram

```
docker run -d --name hopeful_booth --restart unless-stopped \
nawa/transmission-telegram-armhf:latest \
-token=boot_telegram_toke \
-master=my_telegram_username \
-url=http://hopeful_galileo:9091/transmission/rpc \
-username=username \
-password=password
```
