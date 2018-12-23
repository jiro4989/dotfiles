#!/bin/bash

sudo apt-get install dselect
sudo dselect update
sudo dpkg --clear-selections
sudo dpkg --set-selections < ubuntu/pkgs.list
sudo apt-get dselect-upgrade
sudo apt-get autoremove
