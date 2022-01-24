#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work
curl -sSLO "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz"
tar xf OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz

dir=jdk-17.0.1+12

mkdir -p /opt/java
mv $dir/ /opt/java/
ln -sfn /opt/java/$dir/ /opt/java/current
