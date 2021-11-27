#!/bin/bash

set -eux

cd /tmp
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
