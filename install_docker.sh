#!/usr/bin/env bash
sudo apt update -y

# Install dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Adds Repositories
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# 
# # Updates
# sudo apt update -y
# 
# sudo apt install docker-ce -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl status docker

sudo usermod -aG docker ${USER}

# Installing docker-compose
sudo pip3 install docker-compose
