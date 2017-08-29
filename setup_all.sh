#!/bin/bash

sudo apt-get update -y

bash setup_basic.sh
bash setup_vim.sh
bash setup_java.sh
bash setup_python.sh
bash setup_go.sh
bash setup_private.sh

sudo apt-get update -y
