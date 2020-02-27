#!/bin/bash

set -eu

#sudo snap install --classic code
while read -r pkg; do
  code --install-extension "$pkg"
done < conf/.config/Code/extensions.txt
