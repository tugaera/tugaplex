UUID=02dd8c9f-d592-48cf-a7a0-d0680dda448c /mnt/S3Plus fstype defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0
UUID=0EA8D662A8D6483B /mnt/MyPassport ntfs defaults,auto,users,rw,nofail,umask=000,x-systemd.device-timeout=30 0 0


sudo apt install ntfs-3g

```
sudo fdisk -l
sudo ls -l /dev/disk/by-uuid/
sudo blkid /dev/sda1
```

```
/dev/sda1: LABEL="MyPassport" BLOCK_SIZE="512" UUID="0EA8D662A8D6483B" TYPE="ntfs" PARTLABEL="My Passport" PARTUUID="2c25f6bd-c5cb-4929-a5ea-f672b0f3058f"
/dev/sda1: LABEL="S3Plus" UUID="02dd8c9f-d592-48cf-a7a0-d0680dda448c" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="e366e8fd-a92f-4e59-8a38-0d23869b3516"
```

```
sudo mkdir /mnt/MyPassport
sudo mkdir /mnt/S3Plus
```

sudo nano /etc/fstab

UUID=[UUID] /mnt/usb1 [TYPE] defaults,auto,users,rw,nofail,noatime 0 0


UUID=02dd8c9f-d592-48cf-a7a0-d0680dda448c /mnt/S3Plus ext4 defaults,auto,users,rw,nofail,umask=000,x-systemd.device-timeout=30 0 0


https://dannyda.com/2020/08/26/how-to-passthrough-hdd-ssd-physical-disks-to-vm-on-proxmox-vepve/


PROXMOX

https://pve.proxmox.com/wiki/Passthrough_Physical_Disk_to_Virtual_Machine_(VM)
