#!/bin/bash
sudo service jenkins stop &&
sudo apt remove jenkins -y &&
sudo apt-get remove --purge jenkins -y \
sudo apt-get remove --auto-remove jenkins -y &&
sudo find / -name 'jenkins*' 
exit 0 
