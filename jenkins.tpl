#!/bin/bash
#Download apt key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - &&
#Add repository 
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' &&
#Install Jenkins
sudo apt-get install jenkins -y &&
#Start Jenkins
sudo systemctl start jenkins &&
sudo systemctl status jenkins
