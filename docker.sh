#!/bin/bash

apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install git -y
git clone https://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@github.com/caiqueb13/mba-cloud-docker.git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
docker swarm leave --force
docker swarm init
cd /mba-cloud-docker
docker stack deploy -c docker-compose.yml projeto