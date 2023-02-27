#!/bin/bash

# Install Python 3 and pip
sudo apt-get update
sudo apt-get install -y python3 python3-pip

# Install AWS CLI
pip3 install awscli --upgrade --user

# Verify AWS CLI installation
if [ -x "$(command -v aws)" ]; then
    echo "AWS CLI has been successfully installed"

echo "Done!" 
exit 0
