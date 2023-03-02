#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  sudo apt update
  sudo apt install git -y
fi

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  sudo apt update
  sudo apt install zsh -y
fi

sudo apt-get update &&
sudo apt-get install -y python3-pip &&
sudo apt-get install -y autojump &&


yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/ubuntu/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/ubuntu/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)/g; s/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

exec zsh 

source ~/.zshrc

sudo chsh -s $(which zsh) ubuntu

exec zsh
