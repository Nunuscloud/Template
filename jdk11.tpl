#!/bin/bash

# Update and upgrade the system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install OpenJDK 11 JDK and JRE
sudo apt-get install -y openjdk-11-jdk
sudo apt-get install -y openjdk-11-jre

# Add Java environment variables to bashrc
echo 'export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))));' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin;' >> ~/.bashrc

# Reload the bashrc file
source ~/.bashrc

# Check the Java version
echo "Java version:"
java -version
