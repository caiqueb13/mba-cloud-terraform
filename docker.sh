#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install git -y
git config --global user.name "caiqueb13"
git config --global user.email "caique_tegas@hotmail.com"
#git clone git@github.com:caiqueb13/mba-cloud-docker.git -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
docker swarm init