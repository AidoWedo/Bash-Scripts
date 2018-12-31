# Simple Bash script copies from the primary partition on SD Card to the secondary partition for Wifi Settings for Raspberry Pi Zero
# For Raspberry Pi headless or Gui no real need
# format of file for wpa_supplicant.conf or .txt as follows
# network={
#	ssid="MYSSID"
#	psk="passprhase"
#}
#or use wpa_passphrase command to generate the .conf file 
#!/bin/bash

if [ ! -d "/boot" ]; then
        echo 'Mounting /boot on primary partition of sd card'
        cd ..
        mkdir /boottmp
        mount /dev/mmcblk0p1 /boottmp
fi

if [ -f "/boot/wpa_supplicant.txt" ]; then
        echo 'Applying wpa_supplicant Configuration'
        cp /boottmp/wpa_supplicant.txt /etc/wpa_supplicant.conf
        mv /boottmp/wpa_supplicant.txt /boottmp/wpa_supplicant.applied.txt
fi

umount /boottmp
rm -r /boottmp