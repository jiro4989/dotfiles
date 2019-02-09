#!/bin/bash

set -eu

sudo apt update
sudo apt install -y python3
sudo apt install -y python3-pip
pip3 install ansible
