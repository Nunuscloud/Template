#!/bin/bash

# 자바 설치 디렉토리 생성
sudo mkdir -p /usr/local/java

# JDK 11 다운로드 링크
JAVA_DOWNLOAD_LINK="https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz"

# JDK 다운로드 및 압축 해제
sudo curl -L $JAVA_DOWNLOAD_LINK -o /usr/local/java/openjdk-11.tar.gz
sudo tar zxvf /usr/local/java/openjdk-11.tar.gz -C /usr/local/java/
sudo rm /usr/local/java/openjdk-11.tar.gz

# 환경 변수 설정
sudo sh -c 'echo "export JAVA_HOME=/usr/local/java/jdk-11.0.2" >> /etc/environment'
sudo sh -c 'echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/environment'

# 자바 버전 확인
java -version
