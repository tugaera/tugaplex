https://netplan.io/examples/

nano /etc/netplan/XXXX.yml
sudo netplan apply


```
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
            dhcp4-overrides:
                route-metric: 100
            routes:
             - to: default
               via: 192.168.8.1
             - to: 192.168.8.0/24
               via: 192.168.8.1
               table: 102
            routing-policy:
             - from: 192.168.8.0/24
               table: 102
        eth1:
            dhcp4: true
            optional: true
            dhcp4-overrides:
                route-metric: 200
            routes:
             - to: 192.168.0.0/24
               via: 192.168.0.1
               table: 101
            routing-policy:
             - from: 192.168.0.0/24
               table: 101
    version: 2
```
