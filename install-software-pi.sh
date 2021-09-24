#!/bin/bash

sudo apt install etckeeper git
sudo apt install vim

# ssh permissions
mkdir -p $HOME/.ssh
touch $HOME/.ssh/authorized_keys
chmod g-w $HOME
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys

# create user
sudo adduser ltz
for i in  adm dialout cdrom sudo audio video plugdev games users input netdev spi i2c gpio lpadmin; do sudo adduser ltz $i; done
sed -e 's/^pi/ltz/' /etc/sudoers.d/010_pi-nopasswd > /etc/sudoers.d/010_ltz-nopasswd
chmod 440 /etc/sudoers.d/010_ltz-nopasswd

