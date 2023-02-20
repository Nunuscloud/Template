#!/bin/bash
sudo apt install python-setuptools python-pip -y &&
pip install awscli &&
sudo apt-get -y install awscli &&  
aws -version &&
echo "Done!" 
exit 0
