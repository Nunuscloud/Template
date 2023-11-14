#!/bin/bash

# Eksctl 설치 스크립트

# Eksctl 다운로드 및 압축 해제
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Eksctl 이동
sudo mv /tmp/eksctl /usr/local/bin

# Eksctl 버전 확인
eksctl version
