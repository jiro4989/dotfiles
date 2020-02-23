#!/bin/bash

set -eu

readonly VERSION=2.5.1
readonly DEB_FILE=semaphore_${VERSION}_linux_amd64.deb
readonly URL="https://github.com/ansible-semaphore/semaphore/releases/download/v${VERSION}/$DEB_FILE"
curl -sSfL "$URL" > "$DEB_FILE"
sudo dpkg -i "$DEB_FILE"
rm "$DEB_FILE"
