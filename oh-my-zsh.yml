#!/bin/bash

# Install zsh
sudo apt-get update
sudo apt-get install -y zsh

# Set zsh as default shell
chsh -s $(which zsh)

# Install git if not installed
if [ ! $(which git) ]; then
  sudo apt-get install -y git
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change theme to agnoster
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Install syntax highlighting
sudo apt-get install -y zsh-syntax-highlighting

# Install auto jump
cd ~/.oh-my-zsh/custom/plugins &&
# git clone auto jump 
git clone https://github.com/wting/autojump.git &&
cd autojump &&

# change python version
sed -i "s/\#\!\/usr\/bin\/env\ python/\#\!\/usr\/bin\/env\ python3/" ~/.autojump/bin/autojump &&
./install.py &&
cd

# Add syntax highlighting, auto jump, and auto suggestions plugins to zsh
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting autojump zsh-autosuggestions)/g' ~/.zshrc

# Reload zsh
source ~/.zshrc

# Display completion messages
echo "zsh and oh-my-zsh have been installed."
echo "The agnoster theme has been enabled."
echo "syntax highlighting, auto jump, and auto suggestions have been installed and added to plugins in .zshrc."
echo "zsh has been set as the default shell."

exit 0
