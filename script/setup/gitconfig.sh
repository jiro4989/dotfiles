#!/bin/bash

set -eux

git config --global user.name "${WORKUSER:-$USER}"
git config --global user.email "${WORKUSER:-$USER}"
git config --global alias.preq pull-request
git config --global alias.see browse
git config --global ghq.root ~/src
