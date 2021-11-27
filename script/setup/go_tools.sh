#!/bin/bash

set -eux

cd /tmp
export GO111MODULE=on
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports@latest
