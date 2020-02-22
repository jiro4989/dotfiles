#!/bin/bash

docker run --rm -v $PWD:/dotfiles -it ubuntu:19.10 bash /dotfiles/setup.sh
#docker run --rm -v $PWD:/tmp -it ubuntu:19.10 bash /tmp/setup.sh
