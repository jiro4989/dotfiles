#!/bin/bash

set -eux

cd /tmp

# go-task
wget https://github.com/go-task/task/releases/download/v3.0.0/task_linux_amd64.deb
sudo dpkg -i ./task_linux_amd64.deb

git clone https://github.com/jiro4989/dotfiles
cd dotfiles
task setup
