#!/bin/bash


#sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

# install docker

if [ -z "$(which docker)" ] ; then

echo "installing docker, read installer"
curl -fsSL https://get.docker.com -o get-docker.sh
vim get-docker.sh

read -p "ececute installer? [y/N]" ans
if [ "$ans" == "y" ] ; then
sudo sh get-docker.sh
fi


sudo usermod -aG docker ${USER}
echo "re-login"

fi

sudo pip3 install docker-compose


