#!/bin/bash
#Download apt key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - &&
#Add repository 
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' &&
#Install Java
sudo apt-get update -y &&
sudo apt-get install -y openjdk-11-jdk &&
#Install Jenkins
sudo apt update -y &&
sudo apt-get install jenkins -y &&
#Start Jenkins
sudo systemctl start jenkins &&
sudo systemctl enable jenkins &&
# 에러 시 키 가져올 명령어
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9B7D32F2D50582E6
