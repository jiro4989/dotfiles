#!/bin/bash

set -eux

git config --global user.name "$USER"
git config --global user.email "$USER"
git config --global alias.preq pull-request
git config --global alias.see browse
git config --global ghq.root ~/src
