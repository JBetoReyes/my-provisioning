#!/usr/bin/env bash
sudo apt install avahi-daemon
sudo systemctl start avahi-daemon
sudo systemctl enable avahi-daemon
sudo ufw allow 5353/udp
sudo hostnamectl set-hostname ubuntubox
sudo systemctl restart avahi-daemon
systemctl status avahi-daemon | grep Host
