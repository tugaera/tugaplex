The Problem
I noticed that when I port forwarded my external IP to my internal plex server, I kept getting re-directed to 'app.plex.tv'.

Rant:

Let me preface this off by saying this it's BS I had to find a workaround.

A local server should be just local and shouldn't require external authentication to servers not within my control.

It's up to the owner to properly secure it.

The Solution
Add additional http headers to your nginx config

Prequisites

Nginx server (Guide: https://www.htpcguides.com/configure-plex-media-server-reverse-proxy-nginx-linux/)

Nginx IP populated in the 'List of IP addresses and networks that are allowed without auth' in Plex (Screenshot: https://i.imgur.com/qL6XGRD.png)

Steps

Modify the script lines below so that the IPs match your set-up:

Insert the lines into your nginx script below your 'proxy_pass' lines/block

Nginx lines to add:

proxy_set_header Referer    http://10.0.1.10:32400/web/index.html;      #IP of Plex Media Server
proxy_set_header Host       10.0.1.20;                                  #IP of Nginx Reverse Proxy Server
proxy_set_header Origin     http://10.0.1.20;                           #IP of Nginx Reverse Proxy Server
That's it! Do your port forward to your nginx server and away you go.

My full nginx script for reference:

#Nginx reverse proxy settings

server {
    listen  80;

    location / {
        # If a request to / comes in, 301 redirect to the main plex page,
        # but only if it doesn't contain the X-Plex-Device-Name header or query argument.
        # This fixes a bug where you get permission issues when accessing the web dashboard.
        # Github credit: https://gist.github.com/ometa/654376bf0e12e6131f2b809b3dc0f151 - thanks ometa

        set $test "";

        if ($http_x_plex_device_name = '') {
            set $test A;
        }
        if ($arg_X-Plex-Device-Name = '') {
            set $test "${test}B";
        }
        if ($test = AB) {
            rewrite ^/$ http://$http_host/web/index.html;
        }

    proxy_pass                  http://10.0.1.10:32400/;                    #IP of Plex Media Server
    proxy_buffering             off;
    proxy_http_version          1.1;

    # These HTTP header override are required in order to avoid being re-directed to 'app.plex.tv'
    proxy_set_header Referer    http://10.0.1.10:32400/web/index.html;      #IP of Plex Media Server
    proxy_set_header Host       10.0.1.20;                                  #IP of Nginx Reverse Proxy Server
    proxy_set_header Origin     http://10.0.1.20;                           #IP of Nginx Reverse Proxy Server
    }
}
Disclaimer
Anyone will be able to access your Plex library without authenticating

Recommended that you set-up .htaccess or whitelist specific IPs through your firewall
