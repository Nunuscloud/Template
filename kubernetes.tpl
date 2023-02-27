#!/bin/bash

# Check if Docker is installed
if [ ! -x "$(command -v docker)" ]; then
    # Install Docker if not already installed
    sudo apt-get update
    sudo apt-get install -y docker.io
fi

# Install Kubernetes
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm kubelet kubectl

# Verify Kubernetes installation
if [ -x "$(command -v kubectl)" ]; then
    echo "Kubernetes has been successfully installed"
else
    echo "Error installing Kubernetes"
    exit 1
fi

exit 0
