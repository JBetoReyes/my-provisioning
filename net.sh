#!/usr/bin/env bash
ESSID=$1
PASSWORD=$2
rfkil unblock wifi
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
my_card=$( iwconfig | head -1 | sed -r "s/^(.*)\sIEEE.*/\1/ ")
sudo ifconfig $my_card up
wpa_passphrase $ESSID $PASSWORD | sudo tee /etc/wpa_supplicant.conf
sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i $my_card
sudo dhclient $my_card
