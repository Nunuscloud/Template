#!/bin/bash

# kubectl command completion
source <(kubectl completion bash)

# add completion to bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc 

# kubectl alias
alias k=kubectl

# add kubectl alias to bashrc
echo "alias k=kubectl" >> ~/.bashrc 

# kubectl completion alias
complete -o default -F __start_kubectl k

# add kubectl completion alias to bashrc
echo "complete -o default -F __start_kubectl k" >> ~/.bashrc 
