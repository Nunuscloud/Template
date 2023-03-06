#!/bin/bash

# Update package lists
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Add Kubernetes GPG key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add Kubernetes repository to APT sources
sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

# Update package lists again
sudo apt-get update

# Install Docker CE packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Remove existing containerd configuration and install containerd.io package
sudo apt-get remove -y containerd
sudo apt-get install -y containerd.io
sudo rm /etc/containerd/config.toml

# Restart containerd service
sudo systemctl restart containerd

# Install kubeadm, kubelet, and kubectl packages
sudo apt-get install -y kubelet kubeadm kubectl

# Initialize Kubernetes cluster
sudo kubeadm init

# Copy kubeconfig file to user's home directory and set correct ownership
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Set KUBECONFIG environment variable
export KUBECONFIG=$HOME/.kube/config

# Install Flannel network plugin
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Print message to indicate completion of installation and setup
echo "Kubernetes control plane has been installed and setup completed successfully!"
