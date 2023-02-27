#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Verify Docker installation
if [ -x "$(command -v docker)" ]; then
    echo "Docker has been successfully installed"
else
    echo "Error installing Docker"
    exit 1
fi

# Verify docker command without sudo
if docker ps > /dev/null 2>&1; then
    echo "User has been granted permission to run Docker without sudo"
else
    echo "Error granting permission to run Docker without sudo"
    exit 1
fi

exit 0
