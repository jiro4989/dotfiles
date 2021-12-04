#!/bin/bash

set -eux

apt-get update -y
apt-get install -y docker.io

readonly DOCKERCOMPOSE_VERSION=1.25.4

inst() {
  curl -sSfL "\$1" -o "\$2"
  install -m 0755 "\$2" "/usr/local/bin/\$2"
}

curl -o docker-compose -sSfL "https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
install -m 0755 docker-compose /usr/local/bin/

usermod -a -G docker "${WORKUSER:-$USER}"
