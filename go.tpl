#!/bin/bash

# 우분투 업데이트
sudo apt-get update
sudo apt-get upgrade

# Go 언어 다운로드 및 설치
wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz

# 환경 변수 설정
if [ -f ~/.bashrc ]; then
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
  echo 'export GOPATH=$HOME/go' >> ~/.bashrc
  echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
  source ~/.bashrc
fi

if [ -f ~/.zshrc ]; then
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
  echo 'export GOPATH=$HOME/go' >> ~/.zshrc
  echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
  source ~/.zshrc
fi

# 설치 확인
mkdir ~/hello
cd ~/hello
cat <<EOF > main.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
EOF
go build
./hello
