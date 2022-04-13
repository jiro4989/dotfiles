#!/bin/bash
#
# See:
# https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html

set -eux

cd /tmp/work
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
./sam-installation/install
sam --version
rm -rf sam-installation
rm -f aws-sam-cli-linux-x86_64.zip
