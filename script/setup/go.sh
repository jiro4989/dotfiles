#!/bin/bash

set -eux

(
  cd /usr/local
  wget -q https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
  tar xzf go*.linux-amd64.tar.gz
)
