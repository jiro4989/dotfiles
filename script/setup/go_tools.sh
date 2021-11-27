#!/bin/bash

set -eux

go get -v -u golang.org/x/tools/gopls
go get -v -u golang.org/x/tools/cmd/goimports
