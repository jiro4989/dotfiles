#!/bin/bash

set -eux

export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
./bin/install_go 1.17
export GO111MODULE=on
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports@latest
