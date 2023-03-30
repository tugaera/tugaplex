### -- PLEX transcoding error
https://openmediavault.readthedocs.io/en/latest/administration/storage/filesystems.html?highlight=noexec%20#filesystems

https://openmediavault.readthedocs.io/en/latest/various/fs_env_vars.html?highlight=noexec%20#filesystem-environmental-variables

```
$ nano /etc/openmediavault/config.xml
f6 mntent 
remove "noexec"
ctrl+X Y


update /etc/fstab: $ omv-salt deploy run fstab
$ reboot

confirm changes: $ cat /proc/mounts
```
### -- Route default GW
https://forum.openmediavault.org/index.php?thread/32850-where-to-add-static-route/

