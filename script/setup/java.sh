#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work
curl -sSLO "https://github.com/adoptium/temurin16-binaries/releases/download/jdk-16.0.2%2B7/OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz"
tar xf OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz

mkdir -p /opt/java
mv jdk-16.0.2+7/ /opt/java/
ln -sfn /opt/java/jdk-16.0.2+7/ /opt/java/current
