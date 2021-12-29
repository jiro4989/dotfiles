#!/bin/bash

set -eux

mkdir -p /tmp/work
cd /tmp/work

curl -O https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz
tar xvf openjdk-17+35_linux-x64_bin.tar.gz

java_version=17
mkdir -p /opt/java
mv jdk-${java_version} /opt/java/
ln -sfn /opt/java/jdk-${java_version} /opt/java/current
