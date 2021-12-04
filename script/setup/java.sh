#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work

curl -O https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-x64_bin.tar.gz

java_version=16.0.1
tar xvf openjdk-${java_version}_linux-x64_bin.tar.gz
mkdir -p /opt/java
mv jdk-${java_version} /opt/java/
ln -sfn /opt/java/jdk-${java_version} /opt/java/current
