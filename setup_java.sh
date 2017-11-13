#!/bin/bash

sudo apt-get update -y
sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get install oracle-java8-installer -y
sudo apt-get install junit4 -y
sudo apt-get install ant -y
sudo apt-get install maven -y
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install openjfx -y

# Kotlinのインストール
curl -s http://get.sdkman.io | bash
source $HOME/.sdkman/bin/sdkman-init.sh
sdk install kotlin
