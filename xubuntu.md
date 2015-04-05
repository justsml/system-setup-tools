# Helpful Commands for Ubuntu 14.04 w/Xfce

### Fix keyboard volumen shortcuts

```sh
	kill `pidof xfce4-volumed` ; mkdir -p /tmp/volumed && cd /tmp/volumed && nohup xfce4-volumed --no-daemon &
```

### Cleanup bloat/crapware
```sh
	sudo apt-get purge oneconf popularity-contest python-ubuntuone-client python-ubuntuone-storageprotocol ubuntuone-installer python-ubuntuone-control-panel ubuntuone-client ubuntuone-client-gnome ubuntuone-control-panel unity-scope-musicstores deja-dup vino activity-log-manager-common activity-log-manager-control-center
```
