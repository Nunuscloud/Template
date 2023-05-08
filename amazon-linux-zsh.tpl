#!/bin/bash

# Update the system
sudo yum update -y

# Install Git and Zsh
sudo yum install git zsh -y

# Change the default shell for ec2-user to Zsh
sudo chsh -s $(which zsh) ec2-user

# Install Oh My Zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change the Zsh theme to agnoster
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Install Zsh Syntax Highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# Add Zsh Syntax Highlighting plugin to the plugins list
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc

# Install Zsh Autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

# Add Zsh Autosuggestions plugin to the plugins list
sed -i 's/plugins=(git zsh-syntax-highlighting)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

# Install Python
sudo yum install python -y

# Install Autojump
git clone git://github.com/wting/autojump.git ~/autojump
cd ~/autojump
./install.py

# Add Autojump to the Zsh configuration
echo '[[ -s /home/$USER/.autojump/etc/profile.d/autojump.sh ]] && source /home/$USER/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
echo 'autoload -U compinit && compinit -u' >> ~/.zshrc

# Reload Zsh configuration
source ~/.zshrc
