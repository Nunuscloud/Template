#!/bin/bash

# git 설치 안 되었으면 git 설치
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  sudo apt update
  sudo apt install git -y
fi

# zsh 설치 안 되어 있으면 zsh 설치
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  sudo apt update
  sudo apt install zsh -y
fi

# autojump 설치
sudo apt-get update &&
sudo apt-get install -y python3-pip &&
sudo apt-get install -y autojump &&

# oh-my-zsh 설치
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh startup file 설치
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# autosuggestions 설치
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/ubuntu/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# syntax-highlighting 설치
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/ubuntu/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#.zshrc 파일에 플러그인 추가 및 agnoster 테마 변경
sed -i 's/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)/g; s/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# zsh 실행 (안했더니 플러그인 설치 오류 뜸)
exec zsh 

# .zshrc 파일 재실행
source ~/.zshrc

# zsh 실행
exec zsh

# ubuntu 유저 로그인 시 시작 쉘 zsh로 변경
sudo chsh -s $(which zsh) ubuntu

exit 0
