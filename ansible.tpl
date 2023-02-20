#!/bin/bash
sudo apt update &&
sudo apt -y install software-properties-common &&
sudo add-apt-repository -y --update ppa:ansible/ansible &&
sudo apt -y install ansible &&
echo "done"
exit 0
