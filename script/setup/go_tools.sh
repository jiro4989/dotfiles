#!/bin/bash

set -eux

cd /tmp
export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
export GO111MODULE=on
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports@latest
