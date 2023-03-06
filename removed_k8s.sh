#!/bin/bash

# Remove Kubernetes packages and configuration
sudo kubeadm reset -f
sudo apt-get purge -y kubeadm kubectl kubelet kubernetes-cni kube*
sudo rm -rf ~/.kube

# Remove Docker packages and configuration
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker

# Remove containerd packages and configuration
sudo apt-get purge -y containerd.io
sudo rm -rf /var/lib/containerd

# Remove Kubernetes and Docker repositories
sudo rm -rf /etc/apt/sources.list.d/kubernetes.list
sudo rm -rf /etc/apt/sources.list.d/docker.list

# Remove Kubernetes and Docker GPG keys
sudo apt-key del 742A6BAE7A18EF17D2B9F1A22B2F97D3E98AC3A7
sudo apt-key del 0EBFCD88
