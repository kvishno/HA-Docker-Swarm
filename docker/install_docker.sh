#!/bin/bash

# https://github.com/kvishno
# Tested on Ubuntu 18.04

# User credentials for docker user
user=dockeradmin
password=supersecret

# Compose version. Find the latest release here: https://github.com/docker/compose/releases/latest
compose=1.25.4


# Create new docker user
sudo adduser $user --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "$USER:$password" | sudo chpasswd

# Install Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y

# Add the created user to docker group
sudo usermod -aG docker $user

# Install Docker-Compose
sudo curl -L https://github.com/docker/compose/releases/download/$compose/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sleep 5

# Print Docker and Docker Compose version to verify installation
echo
echo
docker --version
docker-compose --version
