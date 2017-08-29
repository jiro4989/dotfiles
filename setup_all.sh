#!/bin/bash

sudo apt-get update -y

sh setup_basic.sh
sh setup_vim.sh
sh setup_java.sh
sh setup_go.sh
sh setup_python.sh
sh setup_private.sh

sudo apt-get update -y
