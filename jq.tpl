#!/bin/bash

# Check if jq is already installed
if [ -x "$(command -v jq)" ]; then
    echo "jq is already installed"
    exit 0
fi

# Install jq
if [ -x "$(command -v yum)" ]; then
    sudo yum -y install jq
elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get -y install jq
else
    echo "Neither yum nor apt-get package manager found. Please install jq manually."
    exit 1
fi

# Verify jq installation
if [ -x "$(command -v jq)" ]; then
    echo "jq has been successfully installed"
else
    echo "Error installing jq"
    exit 1
fi

exit 0
