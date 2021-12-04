#!/bin/bash

set -eux

user="${WORKUSER:-$USER}"

install -o "${user}" -g "${user}" -m 0700 -d ~/.ssh
cp -r "${MOUNT_HOME}/.ssh/config" ~/.ssh/
cp -r "${MOUNT_HOME}/.ssh/conf.d" ~/.ssh/
chmod 0600 ~/.ssh/conf.d/*
chmod 0700 ~/.ssh/conf.d
chown -R "${user}":"${user}" ~/.ssh/conf.d
